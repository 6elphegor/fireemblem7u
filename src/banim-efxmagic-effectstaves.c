#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_EfxBerserk10_08BCC9D8[],
    AnimSprite_EfxBerserk10_08BCCA2C[], AnimSprite_EfxBerserk10_08BCCA50[],
    AnimSprite_EfxBerserk10_08BCCA8C[], AnimSprite_EfxBerserk10_08BCCAB0[],
    AnimSprite_EfxBerserk10_08BCCAD4[], AnimSprite_EfxBerserk10_08BCCAEC[],
    AnimSprite_EfxBerserk10_08BCCB04[], AnimSprite_EfxBerserk10_08BCCB1C[],
    AnimSprite_EfxBerserk1_08BCC230[], AnimSprite_EfxBerserk1_08BCC260[],
    AnimSprite_EfxBerserk1_08BCC290[], AnimSprite_EfxBerserk1_08BCC2E4[],
    AnimSprite_EfxBerserk2_08BCC344[], AnimSprite_EfxBerserk2_08BCC374[],
    AnimSprite_EfxBerserk2_08BCC3A4[], AnimSprite_EfxBerserk2_08BCC3F8[],
    AnimSprite_EfxBerserk3_08BCC458[], AnimSprite_EfxBerserk3_08BCC488[],
    AnimSprite_EfxBerserk3_08BCC4B8[], AnimSprite_EfxBerserk3_08BCC50C[],
    AnimSprite_EfxBerserk4_08BCC56C[], AnimSprite_EfxBerserk4_08BCC59C[],
    AnimSprite_EfxBerserk4_08BCC5CC[], AnimSprite_EfxBerserk4_08BCC620[],
    AnimSprite_EfxBerserk5_08BCC680[], AnimSprite_EfxBerserk5_08BCC6B0[],
    AnimSprite_EfxBerserk5_08BCC6E0[], AnimSprite_EfxBerserk5_08BCC734[],
    AnimSprite_EfxBerserk6_08BCC7F8[], AnimSprite_EfxBerserk6_08BCC84C[],
    AnimSprite_EfxBerserk7_08BCC870[], AnimSprite_EfxBerserk7_08BCC8C4[],
    AnimSprite_EfxBerserk8_08BCC8E8[], AnimSprite_EfxBerserk8_08BCC93C[],
    AnimSprite_EfxBerserk9_08BCC960[], AnimSprite_EfxBerserk9_08BCC9B4[],
    AnimSprite_EfxHammarneOBJ_08BC43CC[], AnimSprite_EfxHammarneOBJ_08BC43E4[],
    AnimSprite_EfxHammarneOBJ_08BC4408[], AnimSprite_EfxHammarneOBJ_08BC4444[],
    AnimSprite_EfxHammarneOBJ_08BC4498[], AnimSprite_EfxHammarneOBJ_08BC4504[],
    AnimSprite_EfxHammarneOBJ_08BC4588[], AnimSprite_EfxHammarneOBJ_08BC4624[],
    AnimSprite_EfxHammarneOBJ_08BC46E4[], AnimSprite_EfxHammarneOBJ_08BC47C8[],
    AnimSprite_EfxHammarneOBJ_08BC48D0[], AnimSprite_EfxHammarneOBJ_08BC49FC[],
    AnimSprite_EfxHammarneOBJ_08BC4B4C[], AnimSprite_EfxHammarneOBJ_08BC4CB4[],
    AnimSprite_EfxHammarneOBJ_08BC4E34[], AnimSprite_EfxHammarneOBJ_08BC4FD8[],
    AnimSprite_EfxHammarneOBJ_08BC5194[], AnimSprite_EfxHammarneOBJ_08BC5368[],
    AnimSprite_EfxHammarneOBJ_08BC5548[], AnimSprite_EfxHammarneOBJ_08BC5734[],
    AnimSprite_EfxHammarneOBJ_08BC5920[], AnimSprite_EfxHammarneOBJ_08BC5B00[],
    AnimSprite_EfxHammarneOBJ_08BC5CD4[], AnimSprite_EfxHammarneOBJ_08BC5E9C[],
    AnimSprite_EfxHammarneOBJ_08BC6040[], AnimSprite_EfxHammarneOBJ_08BC61C0[],
    AnimSprite_EfxHammarneOBJ_08BC6328[], AnimSprite_EfxHammarneOBJ_08BC6478[],
    AnimSprite_EfxHammarneOBJ_08BC65A4[], AnimSprite_EfxHammarneOBJ_08BC66AC[],
    AnimSprite_EfxHammarneOBJ_08BC679C[], AnimSprite_EfxHammarneOBJ_08BC6874[],
    AnimSprite_EfxHammarneOBJ_08BC6934[], AnimSprite_EfxHammarneOBJ_08BC69D0[],
    AnimSprite_EfxHammarneOBJ_08BC6A60[], AnimSprite_EfxHammarneOBJ_08BC6AD8[],
    AnimSprite_EfxHammarneOBJ_08BC6B38[], AnimSprite_EfxHammarneOBJ_08BC6B80[],
    AnimSprite_EfxHammarneOBJ_08BC6BBC[], AnimSprite_EfxHammarneOBJ_08BC6BEC[],
    AnimSprite_EfxHammarneOBJ_08BC6C10[], AnimSprite_EfxHammarneOBJ_08BC6C28[],
    AnimSprite_EfxMshield1_08BCCBB0[], AnimSprite_EfxMshield1_08BCCBC8[],
    AnimSprite_EfxMshield1_08BCCBEC[], AnimSprite_EfxMshield1_08BCCC1C[],
    AnimSprite_EfxMshield1_08BCCC58[], AnimSprite_EfxMshield1_08BCCCA0[],
    AnimSprite_EfxMshield1_08BCCCF4[], AnimSprite_EfxMshield1_08BCCD54[],
    AnimSprite_EfxMshield1_08BCCDC0[], AnimSprite_EfxMshield1_08BCCE38[],
    AnimSprite_EfxMshield1_08BCCEBC[], AnimSprite_EfxMshield1_08BCCF4C[],
    AnimSprite_EfxMshield1_08BCCFE8[], AnimSprite_EfxMshield1_08BCD090[],
    AnimSprite_EfxMshield1_08BCD144[], AnimSprite_EfxMshield1_08BCD1F8[],
    AnimSprite_EfxMshield1_08BCD2AC[], AnimSprite_EfxMshield1_08BCD360[],
    AnimSprite_EfxMshield1_08BCD414[], AnimSprite_EfxMshield1_08BCD4C8[],
    AnimSprite_EfxMshield1_08BCD57C[], AnimSprite_EfxMshield1_08BCD630[],
    AnimSprite_EfxMshield1_08BCD6E4[], AnimSprite_EfxMshield1_08BCD798[],
    AnimSprite_EfxMshield1_08BCD84C[], AnimSprite_EfxMshield1_08BCD900[],
    AnimSprite_EfxMshield1_08BCD9B4[], AnimSprite_EfxMshield1_08BCDA68[],
    AnimSprite_EfxMshield1_08BCDB1C[], AnimSprite_EfxMshield1_08BCDBD0[],
    AnimSprite_EfxMshield1_08BCDC84[], AnimSprite_EfxMshield1_08BCDD38[],
    AnimSprite_EfxMshield1_08BCDDE0[], AnimSprite_EfxMshield1_08BCDE7C[],
    AnimSprite_EfxMshield1_08BCDF0C[], AnimSprite_EfxMshield1_08BCDF90[],
    AnimSprite_EfxMshield1_08BCE008[], AnimSprite_EfxMshield1_08BCE074[],
    AnimSprite_EfxMshield1_08BCE0E0[], AnimSprite_EfxMshield1_08BCE158[],
    AnimSprite_EfxMshield1_08BCE1DC[], AnimSprite_EfxMshield1_08BCE26C[],
    AnimSprite_EfxMshield1_08BCE308[], AnimSprite_EfxMshield1_08BCE3B0[],
    AnimSprite_EfxMshield1_08BCE5D8[], AnimSprite_EfxMshield1_08BCE68C[],
    AnimSprite_EfxMshield1_08BCE758[], AnimSprite_EfxMshield1_08BCE824[],
    AnimSprite_EfxMshield1_08BCE83C[], AnimSprite_EfxMshield1_08BCE914[],
    AnimSprite_EfxMshield1_08BCE9F8[], AnimSprite_EfxMshield1_08BCEAE8[],
    AnimSprite_EfxMshield1_08BCEBE4[], AnimSprite_EfxMshield1_08BCECEC[],
    AnimSprite_EfxMshield1_08BCEE00[], AnimSprite_EfxMshield1_08BCEF20[],
    AnimSprite_EfxMshield1_08BCF04C[], AnimSprite_EfxMshield1_08BCF184[],
    AnimSprite_EfxMshield1_08BCF2BC[], AnimSprite_EfxMshield1_08BCF400[],
    AnimSprite_EfxMshield1_08BCF544[], AnimSprite_EfxMshield1_08BCF694[],
    AnimSprite_EfxMshield1_08BCF7E4[], AnimSprite_EfxMshield1_08BCF928[],
    AnimSprite_EfxMshield1_08BCFA54[], AnimSprite_EfxMshield1_08BCFB74[],
    AnimSprite_EfxMshield1_08BCFC88[], AnimSprite_EfxMshield1_08BCFD84[],
    AnimSprite_EfxMshield1_08BCFE68[], AnimSprite_EfxMshield1_08BCFF34[],
    AnimSprite_EfxMshield1_08BCFFE8[], AnimSprite_EfxMshield1_08BD0090[],
    AnimSprite_EfxMshield1_08BD0120[], AnimSprite_EfxMshield1_08BD01A4[],
    AnimSprite_EfxMshield1_08BD021C[], AnimSprite_EfxMshield1_08BD0288[],
    AnimSprite_EfxMshield1_08BD02E8[], AnimSprite_EfxMshield1_08BD033C[],
    AnimSprite_EfxMshield1_08BD0384[], AnimSprite_EfxMshield1_08BD03C0[],
    AnimSprite_EfxMshield1_08BD03F0[], AnimSprite_EfxMshield1_08BD0414[],
    AnimSprite_EfxMshield2_08BD042C[], AnimSprite_EfxMshield2_08BD0480[],
    AnimSprite_EfxMshield2_08BD04D4[], AnimSprite_EfxMshield2_08BD0528[],
    AnimSprite_EfxMshield2_08BD057C[], AnimSprite_EfxMshield2_08BD05D0[],
    AnimSprite_EfxMshield2_08BD0624[], AnimSprite_EfxMshield2_08BD0678[],
    AnimSprite_EfxMshield2_08BD06E4[], AnimSprite_EfxMshield2_08BD0750[],
    AnimSprite_EfxMshield2_08BD07BC[], AnimSprite_EfxMshield2_08BD0828[],
    AnimSprite_EfxMshield2_08BD0894[], AnimSprite_EfxMshield2_08BD0900[],
    AnimSprite_EfxMshield2_08BD096C[], AnimSprite_EfxMshield2_08BD09D8[],
    AnimSprite_EfxMshield2_08BD0A44[], AnimSprite_EfxMshield2_08BD0AA4[],
    AnimSprite_EfxMshield2_08BD0AF8[], AnimSprite_EfxMshield2_08BD0B4C[],
    AnimSprite_EfxMshield2_08BD0B94[], AnimSprite_EfxMshield2_08BD0BD0[],
    AnimSprite_EfxMshield2_08BD0C0C[], AnimSprite_EfxMshield2_08BD0C30[],
    AnimSprite_EfxSilenceOBJ_08BC40F4[], AnimSprite_EfxSilenceOBJ_08BC410C[],
    AnimSprite_EfxSilenceOBJ_08BC4124[], AnimSprite_EfxSilenceOBJ_08BC413C[],
    AnimSprite_EfxSilenceOBJ_08BC4154[], AnimSprite_EfxSilenceOBJ_08BC416C[],
    AnimSprite_EfxSilenceOBJ_08BC4184[], AnimSprite_EfxSilenceOBJ_08BC419C[],
    AnimSprite_EfxSilenceOBJ_08BC41B4[], AnimSprite_EfxSilenceOBJ_08BC41F0[],
    AnimSprite_EfxSilenceOBJ_08BC4208[], AnimSprite_EfxSilenceOBJ_08BC4250[],
    AnimSprite_EfxSilenceOBJ_08BC4268[], AnimSprite_EfxSilenceOBJ_08BC4280[],
    AnimSprite_EfxSilenceOBJ_08BC4298[], AnimSprite_EfxSilenceOBJ_08BC42B0[],
    AnimSprite_EfxSleepOBJ1_08BCB130[], AnimSprite_EfxSleepOBJ1_08BCBAE4[],
    AnimSprite_EfxSleepOBJ1_08BCBB14[], AnimSprite_EfxSleepOBJ1_08BCBB50[],
    AnimSprite_EfxSleepOBJ1_08BCBB98[], AnimSprite_EfxSleepOBJ1_08BCBBEC[],
    AnimSprite_EfxSleepOBJ1_08BCBC4C[], AnimSprite_EfxSleepOBJ1_08BCBCB8[],
    AnimSprite_EfxSleepOBJ1_08BCBD30[], AnimSprite_EfxSleepOBJ1_08BCBDB4[],
    AnimSprite_EfxSleepOBJ1_08BCBE38[], AnimSprite_EfxSleepOBJ1_08BCBEA4[],
    AnimSprite_EfxSleepOBJ1_08BCBF04[], AnimSprite_EfxSleepOBJ1_08BCBF70[],
    AnimSprite_EfxSleepOBJ1_08BCBFB8[], AnimSprite_EfxSleepOBJ1_08BCBFF4[],
    AnimSprite_EfxSleepOBJ1_08BCC024[], AnimSprite_EfxSleepOBJ1_08BCC048[],
    AnimSprite_EfxSleepOBJ2_08BC70A4[], AnimSprite_EfxSleepOBJ2_08BC70C8[],
    AnimSprite_EfxSleepOBJ2_08BC7104[], AnimSprite_EfxSleepOBJ2_08BC7170[],
    AnimSprite_EfxSleepOBJ2_08BC7200[], AnimSprite_EfxSleepOBJ2_08BC72B4[],
    AnimSprite_EfxSleepOBJ2_08BC7374[], AnimSprite_EfxSleepOBJ2_08BC744C[],
    AnimSprite_EfxSleepOBJ2_08BC753C[], AnimSprite_EfxSleepOBJ2_08BC7644[],
    AnimSprite_EfxSleepOBJ2_08BC7758[], AnimSprite_EfxSleepOBJ2_08BC7878[],
    AnimSprite_EfxSleepOBJ2_08BC79A4[], AnimSprite_EfxSleepOBJ2_08BC7AC4[],
    AnimSprite_EfxSleepOBJ2_08BC7BE4[], AnimSprite_EfxSleepOBJ2_08BC7CBC[],
    AnimSprite_EfxSleepOBJ2_08BC7D70[], AnimSprite_EfxSleepOBJ2_08BC7E24[],
    AnimSprite_EfxSleepOBJ2_08BC7EC0[], AnimSprite_EfxSleepOBJ2_08BC7F5C[],
    AnimSprite_EfxSleepOBJ2_08BC7FF8[], AnimSprite_EfxSleepOBJ2_08BC8088[],
    AnimSprite_EfxSleepOBJ2_08BC8118[], AnimSprite_EfxSleepOBJ2_08BC813C[],
    AnimSprite_EfxSleepOBJ2_08BC8178[], AnimSprite_EfxSleepOBJ2_08BC81E4[],
    AnimSprite_EfxSleepOBJ2_08BC8274[], AnimSprite_EfxSleepOBJ2_08BC8328[],
    AnimSprite_EfxSleepOBJ2_08BC83E8[], AnimSprite_EfxSleepOBJ2_08BC84C0[],
    AnimSprite_EfxSleepOBJ2_08BC85A4[], AnimSprite_EfxSleepOBJ2_08BC86A0[],
    AnimSprite_EfxSleepOBJ2_08BC87A8[], AnimSprite_EfxSleepOBJ2_08BC88BC[],
    AnimSprite_EfxSleepOBJ2_08BC89D0[], AnimSprite_EfxSleepOBJ2_08BC8AE4[],
    AnimSprite_EfxSleepOBJ2_08BC8BF8[], AnimSprite_EfxSleepOBJ2_08BC8CD0[],
    AnimSprite_EfxSleepOBJ2_08BC8D90[], AnimSprite_EfxSleepOBJ2_08BC8E2C[],
    AnimSprite_EfxSleepOBJ2_08BC8EC8[], AnimSprite_EfxSleepOBJ2_08BC8F64[],
    AnimSprite_EfxSleepOBJ2_08BC8FF4[], AnimSprite_EfxSleepOBJ2_08BC9084[],
    AnimSprite_EfxSleepOBJ2_08BC90B4[], AnimSprite_EfxSleepOBJ2_08BC90FC[],
    AnimSprite_EfxSleepOBJ2_08BC915C[], AnimSprite_EfxSleepOBJ2_08BC91D4[],
    AnimSprite_EfxSleepOBJ2_08BC9264[], AnimSprite_EfxSleepOBJ2_08BC9300[],
    AnimSprite_EfxSleepOBJ2_08BC93B4[], AnimSprite_EfxSleepOBJ2_08BC9474[],
    AnimSprite_EfxSleepOBJ2_08BC9540[], AnimSprite_EfxSleepOBJ2_08BC9618[],
    AnimSprite_EfxSleepOBJ2_08BC96FC[], AnimSprite_EfxSleepOBJ2_08BC97EC[],
    AnimSprite_EfxSleepOBJ2_08BC98E8[], AnimSprite_EfxSleepOBJ2_08BC99F0[],
    AnimSprite_EfxSleepOBJ2_08BC9B04[], AnimSprite_EfxSleepOBJ2_08BC9C24[],
    AnimSprite_EfxSleepOBJ2_08BC9D50[], AnimSprite_EfxSleepOBJ2_08BC9E88[],
    AnimSprite_EfxSleepOBJ2_08BC9FC0[], AnimSprite_EfxSleepOBJ2_08BCA104[],
    AnimSprite_EfxSleepOBJ2_08BCA248[], AnimSprite_EfxSleepOBJ2_08BCA398[],
    AnimSprite_EfxSleepOBJ2_08BCA4E8[], AnimSprite_EfxSleepOBJ2_08BCA62C[],
    AnimSprite_EfxSleepOBJ2_08BCA758[], AnimSprite_EfxSleepOBJ2_08BCA878[],
    AnimSprite_EfxSleepOBJ2_08BCA98C[], AnimSprite_EfxSleepOBJ2_08BCAA88[],
    AnimSprite_EfxSleepOBJ2_08BCAB6C[], AnimSprite_EfxSleepOBJ2_08BCAC38[],
    AnimSprite_EfxSleepOBJ2_08BCACEC[], AnimSprite_EfxSleepOBJ2_08BCAD94[],
    AnimSprite_EfxSleepOBJ2_08BCAE24[], AnimSprite_EfxSleepOBJ2_08BCAEA8[],
    AnimSprite_EfxSleepOBJ2_08BCAF20[], AnimSprite_EfxSleepOBJ2_08BCAF8C[],
    AnimSprite_EfxSleepOBJ2_08BCAFEC[], AnimSprite_EfxSleepOBJ2_08BCB040[],
    AnimSprite_EfxSleepOBJ2_08BCB088[], AnimSprite_EfxSleepOBJ2_08BCB0C4[],
    AnimSprite_EfxSleepOBJ2_08BCB0F4[], AnimSprite_EfxSleepOBJ2_08BCB118[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void StopBGM1(void);
void RegisterEfxSpellCastEnd(void);
void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
extern const struct ProcCmd ProcScr_efxSilence[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxSilenceBG[];
extern u16 * TsaArray_SilenceBg[];
extern u16 Pal_Silence[];
extern u16 Img_SilenceBg[];
extern const struct ProcCmd ProcScr_efxSilenceOBJ[];
extern const AnimScr AnimScr_EfxSilenceOBJ[];
extern u16 Img_SilenceSprites[];
extern const struct ProcCmd ProcScr_efxSleep[];
extern const struct ProcCmd ProcScr_efxSleepBG[];
extern u16 * TsaArray_SleepBg[];
extern u16 Pal_SleepBg[];
extern u16 Img_SleepBg[];
extern const struct ProcCmd ProcScr_efxSleepOBJ[];
extern const AnimScr AnimScr_EfxSleepOBJ1[];
extern u16 Pal_SleepSprites[];
extern u16 Img_SleepSprites[];
extern const struct ProcCmd ProcScr_efxSleepOBJ2[];
extern const AnimScr AnimScr_EfxSleepOBJ2[];
extern const struct ProcCmd ProcScr_efxSleepSE[];
extern const struct ProcCmd ProcScr_efxHammarne[];
extern const struct ProcCmd ProcScr_efxHammarneBG[];
extern u16 * TsaArray_HammerneBg[];
extern u16 * ImgArray_HammerneBg[];
extern u16 Pal_HammerneBg[];
extern const struct ProcCmd ProcScr_efxHammarneOBJ[];
extern const AnimScr AnimScr_EfxHammarneOBJ[];
extern u16 Pal_HammerneSprites[];
extern const struct ProcCmd ProcScr_efxBerserk[];
extern const struct ProcCmd ProcScr_efxBerserkBG[];
extern u16 Pal_BerserkBg[];
extern u16 Img_082739E4[];
extern u16 Tsa_08273AE4[];
extern const struct ProcCmd ProcScr_efxBerserkCLONE[];
extern const struct ProcCmd ProcScr_efxBerserkOBJ[];
extern const AnimScr FramScr_Unk5D4F90[];
extern const AnimScr AnimScr_EfxBerserk1[];
extern u16 Pal_BerserkSprites[];
extern u16 Img_BerserkSprites_A[];
extern const AnimScr AnimScr_EfxBerserk2[];
extern const AnimScr AnimScr_EfxBerserk3[];
extern const AnimScr AnimScr_EfxBerserk4[];
extern const AnimScr AnimScr_EfxBerserk5[];
extern const AnimScr AnimScr_EfxBerserk6[];
extern u16 Img_BerserkSprites_B[];
extern const AnimScr AnimScr_EfxBerserk7[];
extern const AnimScr AnimScr_EfxBerserk8[];
extern const AnimScr AnimScr_EfxBerserk9[];
extern const AnimScr AnimScr_EfxBerserk10[];
extern const struct ProcCmd ProcScr_efxMshield[];
extern const struct ProcCmd ProcScr_efxMshieldBG[];
extern u16 * TsaArray_BarrierBg[];
extern u16 Pal_BarrierBg[];
extern u16 Img_BarrierBg[];
extern const struct ProcCmd ProcScr_efxMshieldBGOBJ[];
extern const AnimScr AnimScr_EfxMshield1[];
extern u16 Img_EfxMshield[];
extern const struct ProcCmd ProcScr_efxMshieldBGOBJ2[];
extern const AnimScr AnimScr_EfxMshield2[];

void StartSpellAnimSilence(struct Anim * anim);
void efxSilence_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSilenceBG(struct Anim * anim);
void efxSilenceBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxSilenceOBJ(struct Anim * anim);
void efxSilenceOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimSleep(struct Anim * anim);
void efxSleep_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSleepBG(struct Anim * anim);
void efxSleepBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxSleepOBJ(struct Anim * anim);
void StartSubSpell_efxSleepOBJ2(struct Anim * anim);
void efxSleepOBJ_OnEnd(void);
void StartSubSpell_efxSleepSE(struct Anim * anim);
void efxSleepSE_PlaySE(struct ProcEfx * proc);
void efxSleepSE_OnEnd(void);
void StartSpellAnimHammerne(struct Anim * anim);
void efxHammarne_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHammarneBG(struct Anim * anim);
void efxHammarneBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxHammarneOBJ(struct Anim * anim);
void efxHammarneOBJ_OnEnd(void);
void StartSpellAnimBerserk(struct Anim * anim);
void efxBerserk_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator);
void efxBerserkBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator);
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc);
void efxBerserkCLONE_OnEnd(void);
void StartSubSpell_efxBerserkOBJ(struct Anim * anim);
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc);
void StartSpellAnimBarrier(struct Anim * anim);
void efxMshield_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxMshieldBG(struct Anim * anim);
void efxMshieldBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim);
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim);
void efxMshieldBGOBJ_OnEnd(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxSilenceBG_frames[];
extern const u16 StartSubSpell_efxSleepBG_frames[];
extern const u16 StartSubSpell_efxHammarneBG_frames[];
extern const u16 StartSubSpell_efxMshieldBG_frames[];

// 9.99 efxmagic-effectstaves:StartSpellAnimSilence
void StartSpellAnimSilence(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSilence, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxSilence_Loop_Main
void efxSilence_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxSilenceOBJ(proc->anim);
        PlaySFX(0xfa, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 41)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 68)
    {
        StartSubSpell_efxSilenceBG(proc->anim);
        PlaySFX(0xfb, 0x100, anim->xPosition, 1);
        NewEfxALPHA(proc->anim, 66, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 134)
    {
        PlaySFX(0xfc, 0x100, anim->xPosition, 1);
        StopBGM1();

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
        NewEfxFlashBgWhite(proc->anim, 10);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 3);
        }
    }
    else if (proc->timer == duration + 158)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSilenceBG
