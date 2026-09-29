#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxLiveOBJ1_08BBC6DC[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFE1C[], AnimSprite_EfxReblowOBJ_Left1_08BBFE40[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFE70[], AnimSprite_EfxReblowOBJ_Left1_08BBFEA0[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFEE8[], AnimSprite_EfxReblowOBJ_Left1_08BBFF30[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFF78[], AnimSprite_EfxReblowOBJ_Left1_08BBFFD8[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0038[], AnimSprite_EfxReblowOBJ_Left1_08BC0098[],
    AnimSprite_EfxReblowOBJ_Left1_08BC00F8[], AnimSprite_EfxReblowOBJ_Left1_08BC0170[],
    AnimSprite_EfxReblowOBJ_Left1_08BC01E8[], AnimSprite_EfxReblowOBJ_Left1_08BC0248[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0590[], AnimSprite_EfxReblowOBJ_Left1_08BC059C[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0614[], AnimSprite_EfxReblowOBJ_Left1_08BC0668[],
    AnimSprite_EfxReblowOBJ_Left1_08BC06BC[], AnimSprite_EfxReblowOBJ_Left1_08BC0710[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0758[], AnimSprite_EfxReblowOBJ_Left1_08BC07A0[],
    AnimSprite_EfxReblowOBJ_Left1_08BC07C4[], AnimSprite_EfxReblowOBJ_Left1_08BC07E8[],
    AnimSprite_EfxReblowOBJ_Left1_08BC080C[], AnimSprite_EfxReblowOBJ_Left1_08BC0824[],
    AnimSprite_EfxReblowOBJ_Left1_08BC083C[], AnimSprite_EfxReblowOBJ_Left2_08BC02C0[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0338[], AnimSprite_EfxReblowOBJ_Left2_08BC038C[],
    AnimSprite_EfxReblowOBJ_Left2_08BC03D4[], AnimSprite_EfxReblowOBJ_Left2_08BC0410[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0440[], AnimSprite_EfxReblowOBJ_Left2_08BC0470[],
    AnimSprite_EfxReblowOBJ_Left2_08BC04A0[], AnimSprite_EfxReblowOBJ_Left2_08BC04D0[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0500[], AnimSprite_EfxReblowOBJ_Left2_08BC0530[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0560[], AnimSprite_EfxReblowOBJ_Left2_08BC0860[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0D28[], AnimSprite_EfxReblowOBJ_Right1_08BBE81C[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE840[], AnimSprite_EfxReblowOBJ_Right1_08BBE870[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE8A0[], AnimSprite_EfxReblowOBJ_Right1_08BBE8E8[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE930[], AnimSprite_EfxReblowOBJ_Right1_08BBE978[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE9D8[], AnimSprite_EfxReblowOBJ_Right1_08BBEA38[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEA98[], AnimSprite_EfxReblowOBJ_Right1_08BBEAF8[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEB70[], AnimSprite_EfxReblowOBJ_Right1_08BBEBE8[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEC48[], AnimSprite_EfxReblowOBJ_Right1_08BBEF90[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEF9C[], AnimSprite_EfxReblowOBJ_Right1_08BBF014[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF068[], AnimSprite_EfxReblowOBJ_Right1_08BBF0BC[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF110[], AnimSprite_EfxReblowOBJ_Right1_08BBF158[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF1A0[], AnimSprite_EfxReblowOBJ_Right1_08BBF1C4[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF1E8[], AnimSprite_EfxReblowOBJ_Right1_08BBF20C[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF224[], AnimSprite_EfxReblowOBJ_Right1_08BBF23C[],
    AnimSprite_EfxReblowOBJ_Right2_08BBECC0[], AnimSprite_EfxReblowOBJ_Right2_08BBED38[],
    AnimSprite_EfxReblowOBJ_Right2_08BBED8C[], AnimSprite_EfxReblowOBJ_Right2_08BBEDD4[],
    AnimSprite_EfxReblowOBJ_Right2_08BBEE10[], AnimSprite_EfxReblowOBJ_Right2_08BBEE40[],
    AnimSprite_EfxReblowOBJ_Right2_08BBEE70[], AnimSprite_EfxReblowOBJ_Right2_08BBEEA0[],
    AnimSprite_EfxReblowOBJ_Right2_08BBEED0[], AnimSprite_EfxReblowOBJ_Right2_08BBEF00[],
    AnimSprite_EfxReblowOBJ_Right2_08BBEF30[], AnimSprite_EfxReblowOBJ_Right2_08BBEF60[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF260[], AnimSprite_EfxReblowOBJ_Right2_08BBF728[];

extern u16 Img_RestoreBg_00[], Img_RestoreBg_06[], Img_RestoreBg_09[], Img_RestoreBg_0B[],
    Tsa_FortifyBg2_00[], Tsa_Fortify_00[], Tsa_Fortify_01[], Tsa_Fortify_02[], Tsa_Fortify_03[],
    Tsa_RestoreBg_00[], Tsa_RestoreBg_01[], Tsa_RestoreBg_02[], Tsa_RestoreBg_03[],
    Tsa_RestoreBg_04[], Tsa_RestoreBg_05[], Tsa_RestoreBg_06[], Tsa_RestoreBg_07[],
    Tsa_RestoreBg_08[], Tsa_RestoreBg_09[], Tsa_RestoreBg_0A[], Tsa_RestoreBg_0B[],
    Tsa_RestoreBg_0C[];

extern const struct AnimSpriteData AnimSprite_EfxLiveOBJ1_08BBB9BC[],
    AnimSprite_EfxLiveOBJ1_08BBB9E0[], AnimSprite_EfxLiveOBJ1_08BBBA10[],
    AnimSprite_EfxLiveOBJ1_08BBBA40[], AnimSprite_EfxLiveOBJ1_08BBBA70[],
    AnimSprite_EfxLiveOBJ1_08BBBAB8[], AnimSprite_EfxLiveOBJ1_08BBBB00[],
    AnimSprite_EfxLiveOBJ1_08BBBB48[], AnimSprite_EfxLiveOBJ1_08BBBB90[],
    AnimSprite_EfxLiveOBJ1_08BBBBD8[], AnimSprite_EfxLiveOBJ1_08BBBC38[],
    AnimSprite_EfxLiveOBJ1_08BBBCB0[], AnimSprite_EfxLiveOBJ1_08BBBD28[],
    AnimSprite_EfxLiveOBJ1_08BBBDA0[], AnimSprite_EfxLiveOBJ1_08BBBE24[],
    AnimSprite_EfxLiveOBJ1_08BBBEA8[], AnimSprite_EfxLiveOBJ1_08BBBF2C[],
    AnimSprite_EfxLiveOBJ1_08BBBFB0[], AnimSprite_EfxLiveOBJ1_08BBC028[],
    AnimSprite_EfxLiveOBJ1_08BBC0A0[], AnimSprite_EfxLiveOBJ1_08BBC118[],
    AnimSprite_EfxLiveOBJ1_08BBC190[], AnimSprite_EfxLiveOBJ1_08BBC208[],
    AnimSprite_EfxLiveOBJ1_08BBC28C[], AnimSprite_EfxLiveOBJ1_08BBC310[],
    AnimSprite_EfxLiveOBJ1_08BBC394[], AnimSprite_EfxLiveOBJ1_08BBC418[],
    AnimSprite_EfxLiveOBJ1_08BBC49C[], AnimSprite_EfxLiveOBJ1_08BBC520[],
    AnimSprite_EfxLiveOBJ1_08BBC598[], AnimSprite_EfxLiveOBJ1_08BBC5E0[],
    AnimSprite_EfxLiveOBJ1_08BBC628[], AnimSprite_EfxLiveOBJ1_08BBC670[],
    AnimSprite_EfxLiveOBJ1_08BBC6B8[], AnimSprite_EfxLiveOBJ1_08BBC6DC[],
    AnimSprite_EfxLiveOBJ2_08BBD5C4[], AnimSprite_EfxLiveOBJ2_08BBD5E8[],
    AnimSprite_EfxLiveOBJ2_08BBD618[], AnimSprite_EfxLiveOBJ2_08BBD660[],
    AnimSprite_EfxLiveOBJ2_08BBD69C[], AnimSprite_EfxLiveOBJ2_08BBD6F0[],
    AnimSprite_EfxLiveOBJ2_08BBD744[], AnimSprite_EfxLiveOBJ2_08BBD798[],
    AnimSprite_EfxLiveOBJ2_08BBD7EC[], AnimSprite_EfxLiveOBJ2_08BBD840[],
    AnimSprite_EfxLiveOBJ2_08BBD894[], AnimSprite_EfxLiveOBJ2_08BBD8E8[],
    AnimSprite_EfxLiveOBJ2_08BBD93C[], AnimSprite_EfxLiveOBJ2_08BBD990[],
    AnimSprite_EfxLiveOBJ2_08BBD9E4[], AnimSprite_EfxLiveOBJ2_08BBDA38[],
    AnimSprite_EfxLiveOBJ2_08BBDA8C[], AnimSprite_EfxLiveOBJ2_08BBDAE0[],
    AnimSprite_EfxLiveOBJ2_08BBDB34[], AnimSprite_EfxLiveOBJ2_08BBDB88[],
    AnimSprite_EfxLiveOBJ2_08BBDBDC[], AnimSprite_EfxLiveOBJ2_08BBDC30[],
    AnimSprite_EfxLiveOBJ2_08BBDC84[], AnimSprite_EfxLiveOBJ2_08BBDCD8[],
    AnimSprite_EfxLiveOBJ2_08BBDD2C[], AnimSprite_EfxLiveOBJ2_08BBDD80[],
    AnimSprite_EfxLiveOBJ2_08BBDDD4[], AnimSprite_EfxLiveOBJ2_08BBDE28[],
    AnimSprite_EfxLiveOBJ2_08BBDE7C[], AnimSprite_EfxLiveOBJ2_08BBDED0[],
    AnimSprite_EfxLiveOBJ2_08BBDF24[], AnimSprite_EfxLiveOBJ2_08BBDF78[],
    AnimSprite_EfxLiveOBJ2_08BBDFCC[], AnimSprite_EfxLiveOBJ2_08BBE020[],
    AnimSprite_EfxLiveOBJ2_08BBE074[], AnimSprite_EfxLiveOBJ2_08BBE0C8[],
    AnimSprite_EfxLiveOBJ2_08BBE11C[], AnimSprite_EfxLiveOBJ2_08BBE170[],
    AnimSprite_EfxLiveOBJ2_08BBE1C4[], AnimSprite_EfxLiveOBJ2_08BBE218[],
    AnimSprite_EfxLiveOBJ2_08BBE284[], AnimSprite_EfxLiveOBJ2_08BBE2D8[],
    AnimSprite_EfxLiveOBJ2_08BBE344[], AnimSprite_EfxLiveOBJ2_08BBE398[],
    AnimSprite_EfxLiveOBJ2_08BBE3EC[], AnimSprite_EfxLiveOBJ2_08BBE440[],
    AnimSprite_EfxLiveOBJ2_08BBE4A0[], AnimSprite_EfxLiveOBJ2_08BBE500[],
    AnimSprite_EfxLiveOBJ2_08BBE554[], AnimSprite_EfxLiveOBJ2_08BBE5A8[],
    AnimSprite_EfxLiveOBJ2_08BBE5E4[], AnimSprite_EfxLiveOBJ2_08BBE638[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFE1C[], AnimSprite_EfxReblowOBJ_Left1_08BBFE40[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFE70[], AnimSprite_EfxReblowOBJ_Left1_08BBFEA0[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFEE8[], AnimSprite_EfxReblowOBJ_Left1_08BBFF30[],
    AnimSprite_EfxReblowOBJ_Left1_08BBFF78[], AnimSprite_EfxReblowOBJ_Left1_08BBFFD8[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0038[], AnimSprite_EfxReblowOBJ_Left1_08BC0098[],
    AnimSprite_EfxReblowOBJ_Left1_08BC00F8[], AnimSprite_EfxReblowOBJ_Left1_08BC0170[],
    AnimSprite_EfxReblowOBJ_Left1_08BC01E8[], AnimSprite_EfxReblowOBJ_Left1_08BC0248[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0590[], AnimSprite_EfxReblowOBJ_Left1_08BC059C[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0614[], AnimSprite_EfxReblowOBJ_Left1_08BC0668[],
    AnimSprite_EfxReblowOBJ_Left1_08BC06BC[], AnimSprite_EfxReblowOBJ_Left1_08BC0710[],
    AnimSprite_EfxReblowOBJ_Left1_08BC0758[], AnimSprite_EfxReblowOBJ_Left1_08BC07A0[],
    AnimSprite_EfxReblowOBJ_Left1_08BC07C4[], AnimSprite_EfxReblowOBJ_Left1_08BC07E8[],
    AnimSprite_EfxReblowOBJ_Left1_08BC080C[], AnimSprite_EfxReblowOBJ_Left1_08BC0824[],
    AnimSprite_EfxReblowOBJ_Left1_08BC083C[], AnimSprite_EfxReblowOBJ_Left2_08BC0860[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0878[], AnimSprite_EfxReblowOBJ_Left2_08BC089C[],
    AnimSprite_EfxReblowOBJ_Left2_08BC08CC[], AnimSprite_EfxReblowOBJ_Left2_08BC08FC[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0938[], AnimSprite_EfxReblowOBJ_Left2_08BC0974[],
    AnimSprite_EfxReblowOBJ_Left2_08BC09B0[], AnimSprite_EfxReblowOBJ_Left2_08BC09EC[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0A28[], AnimSprite_EfxReblowOBJ_Left2_08BC0A64[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0AAC[], AnimSprite_EfxReblowOBJ_Left2_08BC0AF4[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0B48[], AnimSprite_EfxReblowOBJ_Left2_08BC0B9C[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0BF0[], AnimSprite_EfxReblowOBJ_Left2_08BC0C44[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0C98[], AnimSprite_EfxReblowOBJ_Left2_08BC0CE0[],
    AnimSprite_EfxReblowOBJ_Left2_08BC0D10[], AnimSprite_EfxReblowOBJ_Left2_08BC0D28[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE81C[], AnimSprite_EfxReblowOBJ_Right1_08BBE840[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE870[], AnimSprite_EfxReblowOBJ_Right1_08BBE8A0[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE8E8[], AnimSprite_EfxReblowOBJ_Right1_08BBE930[],
    AnimSprite_EfxReblowOBJ_Right1_08BBE978[], AnimSprite_EfxReblowOBJ_Right1_08BBE9D8[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEA38[], AnimSprite_EfxReblowOBJ_Right1_08BBEA98[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEAF8[], AnimSprite_EfxReblowOBJ_Right1_08BBEB70[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEBE8[], AnimSprite_EfxReblowOBJ_Right1_08BBEC48[],
    AnimSprite_EfxReblowOBJ_Right1_08BBEF90[], AnimSprite_EfxReblowOBJ_Right1_08BBEF9C[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF014[], AnimSprite_EfxReblowOBJ_Right1_08BBF068[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF0BC[], AnimSprite_EfxReblowOBJ_Right1_08BBF110[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF158[], AnimSprite_EfxReblowOBJ_Right1_08BBF1A0[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF1C4[], AnimSprite_EfxReblowOBJ_Right1_08BBF1E8[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF20C[], AnimSprite_EfxReblowOBJ_Right1_08BBF224[],
    AnimSprite_EfxReblowOBJ_Right1_08BBF23C[], AnimSprite_EfxReblowOBJ_Right2_08BBF260[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF278[], AnimSprite_EfxReblowOBJ_Right2_08BBF29C[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF2CC[], AnimSprite_EfxReblowOBJ_Right2_08BBF2FC[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF338[], AnimSprite_EfxReblowOBJ_Right2_08BBF374[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF3B0[], AnimSprite_EfxReblowOBJ_Right2_08BBF3EC[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF428[], AnimSprite_EfxReblowOBJ_Right2_08BBF464[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF4AC[], AnimSprite_EfxReblowOBJ_Right2_08BBF4F4[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF548[], AnimSprite_EfxReblowOBJ_Right2_08BBF59C[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF5F0[], AnimSprite_EfxReblowOBJ_Right2_08BBF644[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF698[], AnimSprite_EfxReblowOBJ_Right2_08BBF6E0[],
    AnimSprite_EfxReblowOBJ_Right2_08BBF710[], AnimSprite_EfxReblowOBJ_Right2_08BBF728[],
    AnimSprite_EfxRestOBJ_08BC141C[], AnimSprite_EfxRestOBJ_08BC1434[],
    AnimSprite_EfxRestOBJ_08BC1458[], AnimSprite_EfxRestOBJ_08BC1494[],
    AnimSprite_EfxRestOBJ_08BC14E8[], AnimSprite_EfxRestOBJ_08BC1554[],
    AnimSprite_EfxRestOBJ_08BC15D8[], AnimSprite_EfxRestOBJ_08BC1674[],
    AnimSprite_EfxRestOBJ_08BC1734[], AnimSprite_EfxRestOBJ_08BC1818[],
    AnimSprite_EfxRestOBJ_08BC1920[], AnimSprite_EfxRestOBJ_08BC1A4C[],
    AnimSprite_EfxRestOBJ_08BC1B9C[], AnimSprite_EfxRestOBJ_08BC1D04[],
    AnimSprite_EfxRestOBJ_08BC1E84[], AnimSprite_EfxRestOBJ_08BC2028[],
    AnimSprite_EfxRestOBJ_08BC21E4[], AnimSprite_EfxRestOBJ_08BC23B8[],
    AnimSprite_EfxRestOBJ_08BC2598[], AnimSprite_EfxRestOBJ_08BC2784[],
    AnimSprite_EfxRestOBJ_08BC2970[], AnimSprite_EfxRestOBJ_08BC2B50[],
    AnimSprite_EfxRestOBJ_08BC2D24[], AnimSprite_EfxRestOBJ_08BC2EEC[],
    AnimSprite_EfxRestOBJ_08BC3090[], AnimSprite_EfxRestOBJ_08BC3210[],
    AnimSprite_EfxRestOBJ_08BC3378[], AnimSprite_EfxRestOBJ_08BC34C8[],
    AnimSprite_EfxRestOBJ_08BC35F4[], AnimSprite_EfxRestOBJ_08BC36FC[],
    AnimSprite_EfxRestOBJ_08BC37EC[], AnimSprite_EfxRestOBJ_08BC38C4[],
    AnimSprite_EfxRestOBJ_08BC3984[], AnimSprite_EfxRestOBJ_08BC3A20[],
    AnimSprite_EfxRestOBJ_08BC3AB0[], AnimSprite_EfxRestOBJ_08BC3B28[],
    AnimSprite_EfxRestOBJ_08BC3B88[], AnimSprite_EfxRestOBJ_08BC3BD0[],
    AnimSprite_EfxRestOBJ_08BC3C0C[], AnimSprite_EfxRestOBJ_08BC3C3C[],
    AnimSprite_EfxRestOBJ_08BC3C60[], AnimSprite_EfxRestOBJ_08BC3C78[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxHpBarLive(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void sub_0805076C(void);
void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c);
extern const struct ProcCmd ProcScr_efxLive[];
extern const struct ProcCmd ProcScr_efxRelive[];
extern const struct ProcCmd ProcScr_efxRecover[];
extern const struct ProcCmd ProcScr_efxReblow[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxLiveBG[];
extern const u16 gUnknown_081E8CB0[];
extern u16 * Tsa_HealSpellBg[];
extern u16 Img_HealSpellBg[];
extern const u16 gUnknown_081E8CBC[];
extern u16 * Tsa_EfxLiveBG_B_L[];
extern u16 * Tsa_EfxLiveBG_B_R[];
extern u16 Img_EfxLiveBG_B[];
extern const u16 gUnknown_081E8CB6[];
extern const u16 gUnknown_081E8CC2[];
extern const struct ProcCmd ProcScr_efxLiveBGCOL[];
extern const u16 gUnknown_081E8CC8[];
extern const u16 gUnknown_081E8D4C[];
extern const u16 gUnknown_081E8D7E[];
extern u16 Pal_HealSpellBg[];
extern u16 Pal_0826C934[];
extern u16 Pal_0826C714[];
extern const u16 gUnknown_081E8D0A[];
extern const struct ProcCmd ProcScr_efxLiveALPHA[];
extern const struct ProcCmd ProcScr_efxLiveOBJ[];
extern const AnimScr AnimScr_EfxLiveOBJ1[];
extern u16 Pal_HealSprites_Sparkles[];
extern u16 Img_HealSprites_Sparkles[];
extern const struct ProcCmd ProcScr_efxReserveOBJ[];
extern const AnimScr AnimScr_EfxLiveOBJ2[];
extern const struct ProcCmd ProcScr_efxReblowOBJ[];
extern const AnimScr AnimScr_EfxReblowOBJ_Right1[];
extern const AnimScr AnimScr_EfxReblowOBJ_Left1[];
extern const AnimScr AnimScr_EfxReblowOBJ_Right2[];
extern const AnimScr AnimScr_EfxReblowOBJ_Left2[];
extern const struct ProcCmd ProcScr_efxReserve[];
extern const struct ProcCmd ProcScr_efxReserveBG[];
extern u16 * const TsaArray_Fortify[];
extern const struct ProcCmd ProcScr_efxReserveBGCOL[];
extern u16 Pal_0826D3D4[];
extern u16 Pal_0826D5D4[];
extern const struct ProcCmd ProcScr_efxReserveBG2[];
extern u16 * const TsaArray_FortifyBg2[];
extern struct Anim * gUnknown_02000010[2];
extern const struct ProcCmd ProcScr_efxReserveBGCOL2[];
extern u16 Pal_0826D7D4[];
extern const struct ProcCmd ProcScr_efxRest[];
extern const struct ProcCmd ProcScr_efxRestBG[];
extern u16 * const TsaArray_RestoreBg[];
extern u16 * const ImgArray_RestoreBg[];
extern u16 Pal_MapAnimRestore[];
extern const struct ProcCmd ProcScr_efxRestOBJ[];
extern const AnimScr AnimScr_EfxRestOBJ[];
extern u16 Pal_SleepSprites[];
extern u16 Img_SleepSprites[];

void StartSpellAnimHeal(struct Anim * anim);
void efxLive_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimMend(struct Anim * anim);
void efxRelive_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimRecover(struct Anim * anim);
void efxRecover_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimPhysic(struct Anim * anim);
void efxReblow_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind);
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind);
void efxLiveBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLiveBGCOL_A(struct Anim * anim, u32 kind);
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind);
void efxLiveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d);
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc);
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc);
void StartSubSpell_efxLiveOBJ(struct Anim * anim);
void StartSubSpell_efxReserveOBJ(struct Anim * anim);
void efxLiveOBJ_Loop(struct ProcEfxOBJ * proc);
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc);
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind);
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc);
void StartSpellAnimFortify(struct Anim * anim);
void StartSpellAnimLatona(struct Anim * anim);
void efxReserve_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxReserveBG(struct Anim * anim);
void efxReserveBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind);
void efxReserveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxReserveBG2(struct Anim * anim);
void efxReserveBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind);
void efxReserveBGCOL2_Loop(struct ProcEfxBGCOL * proc);
void StartSpellAnimRestore(struct Anim * anim);
void efxRest_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxRestBG(struct Anim * anim);
void efxRestBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxRestOBJ(struct Anim * anim);
void efxRestOBJ_Loop(void);

extern const u16 StartSubSpell_efxReserveBG_frames[];
extern const u16 efxReserveBG_Loop_songIds[];
extern const u16 efxReserveBG_Loop_positions[];
extern const u16 StartSubSpell_efxReserveBGCOL_frames[];
extern const u16 StartSubSpell_efxReserveBG2_frames[];
extern const u16 StartSubSpell_efxReserveBGCOL2_frames[];
extern const u16 StartSubSpell_efxRestBG_frames[];

// 9.99 efxmagic-healstaves:StartSpellAnimHeal
void StartSpellAnimHeal(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxLive, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxLive_Loop_Main
void efxLive_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimMend
void StartSpellAnimMend(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxRelive, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxRelive_Loop_Main
void efxRelive_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 1);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 1);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x110, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 114)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 1);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 1);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x111, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == duration + 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimRecover
void StartSpellAnimRecover(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxRecover, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxRecover_Loop_Main
void efxRecover_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 2);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 2);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x112, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 114)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 2);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 2);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x113, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == duration + 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimPhysic
void StartSpellAnimPhysic(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxReblow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxReblow_Loop_Main
void efxReblow_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        StartSubSpell_efxReblowOBJ(proc->anim, 0);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 151)
    {
        StartSubSpell_efxReblowOBJ(proc->anim, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 161)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 211)
    {
        NewEfxHpBarLive(anim);
        return;
    }
    else if (proc->timer == duration + 221)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBG_A
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (kind)
    {
        case 0:
            proc->unk29 = 1;
            proc->frame_config = gUnknown_081E8CB0;
            proc->tsal = Tsa_HealSpellBg;
            proc->tsar = Tsa_HealSpellBg;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    SetBgOffset(BG_1, 24, 0);
                }
                else
                {
                    SetBgOffset(BG_1, 232, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->unk29 = 1;
            proc->frame_config = gUnknown_081E8CBC;

            proc->tsal = Tsa_EfxLiveBG_B_L;
            proc->tsar = Tsa_EfxLiveBG_B_R;

            SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBG_B
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    proc->unk29 = 0;

    switch (kind)
    {
        case 0:
            proc->frame_config = gUnknown_081E8CB6;
            proc->tsal = Tsa_HealSpellBg;
            proc->tsar = Tsa_HealSpellBg;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    SetBgOffset(BG_1, 232, 0);
                }
                else
                {
                    SetBgOffset(BG_1, 24, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->frame_config = gUnknown_081E8CC2;

            proc->tsal = Tsa_EfxLiveBG_B_L;
            proc->tsar = Tsa_EfxLiveBG_B_R;

            SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:efxLiveBG_Loop
void efxLiveBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;

        // TODO: Is this the correct data type?
#if PLATFORM_GBA
        EfxCreateBackAnim(proc->anim, (u16 *)(tsaL + ret * 0x12c), (u16 *)(tsaR + ret * 0x12c));
#else
        // tsal is one TSA per frame (0x4B0 bytes), not a pointer table: the
        // stride is 0x12C 4-byte pointers on the GBA
        EfxCreateBackAnim(proc->anim, (u16 *)tsaL + ret * 0x258, (u16 *)tsaR + ret * 0x258);
#endif
    }
    else
    {
        if (ret == -1)
        {
            if (proc->unk29 == 0)
            {
                SpellFx_ClearBG1();
                SpellFx_ClearColorEffects();
            }

            SetBgOffset(BG_1, 0, 0);
            gEfxBgSemaphore--;

            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBGCOL_A
void StartSubSpell_efxLiveBGCOL_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gUnknown_081E8CC8;
    }
    else if (kind == 1)
    {
        proc->frame_config = gUnknown_081E8D4C;
    }
    else
    {
        proc->frame_config = gUnknown_081E8D7E;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = Pal_0826C934;
    }
    else
    {
        proc->pal = Pal_0826C714;
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBGCOL_B
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gUnknown_081E8D0A;
    }
    else if (kind == 1)
    {
        proc->frame_config = gUnknown_081E8D4C;
    }
    else
    {
        proc->frame_config = gUnknown_081E8D7E;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = Pal_0826C934;
    }
    else
    {
        proc->pal = Pal_0826C714;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxLiveBGCOL_Loop
void efxLiveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveALPHA
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveALPHA, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = timer;
    proc->unk2E = c;
    proc->unk29 = d;

    return;
}

// 9.99 efxmagic-healstaves:efxLiveALPHA_Loop_A
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    proc->timer--;

    if (proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:efxLiveALPHA_Loop_B
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
{
    int coeffA;

    if (proc->timer > proc->unk2E)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
    else
    {
        if (proc->unk29 == 0)
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
        }
        else
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
        }

        SetBlendAlpha(coeffA, 16);

        proc->timer++;
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveOBJ
void StartSubSpell_efxLiveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveOBJ
void StartSubSpell_efxReserveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;
    proc->unk30 = 52;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-healstaves:efxLiveOBJ_Loop
void efxLiveOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveOBJ_Loop_A
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        anim->pScrStart = AnimScr_EfxLiveOBJ2;
        anim->pScrCurrent = AnimScr_EfxLiveOBJ2;

        anim->timer = 0;
        proc->timer = 0;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveOBJ_Loop_B
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReblowOBJ
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReblowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = kind;

    if (kind == 0)
    {
        proc->terminator = 43;
        proc->unk30 = 68;
    }
    else
    {
        proc->terminator = 31;
        proc->unk30 = 61;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReblowOBJ_Loop_A
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int x;
    int y;
    const AnimScr * scrA;
    const AnimScr * scrB;

    proc->timer++;

    if (proc->timer != proc->terminator)
    {
        return;
    }

    proc->timer = 0;

    if (proc->unk29 == 0)
    {
        scrA = AnimScr_EfxReblowOBJ_Right1;
        scrB = AnimScr_EfxReblowOBJ_Left1;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 104 : 136;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 128 : 112;
        }

        y = 78;
    }
    else
    {
        scrA = AnimScr_EfxReblowOBJ_Right2;
        scrB = AnimScr_EfxReblowOBJ_Left2;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 164 : 76;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 140 : 100;
        }

        y = 64;
    }

    anim = EfxCreateFrontAnim(proc->anim, scrB, scrA, scrB, scrA);
    proc->anim2 = anim;
    anim->xPosition = x;
    anim->yPosition = y;

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-healstaves:efxReblowOBJ_Loop_B
void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimFortify
void StartSpellAnimFortify(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 0;

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimLatona
void StartSpellAnimLatona(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 1;

    return;
}

// 9.99 efxmagic-healstaves:efxReserve_Loop_Main
void efxReserve_Loop_Main(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxReserveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxReserveBG(proc->anim);
        StartSubSpell_efxReserveBGCOL(proc->anim, proc->hitted);
    }
    else if (proc->timer == 183)
    {
        PlaySFX(0x114, 0x100, 120, 0);

        StartSubSpell_efxReserveBG2(proc->anim);
        StartSubSpell_efxReserveBGCOL2(proc->anim, proc->hitted);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 20, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 180, 40, 1);
    }
    else if (proc->timer == 453)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBG
void StartSubSpell_efxReserveBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBG_frames;

    proc->tsal = TsaArray_Fortify;
    proc->tsar = TsaArray_Fortify;

    SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBG_Loop
void efxReserveBG_Loop(struct ProcEfxBG * proc)
{


    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        int songId;
        int location;

        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;

        SpellFx_WriteBgMap(anim, *(tsaL + ret), *(tsaR + ret));

        songId = efxReserveBG_Loop_songIds[ret];
        location = efxReserveBG_Loop_positions[ret];
        PlaySFX(songId, 0x100, location, 0);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBGCOL
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBGCOL_frames;

    if (kind == 0)
    {
        proc->pal = Pal_0826D3D4;
    }
    else
    {
        proc->pal = Pal_0826D5D4;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBGCOL_Loop
void efxReserveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBG2
void StartSubSpell_efxReserveBG2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBG2_frames;

    proc->tsal = TsaArray_FortifyBg2;
    proc->tsar = TsaArray_FortifyBg2;

    SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    sub_0805076C();

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    otherAnim = gUnknown_02000010[GetAnimPosition(anim)];
    if (otherAnim != NULL)
    {
        otherAnim->oam2Base &= ~OAM2_LAYER(3);
        otherAnim->oam2Base |= OAM2_LAYER(1);
    }

    SpellFx_SetSomeColorEffect();
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBG2_Loop
void efxReserveBG2_Loop(struct ProcEfxBG * proc)
{
    int ret;

    struct Anim * procAnim = proc->anim;
    struct Anim * otherAnim = GetAnimAnotherSide(procAnim);

    struct Anim * anim3 = gUnknown_02000010[GetAnimPosition(procAnim)];

    if (anim3 != NULL)
    {
        anim3->oam2Base &= ~OAM2_LAYER(3);
        anim3->oam2Base |= OAM2_LAYER(1);
    }

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        SpellFx_WriteBgMap(otherAnim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            gDispIo.bg0_ct.priority = 0;
            gDispIo.bg1_ct.priority = 1;
            gDispIo.bg2_ct.priority = 2;
            gDispIo.bg3_ct.priority = 3;

            procAnim->oam2Base &= ~OAM2_LAYER(3);
            procAnim->oam2Base |= OAM2_LAYER(2);

            if (anim3 != NULL)
            {
                anim3->oam2Base &= ~OAM2_LAYER(3);
                anim3->oam2Base |= OAM2_LAYER(2);
            }

            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBGCOL2
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBGCOL2_frames;

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else
    {
        proc->pal = Pal_0826D7D4;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBGCOL2_Loop
void efxReserveBGCOL2_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimRestore
void StartSpellAnimRestore(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxRest, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-healstaves:efxRest_Loop_Main
void efxRest_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxRestBG(anim);
        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);
        PlaySFX(0xfd, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxRestOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
        SetUnitEfxDebuff(anim, 0);
    }
    else if (proc->timer == duration + 300)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxRestBG
void StartSubSpell_efxRestBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxRestBG_frames;

    proc->tsal = TsaArray_RestoreBg;
    proc->tsar = TsaArray_RestoreBg;

    proc->img = ImgArray_RestoreBg;

    SpellFx_RegisterBgPal(Pal_MapAnimRestore, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:efxRestBG_Loop
void efxRestBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxRestOBJ
void StartSubSpell_efxRestOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestOBJ, PROC_TREE_3);
    proc->anim = anim;
    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxRestOBJ, AnimScr_EfxRestOBJ, AnimScr_EfxRestOBJ, AnimScr_EfxRestOBJ);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 8;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 8;
    }

    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-healstaves:efxRestOBJ_Loop
void efxRestOBJ_Loop(void)
{
    gEfxBgSemaphore--;
    return;
}

SECTION(".rodata.08BA3070")
const struct ProcCmd ProcScr_efxLive[] = {
    PROC_19,
    PROC_REPEAT(efxLive_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3088")
const struct ProcCmd ProcScr_efxRelive[] = {
    PROC_19,
    PROC_REPEAT(efxRelive_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA30A0")
const struct ProcCmd ProcScr_efxRecover[] = {
    PROC_19,
    PROC_REPEAT(efxRecover_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA30B8")
const struct ProcCmd ProcScr_efxReblow[] = {
    PROC_19,
    PROC_REPEAT(efxReblow_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA30D0")
const struct ProcCmd ProcScr_efxLiveBG[] = {
    PROC_19,
    PROC_REPEAT(efxLiveBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA30E8")
const struct ProcCmd ProcScr_efxLiveBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxLiveBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3108")
const struct ProcCmd ProcScr_efxLiveALPHA[] = {
    PROC_19,
    PROC_REPEAT(efxLiveALPHA_Loop_A),
    PROC_REPEAT(efxLiveALPHA_Loop_B),
    PROC_END,
};

SECTION(".rodata.08BA3128")
const struct ProcCmd ProcScr_efxLiveOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxLiveOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3140")
const struct ProcCmd ProcScr_efxReserveOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxReserveOBJ_Loop_A),
    PROC_REPEAT(efxReserveOBJ_Loop_B),
    PROC_END,
};

SECTION(".rodata.08BA3160")
const struct ProcCmd ProcScr_efxReblowOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxReblowOBJ_Loop_A),
    PROC_REPEAT(efxReblowOBJ_Loop_B),
    PROC_END,
};

SECTION(".rodata.08BA3180")
const struct ProcCmd ProcScr_efxReserve[] = {
    PROC_19,
    PROC_REPEAT(efxReserve_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3198")
const struct ProcCmd ProcScr_efxReserveBG[] = {
    PROC_19,
    PROC_REPEAT(efxReserveBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA31C0")
const struct ProcCmd ProcScr_efxReserveBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxReserveBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA31E0")
const struct ProcCmd ProcScr_efxReserveBG2[] = {
    PROC_19,
    PROC_REPEAT(efxReserveBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA31FC")
const struct ProcCmd ProcScr_efxReserveBGCOL2[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxReserveBGCOL2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA321C")
const struct ProcCmd ProcScr_efxRest[] = {
    PROC_19,
    PROC_REPEAT(efxRest_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3234")
const struct ProcCmd ProcScr_efxRestBG[] = {
    PROC_19,
    PROC_REPEAT(efxRestBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA32B4")
const struct ProcCmd ProcScr_efxRestOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxRestOBJ_Loop),
    PROC_SLEEP(80),
    PROC_END,
};

SECTION(".rodata.08BBE6B0")
const AnimScr AnimScr_EfxLiveOBJ1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBB9BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBB9E0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBA10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBA40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBA70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBAB8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBB00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBB48, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBB90, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBBD8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBC38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBCB0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBD28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBDA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBE24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBEA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBF2C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBBFB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC028, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC0A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC118, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC190, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC208, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC28C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC310, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC394, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC418, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC49C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC520, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC598, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC5E0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC628, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC670, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC6B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ1_08BBC6DC, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBE740")
const AnimScr AnimScr_EfxLiveOBJ2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD5C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD5E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD618, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD660, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD69C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD6F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD744, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD798, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD7EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD840, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD894, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD8E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD93C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD990, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBD9E4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDA38, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDA8C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDAE0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDB34, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDB88, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDBDC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDC30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDC84, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDCD8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDD2C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDD80, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDDD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDE28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDE7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDED0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDF24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDF78, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBDFCC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE020, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE074, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE0C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE11C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE170, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE1C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE218, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE284, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE2D8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE344, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE398, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE3EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE440, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE4A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE500, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE5A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE5E4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLiveOBJ2_08BBE638, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBFC5C")
const AnimScr AnimScr_EfxReblowOBJ_Right1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF90, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE81C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE840, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE870, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE8A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE8E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE930, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE978, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE9D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEA38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEA98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEAF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEB70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEBE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEC48, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF9C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF014, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF068, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF0BC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF110, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF158, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF1A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF1C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF1E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF20C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF224, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF23C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF90, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBFCD0")
const AnimScr AnimScr_EfxReblowOBJ_Right2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF260, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF278, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF29C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF2CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF2FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF338, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF374, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF3B0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF3EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF428, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF464, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF4AC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF4F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF548, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF59C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF5F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF644, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF698, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF6E0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF710, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF728, 20),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BC125C")
const AnimScr AnimScr_EfxReblowOBJ_Left1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0590, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE1C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE40, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFEA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFEE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFF30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFF78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFFD8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0038, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0098, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC00F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0170, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC01E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0248, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC059C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0614, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0668, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC06BC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0710, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0758, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC07A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC07C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC07E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC080C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0824, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC083C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0590, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BC12D0")
const AnimScr AnimScr_EfxReblowOBJ_Left2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0860, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0878, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC089C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC08CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC08FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0938, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0974, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC09B0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC09EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0A28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0A64, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0AAC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0AF4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0B48, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0B9C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0BF0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0C44, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0C98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0CE0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0D10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0D28, 20),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BC4044")
const AnimScr AnimScr_EfxRestOBJ[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC141C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1434, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1458, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1494, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC14E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1554, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC15D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1674, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1734, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1818, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1920, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1A4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1B9C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1D04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC1E84, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2028, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC21E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC23B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2598, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2784, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2970, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2B50, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2D24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC2EEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3090, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3210, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3378, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC34C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC35F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC36FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC37EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC38C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3984, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3AB0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3B28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3B88, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3BD0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3C0C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3C3C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3C60, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxRestOBJ_08BC3C78, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_END,
};

SECTION(".rodata.08BA31B0")
u16 * const TsaArray_Fortify[] = {
    Tsa_Fortify_00,
    Tsa_Fortify_01,
    Tsa_Fortify_02,
    Tsa_Fortify_03,
};

SECTION(".rodata.08BA31F8")
u16 * const TsaArray_FortifyBg2[] = {
    Tsa_FortifyBg2_00,
};

SECTION(".rodata.08BA324C")
u16 * const TsaArray_RestoreBg[] = {
    Tsa_RestoreBg_00,
    Tsa_RestoreBg_01,
    Tsa_RestoreBg_02,
    Tsa_RestoreBg_03,
    Tsa_RestoreBg_04,
    Tsa_RestoreBg_05,
    Tsa_RestoreBg_06,
    Tsa_RestoreBg_07,
    Tsa_RestoreBg_08,
    Tsa_RestoreBg_09,
    Tsa_RestoreBg_0A,
    Tsa_RestoreBg_0B,
    Tsa_RestoreBg_0C,
};

SECTION(".rodata.08BA3280")
u16 * const ImgArray_RestoreBg[] = {
    Img_RestoreBg_00,
    Img_RestoreBg_00,
    Img_RestoreBg_00,
    Img_RestoreBg_00,
    Img_RestoreBg_00,
    Img_RestoreBg_00,
    Img_RestoreBg_06,
    Img_RestoreBg_06,
    Img_RestoreBg_06,
    Img_RestoreBg_09,
    Img_RestoreBg_09,
    Img_RestoreBg_0B,
    Img_RestoreBg_0B,
};

extern const AnimScr AnimScr_08BBE814[];
extern const AnimScr AnimScr_08BBFD28[];
extern const AnimScr AnimScr_08BC1328[];

SECTION(".rodata.08BBE814")
const AnimScr AnimScr_08BBE814[] = {
    ANIMSCR_FORCE_SPRITE((const struct AnimSpriteData *) ((const u8 *) AnimSprite_EfxLiveOBJ1_08BBC6DC + 0xc6c), 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BBFD28")
const AnimScr AnimScr_08BBFD28[] = {
    ANIMSCR_FORCE_SPRITE((const struct AnimSpriteData *) ((const u8 *) AnimSprite_EfxReblowOBJ_Right2_08BBF728 + 0xf0), 4),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE81C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE840, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE870, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE8A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE8E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE930, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE978, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE9D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEA38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEA98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEAF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEB70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEBE8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEC48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBECC0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBED38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBED8C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEDD4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEE10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEE40, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEE70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEEA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEED0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEF00, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEF30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBEF60, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF90, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE81C, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE840, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE870, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE8A0, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE8E8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE930, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE978, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBE9D8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEA38, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEA98, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEAF8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEB70, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEBE8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEC48, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF9C, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF014, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF068, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF0BC, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF110, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF158, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF1A0, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF1C4, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF1E8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF20C, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF224, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBF23C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF90, 15),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right2_08BBF260, 4),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Right1_08BBEF9C, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BC1328")
const AnimScr AnimScr_08BC1328[] = {
    ANIMSCR_FORCE_SPRITE((const struct AnimSpriteData *) ((const u8 *) AnimSprite_EfxReblowOBJ_Left2_08BC0D28 + 0xf0), 4),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE1C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE40, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFEA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFEE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFF30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFF78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFFD8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0038, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0098, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC00F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0170, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC01E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0248, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC02C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0338, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC038C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC03D4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0410, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0440, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0470, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC04A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC04D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0500, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0530, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0560, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0590, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE1C, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE40, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFE70, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFEA0, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFEE8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFF30, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFF78, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BBFFD8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0038, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0098, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC00F8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0170, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC01E8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0248, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC059C, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0614, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0668, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC06BC, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0710, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0758, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC07A0, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC07C4, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC07E8, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC080C, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0824, 15),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC083C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC0590, 15),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left2_08BC0860, 4),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxReblowOBJ_Left1_08BC059C, 4),
    ANIMSCR_BLOCKED,
};
