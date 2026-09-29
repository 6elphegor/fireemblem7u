#include "gbafe.h"

void StartSwingSwordfx(ProcPtr proc);

extern u8 CONST_DATA Img_NinianDragonSprite[];
extern u16 CONST_DATA SpriteAnim_NinianDragon[];

void EventCall_SwingSwordfx(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        StartSwingSwordfx(proc);
}

void EventCall_NinianReturnToHuman(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        struct Unit * unit = GetUnitFromCharId(0xDA);

        NinianStartTransformToHunman((struct Proc *) proc, unit->xPos, unit->yPos);

        ClearUnit(unit);
        RefreshUnitSprites();
        RefreshEntityMaps();
    }
}

void EventCall_HideNinianDragonSMS(void)
{
    HideUnitSprite(GetUnitFromCharId(0xDA));
}

void EventCall_NinianDragonTrembling(struct EventProc * proc)
{
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped == 0)
    {
        struct Unit * unit = GetUnitFromCharId(0xDA);

        int x = unit->xPos * 16 - gBmSt.camera.x + 8;
        int y = unit->yPos * 16 - gBmSt.camera.y;

        Decompress(Img_NinianDragonSprite, (void *) (VRAM + 0x13000));
        StartSpriteAnimProc(SpriteAnim_NinianDragon, x, y, 0xC180, skipped, skipped);

        CallDelayed(EventCall_HideNinianDragonSMS, 1);
    }
}

void EventCall_PutFallNinian(void)
{
    struct Unit * unit = GetUnitFromCharId(0xDA);

    if (unit != NULL)
    {
        ShowUnitSprite(unit);
        EndEachSpriteAnimProc();
    }
}