void StartSubSpell_efxSilenceBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxSilenceBG_frames;

    proc->tsal = TsaArray_SilenceBg;
    proc->tsar = TsaArray_SilenceBg;

    SpellFx_RegisterBgPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SilenceBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

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

    return;
}

// 9.99 efxmagic-effectstaves:efxSilenceBG_Loop
void efxSilenceBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSilenceOBJ
void StartSubSpell_efxSilenceOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ);

    SpellFx_RegisterObjPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SilenceSprites, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:efxSilenceOBJ_OnEnd
void efxSilenceOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimSleep
void StartSpellAnimSleep(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSleep, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxSleep_Loop_Main
void efxSleep_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxSleepOBJ(proc->anim);
        PlaySFX(0x11B, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 100)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 130)
    {
        StartSubSpell_efxSleepOBJ2(anim);
        StartSubSpell_efxSleepSE(anim);

        StartSubSpell_efxSleepBG(proc->anim);

        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        NewEfxALPHA(anim, 230, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 330)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && GetUnitEfxDebuff(anim) == 0)
        {
            SetUnitEfxDebuff(anim, 2);
        }
    }
    else if (proc->timer == duration + 370)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSleepBG
void StartSubSpell_efxSleepBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxSleepBG_frames;

    proc->tsal = TsaArray_SleepBg;
    proc->tsar = TsaArray_SleepBg;

    SpellFx_RegisterBgPal(Pal_SleepBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SleepBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

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

    return;
}

