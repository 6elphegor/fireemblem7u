// The Petal tome's spell effect (mod/claude): a stream of coral petals from
// the caster's hand to the target, a swirl around it, then a burst of
// petals and sparkles as it lands.
//
// One effect anim draws every petal: each frame the proc writes the anim's
// sprite list (struct AnimSpriteData, screen coordinates, the anim at 0, 0)
// into a scratch buffer and points the anim at it.  Sprites: the spell's
// OBJ tiles (SpellFx_RegisterObjGfx, tile 0x40, OBJ palette 2) from
// mod/claude/art/petalfx.py: small petals tiles 0-7 (8x8), large petals
// 64 + 2k (16x16), sparkles 8 and 9.  Timing follows StartSpellAnimFire:
// the camera pans, the hit lands, the spell ends, at the same frames.

#include "gbafe.h"

#if MOD_CLAUDE

void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);

extern const u8 Img_PetalFx[];
extern const u16 Pal_PetalFx[];

// the last 0x500 bytes of the spell BG graphics buffer: this spell has no
// BG (the level-up box, drawn after the battle, uses its first 0x400)
extern u8 gSpellAnimBgfx[];
#define PETAL_SPRITES ((struct AnimSpriteData *) (gSpellAnimBgfx + 0x1800))
#define PETAL_SPRITES_MAX (0x500 / sizeof(struct AnimSpriteData) - 1)

#define PETAL_COUNT 40
#define SPARKLE_COUNT 12

struct ProcPetalFx {
    PROC_HEADER;

    u8 missed;
    s16 timer;
    struct Anim * anim;
    struct Anim * fx;
    s16 t_pan, t_hit, t_end;
};
PROC_SIZE_CHECK(struct ProcPetalFx);

static const s16 sQuarterSine[65] = {
    0, 6, 13, 19, 25, 31, 38, 44, 50, 56, 62, 68, 74,
    80, 86, 92, 98, 104, 109, 115, 121, 126, 132, 137, 142, 147,
    152, 157, 162, 167, 172, 177, 181, 185, 190, 194, 198, 202, 206,
    209, 213, 216, 220, 223, 226, 229, 231, 234, 237, 239, 241, 243,
    245, 247, 248, 250, 251, 252, 253, 254, 255, 255, 256, 256, 256,
};

// sin of a 256-step angle, 8.8 fixed point
static int Sin8(int a)
{
    a &= 0xFF;
    if (a < 64)
        return sQuarterSine[a];
    if (a < 128)
        return sQuarterSine[128 - a];
    if (a < 192)
        return -sQuarterSine[a - 128];
    return -sQuarterSine[256 - a];
}

static int Cos8(int a)
{
    return Sin8(a + 64);
}

// a small fixed hash: each petal's own arc, wobble, spin and size
static int Hash(int i, int salt)
{
    unsigned x = (unsigned) (i * 2654435761u) ^ (unsigned) (salt * 40503u);
    x ^= x >> 13;
    x *= 0x5BD1E995u;
    x ^= x >> 15;
    return (int) (x & 0xFFFF);
}

static struct AnimSpriteData * PutPetal(struct AnimSpriteData * it, int x, int y, int big, int frame, int flip)
{
    if (x < -24 || x > 248 || y < -24 || y > 168)
        return it;
    if (big)
    {
        it->header = 0x40000000 | (flip ? 0x10000000 : 0); // 16x16
        it->as.object.oam2 = 64 + 2 * (frame & 7);
        it->as.object.x = x - 8;
        it->as.object.y = y - 8;
    }
    else
    {
        it->header = flip ? 0x10000000 : 0; // 8x8
        it->as.object.oam2 = frame & 7;
        it->as.object.x = x - 4;
        it->as.object.y = y - 4;
    }
    return it + 1;
}

// Where the petals start and end: the caster's raised mitten, the target's
// middle.  Anim positions are the units' feet, in screen coordinates (they
// move with the camera when it pans to a distant target).
static void PetalFx_Ends(struct ProcPetalFx * proc, int * sx, int * sy, int * tx, int * ty)
{
    struct Anim * target = GetAnimAnotherSide(proc->anim);
    int dir = GetAnimPosition(proc->anim) == EKR_POS_L ? 1 : -1;

    *sx = proc->anim->xPosition + dir * 16;
    *sy = proc->anim->yPosition - 22;
    *tx = target->xPosition;
    *ty = target->yPosition - 18;
}