// 9.99 efxmagic-effectstaves:efxSleepBG_Loop
void efxSleepBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
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

// 9.99 efxmagic-effectstaves:sub_8062898
void StartSubSpell_efxSleepOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1);

    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSleepOBJ2
void StartSubSpell_efxSleepOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ2, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2);
    proc->anim2 = frontAnim;
    frontAnim->yPosition -= 8;

    return;
}

// 9.99 efxmagic-effectstaves:efxSleepOBJ_OnEnd
void efxSleepOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxSleepSE
void StartSubSpell_efxSleepSE(struct Anim * anim)
{
    struct ProcEfx * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepSE, PROC_TREE_3);
    proc->anim = anim;

    return;
}

// 9.99 efxmagic-effectstaves:efxSleepSE_PlaySE
void efxSleepSE_PlaySE(struct ProcEfx * proc)
{
    PlaySFX(0x11c, 0x100, proc->anim->xPosition, 1);
    return;
}

// 9.99 efxmagic-effectstaves:efxSleepSE_OnEnd
void efxSleepSE_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimHammerne
void StartSpellAnimHammerne(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxHammarne, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxHammarne_Loop_Main
void efxHammarne_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxHammarneBG(anim);

        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);

        PlaySFX(0x103, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxHammarneOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxHammarneBG
void StartSubSpell_efxHammarneBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxHammarneBG_frames;

    proc->tsal = TsaArray_HammerneBg;
    proc->tsar = TsaArray_HammerneBg;

    proc->img = ImgArray_HammerneBg;

    SpellFx_RegisterBgPal(Pal_HammerneBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-effectstaves:efxHammarneBG_Loop
void efxHammarneBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxHammarneOBJ
void StartSubSpell_efxHammarneOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ, AnimScr_EfxHammarneOBJ);

    SpellFx_RegisterObjPal(Pal_HammerneSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:efxHammarneOBJ_OnEnd
void efxHammarneOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimBerserk
void StartSpellAnimBerserk(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxBerserk, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserk_Loop_Main
void efxBerserk_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxBerserkOBJ(anim);
        StartSubSpell_efxBerserkBG(anim, 74);
        StartSubSpell_efxBerserkCLONE(anim, 74);

        NewefxRestRST(anim, 74, 10, 0x100, 1);
        NewEfxRestWINH_(anim, 74, 0);

        PlaySFX(0xf9, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 74)
    {
        NewEfxFlashBgWhite(anim, 5);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 4);
        }
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxBerserkBG
void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(Pal_BerserkBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_082739E4, 32 * 8 * CHR_SIZE);

    EfxTmCpyBG(Tsa_08273AE4, gBg1Tm, 0x20, 0x20, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);

    SpellFx_SetSomeColorEffect();
    SetBlendAlpha(14, 8);

    gDispIo.win_ct.wobj_enable_blend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    gDispIo.blend_ct.target2_enable_bd = 1;

    anim->oamBase |= OAM0_WINDOW;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkBG_Loop
void efxBerserkBG_Loop(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;

    gDispIo.bg_off[BG_1].y--;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();

        anim->oamBase &= ~OAM0_WINDOW;

        anim->oam2Base &= ~OAM2_LAYER(3);
        anim->oam2Base |= OAM2_LAYER(2);

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxBerserkCLONE
void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkCLONE_Loop
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc)
{
    struct Anim clone;

    struct Anim * anim = proc->anim;

    clone.xPosition = anim->xPosition;
    clone.yPosition = anim->yPosition;

    clone.pSpriteData = anim->pSpriteData;

    clone.oamBase = anim->oamBase & ~(OAM0_WINDOW);

    clone.oam2Base = anim->oam2Base;
    clone.oam2Base &= ~OAM2_LAYER(3);
    clone.oam2Base |= OAM2_LAYER(2);

    AnimDisplay(&clone);

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkCLONE_OnEnd
void efxBerserkCLONE_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxBerserkOBJ
void StartSubSpell_efxBerserkOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    const AnimScr * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);

    scr = FramScr_Unk5D4F90;
    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_OnEnd
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_A
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk1;
    anim->pScrCurrent = AnimScr_EfxBerserk1;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_C
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk2;
    anim->pScrCurrent = AnimScr_EfxBerserk2;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_E
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk3;
    anim->pScrCurrent = AnimScr_EfxBerserk3;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_G
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk4;
    anim->pScrCurrent = AnimScr_EfxBerserk4;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_I
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk5;
    anim->pScrCurrent = AnimScr_EfxBerserk5;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_B
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk6;
    anim->pScrCurrent = AnimScr_EfxBerserk6;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_D
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk7;
    anim->pScrCurrent = AnimScr_EfxBerserk7;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_F
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk8;
    anim->pScrCurrent = AnimScr_EfxBerserk8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_H
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk9;
    anim->pScrCurrent = AnimScr_EfxBerserk9;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:efxBerserkOBJ_Loop_J
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk10;
    anim->pScrCurrent = AnimScr_EfxBerserk10;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-effectstaves:StartSpellAnimBarrier
void StartSpellAnimBarrier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxMshield, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-effectstaves:efxMshield_Loop_Main
void efxMshield_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxMshieldBG(proc->anim);
        StartSubSpell_efxMshieldBGOBJ(anim);
        StartSubSpell_efxMshieldBGOBJ2(anim);
        PlaySFX(0x102, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 40)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 176)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 225)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
    }
    else if (proc->timer == duration + 230)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxMshieldBG
void StartSubSpell_efxMshieldBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxMshieldBG_frames;

    proc->tsal = TsaArray_BarrierBg;
    proc->tsar = TsaArray_BarrierBg;

    SpellFx_RegisterBgPal(Pal_BarrierBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_BarrierBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-effectstaves:efxMshieldBG_Loop
void efxMshieldBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
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

// 9.99 efxmagic-effectstaves:StartSubSpell_efxMshieldBGOBJ
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxMshield1, AnimScr_EfxMshield1, AnimScr_EfxMshield1, AnimScr_EfxMshield1);

    SpellFx_RegisterObjPal(Img_EfxMshield, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-effectstaves:StartSubSpell_efxMshieldBGOBJ2
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxMshield2, AnimScr_EfxMshield2, AnimScr_EfxMshield2, AnimScr_EfxMshield2);

    return;
}

// 9.99 efxmagic-effectstaves:efxMshieldBGOBJ_OnEnd
void efxMshieldBGOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

SECTION(".rodata.08BA32D4")
const struct ProcCmd ProcScr_efxSilence[] = {
    PROC_19,
    PROC_REPEAT(efxSilence_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA32EC")
const struct ProcCmd ProcScr_efxSilenceBG[] = {
    PROC_19,
    PROC_REPEAT(efxSilenceBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA334C")
const struct ProcCmd ProcScr_efxSilenceOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxSilenceOBJ_OnEnd),
    PROC_SLEEP(40),
    PROC_END,
};

SECTION(".rodata.08BA336C")
const struct ProcCmd ProcScr_efxSleep[] = {
    PROC_19,
    PROC_REPEAT(efxSleep_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3384")
const struct ProcCmd ProcScr_efxSleepBG[] = {
    PROC_19,
    PROC_REPEAT(efxSleepBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA33DC")
const struct ProcCmd ProcScr_efxSleepOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxSleepOBJ_OnEnd),
    PROC_SLEEP(80),
    PROC_END,
};

SECTION(".rodata.08BA33FC")
const struct ProcCmd ProcScr_efxSleepOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxSleepOBJ_OnEnd),
    PROC_SLEEP(200),
    PROC_END,
};

SECTION(".rodata.08BA341C")
const struct ProcCmd ProcScr_efxSleepSE[] = {
    PROC_19,
    PROC_SET_END_CB(efxSleepSE_OnEnd),
    PROC_SLEEP(1),
    PROC_CALL(efxSleepSE_PlaySE),
    PROC_SLEEP(54),
    PROC_CALL(efxSleepSE_PlaySE),
    PROC_SLEEP(65),
    PROC_CALL(efxSleepSE_PlaySE),
    PROC_END,
};

SECTION(".rodata.08BA3464")
const struct ProcCmd ProcScr_efxHammarne[] = {
    PROC_19,
    PROC_REPEAT(efxHammarne_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA347C")
const struct ProcCmd ProcScr_efxHammarneBG[] = {
    PROC_19,
    PROC_REPEAT(efxHammarneBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA34FC")
const struct ProcCmd ProcScr_efxHammarneOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxHammarneOBJ_OnEnd),
    PROC_SLEEP(80),
    PROC_END,
};

SECTION(".rodata.08BA351C")
const struct ProcCmd ProcScr_efxBerserk[] = {
    PROC_19,
    PROC_REPEAT(efxBerserk_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA3534")
const struct ProcCmd ProcScr_efxBerserkBG[] = {
    PROC_19,
    PROC_REPEAT(efxBerserkBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA354C")
const struct ProcCmd ProcScr_efxBerserkCLONE[] = {
    PROC_19,
    PROC_SET_END_CB(efxBerserkCLONE_OnEnd),
    PROC_REPEAT(efxBerserkCLONE_Loop),
    PROC_END,
};

SECTION(".rodata.08BA356C")
const struct ProcCmd ProcScr_efxBerserkOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxBerserkOBJ_OnEnd),
    PROC_REPEAT(efxBerserkOBJ_Loop_A),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_B),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_C),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_D),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_E),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_F),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_G),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_H),
    PROC_SLEEP(3),
    PROC_REPEAT(efxBerserkOBJ_Loop_I),
    PROC_SLEEP(7),
    PROC_REPEAT(efxBerserkOBJ_Loop_J),
    PROC_SLEEP(17),
    PROC_END,
};