static void PetalFx_Draw(struct ProcPetalFx * proc)
{
    struct AnimSpriteData * it = PETAL_SPRITES;
    struct AnimSpriteData * end = PETAL_SPRITES + PETAL_SPRITES_MAX - 2;
    int t = proc->timer;
    int sx, sy, tx, ty, i;

    PetalFx_Ends(proc, &sx, &sy, &tx, &ty);

    for (i = 0; i < PETAL_COUNT && it < end; i++)
    {
        int launch = 2 + i * 5 / 8;               // a stream over ~25 frames
        int travel = 22 + (Hash(i, 1) & 7);       // frames to reach the target
        int big = (i % 3) == 0;
        int spin = 1 + (Hash(i, 2) & 3);
        int flip = Hash(i, 3) & 1;
        int frame = (t * spin / 3 + i) & 7;
        int x, y, age = t - launch;

        if (age < 0)
            continue;

        if (t < proc->t_hit && age < travel)
        {
            // flying: along the line, an arc up and a flutter
            int p = age * 256 / travel;           // 0..255
            int arc = 12 + (Hash(i, 4) & 15);
            int phase = Hash(i, 5) & 0xFF;

            x = sx + (tx - sx) * p / 256 + Sin8(phase + t * 9) * 3 / 256;
            y = sy + (ty - sy) * p / 256 - arc * Sin8(p / 2) / 256 + Sin8(phase + t * 13) * 4 / 256;
        }
        else if (t < proc->t_hit)
        {
            // arrived: swirl around the target
            int a = i * 256 / PETAL_COUNT + t * 6;
            int r = 14 + (Hash(i, 6) & 7) + Sin8(t * 8 + i * 20) * 3 / 256;

            x = tx + Cos8(a) * r / 256;
            y = ty + Sin8(a) * r * 3 / 4 / 256;
        }
        else
        {
            // the burst: the swirl flies apart, the large petals shrink
            int dt = t - proc->t_hit;
            int a = i * 256 / PETAL_COUNT + proc->t_hit * 6 + dt * 3;
            int r = 18 + (Hash(i, 6) & 7) + dt * (3 + (Hash(i, 7) & 1));

            if (dt > 24 || r > 90)
                continue;
            if (dt > 10)
                big = 0;
            if (proc->missed)
                a += 32;
            x = tx + Cos8(a) * r / 256;
            y = ty + Sin8(a) * r * 3 / 4 / 256 + dt * dt / 16;
        }
        it = PutPetal(it, x, y, big, frame, flip);
    }

    // sparkles around the target as the burst opens
    if (!proc->missed && t >= proc->t_hit && t < proc->t_hit + 18)
    {
        int dt = t - proc->t_hit;

        for (i = 0; i < SPARKLE_COUNT && it < end; i++)
        {
            int a = Hash(i, 8) & 0xFF;
            int r = 8 + (Hash(i, 9) & 31) + dt;

            if (((dt + i) & 3) == 3)
                continue; // twinkle
            it->header = 0;
            it->as.object.oam2 = 8 + (((dt >> 2) + i) & 1);
            it->as.object.x = tx + Cos8(a) * r / 256 - 4;
            it->as.object.y = ty + Sin8(a) * r / 256 - 4;
            it++;
        }
    }

    it->header = 1;
    proc->fx->pSpriteData = PETAL_SPRITES;
}

static const struct AnimSpriteData sPetalFxEmpty[] CONST_DATA = { ANIM_SPRITE_END };

static const AnimScr sAnimScr_PetalFx[] CONST_DATA = {
    ANIMSCR_FORCE_SPRITE(sPetalFxEmpty, 1),
    ANIMSCR_BLOCKED,
};

static void PetalFx_Loop(struct ProcPetalFx * proc)
{
    struct Anim * target = GetAnimAnotherSide(proc->anim);
    int t = ++proc->timer;

    if (t == 1)
    {
        SpellFx_RegisterObjPal(Pal_PetalFx, 0x20);
        SpellFx_RegisterObjGfx(Img_PetalFx, 0x1000);
        proc->fx = AnimCreate(sAnimScr_PetalFx, 0x78);
        proc->fx->oam2Base = 0x2840; // tile 0x40, OBJ palette 2, priority 2
        proc->fx->xPosition = 0;
        proc->fx->yPosition = 0;
        PlaySFX(0x2BF, 0x100, proc->anim->xPosition, 1); // Excalibur's wind
    }

    if (t == proc->t_pan)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (t == proc->t_hit)
    {
        target->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(target, proc->missed);

        if (!proc->missed)
        {
            PlaySFX(0x2C0, 0x100, target->xPosition, 1);
            EfxPlayHittedSFX(target);
        }
    }

    if (t >= 2)
        PetalFx_Draw(proc);

    if (t == proc->t_end)
    {
        AnimDelete(proc->fx);
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

static const struct ProcCmd ProcScr_PetalFx[] CONST_DATA = {
    PROC_19,
    PROC_REPEAT(PetalFx_Loop),
    PROC_END,
};

void StartSpellAnimPetal(struct Anim * anim)
{
    struct ProcPetalFx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_PetalFx, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->missed = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    // the frames of StartSpellAnimFire's camera pan, hit and end
    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        proc->t_pan = 0x20;
        proc->t_hit = 0x34;
        proc->t_end = 0x55;
    }
    else
    {
        proc->t_pan = 0x28;
        proc->t_hit = 0x3C;
        proc->t_end = 0x60;
    }
}

#endif // MOD_CLAUDE