SECTION(".rodata.08BA3624")
const struct ProcCmd ProcScr_efxMshield[] = {
    PROC_19,
    PROC_REPEAT(efxMshield_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA363C")
const struct ProcCmd ProcScr_efxMshieldBG[] = {
    PROC_19,
    PROC_REPEAT(efxMshieldBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA3668")
const struct ProcCmd ProcScr_efxMshieldBGOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxMshieldBGOBJ_OnEnd),
    PROC_SLEEP(220),
    PROC_END,
};

SECTION(".rodata.08BA3688")
const struct ProcCmd ProcScr_efxMshieldBGOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxMshieldBGOBJ_OnEnd),
    PROC_SLEEP(110),
    PROC_END,
};

SECTION(".rodata.08BC4310")
const AnimScr AnimScr_EfxSilenceOBJ[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC40F4, 6),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC410C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC40F4, 6),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC410C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4124, 6),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC40F4, 6),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC413C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4154, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC416C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4184, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC419C, 1),
    ANIMSCR_BLOCKED,
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41B4, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4208, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4268, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4280, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4298, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4268, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4280, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4298, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4268, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4208, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC42B0, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC42B0, 5),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC42B0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC42B0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC40F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC42B0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC42B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC41F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC4250, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSilenceOBJ_08BC40F4, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BC6FF4")
const AnimScr AnimScr_EfxHammarneOBJ[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC43CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC43E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4408, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4444, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4498, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4504, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4588, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4624, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC46E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC47C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC48D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC49FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4B4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4CB4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4E34, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC4FD8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5194, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5368, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5548, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5734, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5920, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5B00, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5CD4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC5E9C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6040, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC61C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6328, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6478, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC65A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC66AC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC679C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6874, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6934, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC69D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6A60, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6AD8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6B38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6B80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6BBC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6BEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6C10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxHammarneOBJ_08BC6C28, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_END,
};

SECTION(".rodata.08BCC060")
const AnimScr AnimScr_EfxSleepOBJ2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC70A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC70C8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7104, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7170, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7200, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC72B4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7374, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC744C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC753C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7644, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7758, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7878, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC79A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7AC4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7BE4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7CBC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7E24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7EC0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7F5C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7FF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8088, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8118, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC813C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8178, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC81E4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8274, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8328, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC83E8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC84C0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC85A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC86A0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC87A8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC88BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC89D0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8AE4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8BF8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8CD0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8D90, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8E2C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8EC8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8F64, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC7D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC8FF4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9084, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC90B4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC90FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC915C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC91D4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9264, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9300, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC93B4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9474, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9540, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9618, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC96FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC97EC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC98E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC99F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9B04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9C24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9D50, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9E88, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BC9FC0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA104, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA248, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA398, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA4E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA62C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA758, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA878, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCA98C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAA88, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAB6C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAC38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCACEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAD94, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAE24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAEA8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAF20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAF8C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCAFEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCB040, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCB088, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCB0C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCB0F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ2_08BCB118, 2),
    ANIMSCR_END,
};

SECTION(".rodata.08BCC1E0")
const AnimScr AnimScr_EfxSleepOBJ1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCB130, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBAE4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBB14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBB50, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBB98, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBBEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBC4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBCB8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBD30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBDB4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBE38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBEA4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBF04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBF70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBFB8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCBFF4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCC024, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSleepOBJ1_08BCC048, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_END,
};

SECTION(".rodata.08BCC794")
const AnimScr AnimScr_EfxBerserk1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_08BCC230, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_08BCC260, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_08BCC290, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk1_08BCC2E4, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCC7A8")
const AnimScr AnimScr_EfxBerserk2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_08BCC344, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_08BCC374, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_08BCC3A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_08BCC3F8, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCC7BC")
const AnimScr AnimScr_EfxBerserk3[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk3_08BCC458, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk3_08BCC488, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk3_08BCC4B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk3_08BCC50C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCC7D0")
const AnimScr AnimScr_EfxBerserk4[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk4_08BCC56C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk4_08BCC59C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk4_08BCC5CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk4_08BCC620, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCC7E4")
const AnimScr AnimScr_EfxBerserk5[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk5_08BCC680, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk5_08BCC6B0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk5_08BCC6E0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk5_08BCC734, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCCB58")
const AnimScr AnimScr_EfxBerserk6[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk6_08BCC7F8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk6_08BCC84C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCCB64")
const AnimScr AnimScr_EfxBerserk7[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk7_08BCC870, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk7_08BCC8C4, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCCB70")
const AnimScr AnimScr_EfxBerserk8[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk8_08BCC8E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk8_08BCC93C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCCB7C")
const AnimScr AnimScr_EfxBerserk9[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk9_08BCC960, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk9_08BCC9B4, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BCCB88")
const AnimScr AnimScr_EfxBerserk10[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCC9D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCA2C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCA50, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCA8C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCAB0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCAD4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCAEC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCB04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk10_08BCCB1C, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD0C48")
const AnimScr AnimScr_EfxMshield1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCBB0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCBC8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCBEC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCC1C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCC58, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCCA0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCCF4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCD54, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCDC0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCE38, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCEBC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCF4C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCCFE8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD090, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD144, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD1F8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD2AC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD360, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD414, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD4C8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD57C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD630, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD6E4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD798, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD84C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD900, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCD9B4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDA68, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDB1C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDBD0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDC84, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDD38, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDDE0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDE7C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDF0C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCDF90, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE008, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE074, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE0E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE158, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE1DC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE26C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE308, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE3B0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE5D8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE68C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE758, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE83C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE914, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE9F8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCEAE8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCEBE4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCECEC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCEE00, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCEF20, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF04C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF184, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF2BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF400, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF544, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF694, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF7E4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCF928, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFA54, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFB74, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFC88, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFD84, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFE68, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFF34, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCFFE8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD0090, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD0120, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD01A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD021C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD0288, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD02E8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD033C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD0384, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD03C0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD03F0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BD0414, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE824, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD0D98")
const AnimScr AnimScr_EfxMshield2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD042C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0480, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD04D4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0528, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD057C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD05D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0624, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0678, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD06E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0750, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD07BC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0828, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0894, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0900, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD096C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD09D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0A44, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0AA4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0AF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0B4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0B94, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0BD0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0C0C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield2_08BD0C30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMshield1_08BCE824, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};
