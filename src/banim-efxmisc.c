#include "gbafe.h"

extern u16 Tsa10_EfxMagfcastBG[], Tsa11_EfxMagfcastBG[], Tsa12_EfxMagfcastBG[],
    Tsa13_EfxMagfcastBG[], Tsa14_EfxMagfcastBG[], Tsa15_EfxMagfcastBG[], Tsa16_EfxMagfcastBG[],
    Tsa17_EfxMagfcastBG[], Tsa18_EfxMagfcastBG[], Tsa19_EfxMagfcastBG[], Tsa1_EfxChillEffectBG[],
    Tsa1_EfxMagdhisEffectBG[], Tsa1_EfxMagfcastBG[], Tsa20_EfxMagfcastBG[], Tsa21_EfxMagfcastBG[],
    Tsa22_EfxMagfcastBG[], Tsa2_EfxChillEffectBG[], Tsa2_EfxMagdhisEffectBG[], Tsa2_EfxMagfcastBG[],
    Tsa3_EfxChillEffectBG[], Tsa3_EfxMagdhisEffectBG[], Tsa3_EfxMagfcastBG[],
    Tsa4_EfxMagdhisEffectBG[], Tsa4_EfxMagfcastBG[], Tsa5_EfxMagfcastBG[], Tsa6_EfxMagfcastBG[],
    Tsa7_EfxMagfcastBG[], Tsa8_EfxMagfcastBG[], Tsa9_EfxMagfcastBG[];

extern const struct AnimSpriteData gUnk_08BA14D0[];

extern const struct AnimSpriteData AnimSprite_EfxChill1_L_08BD5698[],
    AnimSprite_EfxChill1_L_08BD56C8[], AnimSprite_EfxChill1_L_08BD56F8[],
    AnimSprite_EfxChill1_L_08BD5728[], AnimSprite_EfxChill1_L_08BD5758[],
    AnimSprite_EfxChill1_L_08BD5788[], AnimSprite_EfxChill1_L_08BD57B8[],
    AnimSprite_EfxChill1_L_08BD57E8[], AnimSprite_EfxChill1_L_08BD5818[],
    AnimSprite_EfxChill1_R_08BD5494[], AnimSprite_EfxChill1_R_08BD54C4[],
    AnimSprite_EfxChill1_R_08BD54F4[], AnimSprite_EfxChill1_R_08BD5524[],
    AnimSprite_EfxChill1_R_08BD5554[], AnimSprite_EfxChill1_R_08BD5584[],
    AnimSprite_EfxChill1_R_08BD55B4[], AnimSprite_EfxChill1_R_08BD55E4[],
    AnimSprite_EfxChill1_R_08BD5614[], AnimSprite_EfxChill2_L_08BD5C50[],
    AnimSprite_EfxChill2_L_08BD5CB0[], AnimSprite_EfxChill2_L_08BD5D10[],
    AnimSprite_EfxChill2_L_08BD5D70[], AnimSprite_EfxChill2_L_08BD5DD0[],
    AnimSprite_EfxChill2_L_08BD5E30[], AnimSprite_EfxChill2_L_08BD5E90[],
    AnimSprite_EfxChill2_L_08BD5EF0[], AnimSprite_EfxChill2_L_08BD5F50[],
    AnimSprite_EfxChill2_R_08BD589C[], AnimSprite_EfxChill2_R_08BD58FC[],
    AnimSprite_EfxChill2_R_08BD595C[], AnimSprite_EfxChill2_R_08BD59BC[],
    AnimSprite_EfxChill2_R_08BD5A1C[], AnimSprite_EfxChill2_R_08BD5A7C[],
    AnimSprite_EfxChill2_R_08BD5ADC[], AnimSprite_EfxChill2_R_08BD5B3C[],
    AnimSprite_EfxChill2_R_08BD5B9C[], AnimSprite_EfxDanceObj_08BA5E50[],
    AnimSprite_EfxDanceObj_08BA5E74[], AnimSprite_EfxDanceObj_08BA5E98[],
    AnimSprite_EfxDanceObj_08BA5EBC[], AnimSprite_EfxDanceObj_08BA5EE0[],
    AnimSprite_EfxDanceObj_08BA5F04[], AnimSprite_EfxDanceObj_08BA5F28[],
    AnimSprite_EfxDanceObj_08BA5F40[], AnimSprite_EfxDanceObj_08BA5F64[],
    AnimSprite_EfxDanceObj_08BA5F88[], AnimSprite_EfxDanceObj_08BA5FAC[],
    AnimSprite_EfxLokmsunaObjLeft_08BD90D0[], AnimSprite_EfxLokmsunaObjLeft_08BD9100[],
    AnimSprite_EfxLokmsunaObjLeft_08BD9148[], AnimSprite_EfxLokmsunaObjLeft_08BD9184[],
    AnimSprite_EfxLokmsunaObjLeft_08BD91A8[], AnimSprite_EfxLokmsunaObjLeft_08BD91C0[],
    AnimSprite_EfxLokmsunaObjRight_08BD91F4[], AnimSprite_EfxLokmsunaObjRight_08BD9224[],
    AnimSprite_EfxLokmsunaObjRight_08BD926C[], AnimSprite_EfxLokmsunaObjRight_08BD92A8[],
    AnimSprite_EfxLokmsunaObjRight_08BD92CC[], AnimSprite_EfxLokmsunaObjRight_08BD92E4[],
    AnimSprite_EfxMantBatabata1_L_08BB17FC[], AnimSprite_EfxMantBatabata1_L_08BB1844[],
    AnimSprite_EfxMantBatabata1_L_08BB18A4[], AnimSprite_EfxMantBatabata1_L_08BB1910[],
    AnimSprite_EfxMantBatabata1_R_08BB1668[], AnimSprite_EfxMantBatabata1_R_08BB16B0[],
    AnimSprite_EfxMantBatabata1_R_08BB1710[], AnimSprite_EfxMantBatabata1_R_08BB177C[],
    AnimSprite_EfxMantBatabata2_L_08BB1B3C[], AnimSprite_EfxMantBatabata2_L_08BB1B9C[],
    AnimSprite_EfxMantBatabata2_L_08BB1BFC[], AnimSprite_EfxMantBatabata2_L_08BB1C68[],
    AnimSprite_EfxMantBatabata2_R_08BB1990[], AnimSprite_EfxMantBatabata2_R_08BB19F0[],
    AnimSprite_EfxMantBatabata2_R_08BB1A50[], AnimSprite_EfxMantBatabata2_R_08BB1ABC[],
    AnimSprite_EfxMantBatabata3_L_08BB1E90[], AnimSprite_EfxMantBatabata3_L_08BB1F20[],
    AnimSprite_EfxMantBatabata3_L_08BB1F98[], AnimSprite_EfxMantBatabata3_R_08BB1CE8[],
    AnimSprite_EfxMantBatabata3_R_08BB1D78[], AnimSprite_EfxMantBatabata3_R_08BB1DF0[],
    AnimSprite_EfxMantBatabata4_L_08BB2170[], AnimSprite_EfxMantBatabata4_L_08BB220C[],
    AnimSprite_EfxMantBatabata4_R_08BB2038[], AnimSprite_EfxMantBatabata4_R_08BB20D4[],
    AnimSprite_EfxMantBatabata5_L_08BB2510[], AnimSprite_EfxMantBatabata5_L_08BB25D0[],
    AnimSprite_EfxMantBatabata5_L_08BB269C[], AnimSprite_EfxMantBatabata5_R_08BB22A8[],
    AnimSprite_EfxMantBatabata5_R_08BB2368[], AnimSprite_EfxMantBatabata5_R_08BB2434[],
    AnimSprite_EfxMantBatabata6_L_08BB289C[], AnimSprite_EfxMantBatabata6_L_08BB28FC[],
    AnimSprite_EfxMantBatabata6_L_08BB295C[], AnimSprite_EfxMantBatabata6_R_08BB2778[],
    AnimSprite_EfxMantBatabata6_R_08BB27D8[], AnimSprite_EfxMantBatabata6_R_08BB2838[],
    AnimSprite_EfxSongObj2_08BA6348[], AnimSprite_EfxSongObj2_08BA6360[],
    AnimSprite_EfxSongObj2_08BA6390[], AnimSprite_EfxSongObj2_08BA63CC[],
    AnimSprite_EfxSongObj2_08BA642C[], AnimSprite_EfxSongObj2_08BA64A4[],
    AnimSprite_EfxSongObj2_08BA6510[], AnimSprite_EfxSongObj2_08BA6564[],
    AnimSprite_EfxSongObj2_08BA65B8[], AnimSprite_EfxSongObj2_08BA65E8[],
    AnimSprite_EfxSongObj2_08BA6600[], AnimSprite_EfxSongObj2_08BA6618[],
    AnimSprite_EfxSunakemuriOBJ1_L_08BB1334[], AnimSprite_EfxSunakemuriOBJ1_L_08BB1358[],
    AnimSprite_EfxSunakemuriOBJ1_L_08BB137C[], AnimSprite_EfxSunakemuriOBJ1_L_08BB13A0[],
    AnimSprite_EfxSunakemuriOBJ1_R_08BB1290[], AnimSprite_EfxSunakemuriOBJ1_R_08BB12B4[],
    AnimSprite_EfxSunakemuriOBJ1_R_08BB12D8[], AnimSprite_EfxSunakemuriOBJ1_R_08BB12FC[],
    AnimSprite_EfxSunakemuriOBJ2_L_08BB147C[], AnimSprite_EfxSunakemuriOBJ2_L_08BB14A0[],
    AnimSprite_EfxSunakemuriOBJ2_L_08BB14C4[], AnimSprite_EfxSunakemuriOBJ2_L_08BB14E8[],
    AnimSprite_EfxSunakemuriOBJ2_R_08BB13D8[], AnimSprite_EfxSunakemuriOBJ2_R_08BB13FC[],
    AnimSprite_EfxSunakemuriOBJ2_R_08BB1420[], AnimSprite_EfxSunakemuriOBJ2_R_08BB1444[],
    AnimSprite_EfxSunakemuriOBJ3_L_08BB15C4[], AnimSprite_EfxSunakemuriOBJ3_L_08BB15E8[],
    AnimSprite_EfxSunakemuriOBJ3_L_08BB160C[], AnimSprite_EfxSunakemuriOBJ3_L_08BB1630[],
    AnimSprite_EfxSunakemuriOBJ3_R_08BB1520[], AnimSprite_EfxSunakemuriOBJ3_R_08BB1544[],
    AnimSprite_EfxSunakemuriOBJ3_R_08BB1568[], AnimSprite_EfxSunakemuriOBJ3_R_08BB158C[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA82F0[], AnimSprite_HurtmutEff00OBJ1_Left_08BA8308[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA8320[], AnimSprite_HurtmutEff00OBJ1_Left_08BA8344[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA8368[], AnimSprite_HurtmutEff00OBJ1_Left_08BA8380[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA8398[], AnimSprite_HurtmutEff00OBJ1_Left_08BA83BC[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA83E0[], AnimSprite_HurtmutEff00OBJ1_Left_08BA8428[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA8440[], AnimSprite_HurtmutEff00OBJ1_Left_08BA8464[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA8488[], AnimSprite_HurtmutEff00OBJ1_Left_08BA84B8[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA84E8[], AnimSprite_HurtmutEff00OBJ1_Left_08BA850C[],
    AnimSprite_HurtmutEff00OBJ1_Left_08BA8554[], AnimSprite_HurtmutEff00OBJ1_Right_08BA7F84[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA7F9C[], AnimSprite_HurtmutEff00OBJ1_Right_08BA7FB4[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA7FD8[], AnimSprite_HurtmutEff00OBJ1_Right_08BA7FFC[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA8014[], AnimSprite_HurtmutEff00OBJ1_Right_08BA802C[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA8050[], AnimSprite_HurtmutEff00OBJ1_Right_08BA8074[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA80BC[], AnimSprite_HurtmutEff00OBJ1_Right_08BA80D4[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA80F8[], AnimSprite_HurtmutEff00OBJ1_Right_08BA811C[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA814C[], AnimSprite_HurtmutEff00OBJ1_Right_08BA817C[],
    AnimSprite_HurtmutEff00OBJ1_Right_08BA81A0[], AnimSprite_HurtmutEff00OBJ1_Right_08BA81E8[],
    AnimSprite_HurtmutEff00OBJ2_Left_08BA88B8[], AnimSprite_HurtmutEff00OBJ2_Left_08BA8900[],
    AnimSprite_HurtmutEff00OBJ2_Left_08BA893C[], AnimSprite_HurtmutEff00OBJ2_Right_08BA865C[],
    AnimSprite_HurtmutEff00OBJ2_Right_08BA86A4[], AnimSprite_HurtmutEff00OBJ2_Right_08BA86E0[],
    AnimSprite_HurtmutEff01OBJ1_Left_08BA83F8[], AnimSprite_HurtmutEff01OBJ1_Left_08BA8410[],
    AnimSprite_HurtmutEff01OBJ1_Right_08BA808C[], AnimSprite_HurtmutEff01OBJ1_Right_08BA80A4[],
    AnimSprite_HurtmutEff01OBJ2_Left_08BA896C[], AnimSprite_HurtmutEff01OBJ2_Left_08BA8984[],
    AnimSprite_HurtmutEff01OBJ2_Left_08BA89B4[], AnimSprite_HurtmutEff01OBJ2_Left_08BA8A38[],
    AnimSprite_HurtmutEff01OBJ2_Left_08BA8AA4[], AnimSprite_HurtmutEff01OBJ2_Right_08BA8710[],
    AnimSprite_HurtmutEff01OBJ2_Right_08BA8728[], AnimSprite_HurtmutEff01OBJ2_Right_08BA8758[],
    AnimSprite_HurtmutEff01OBJ2_Right_08BA87DC[], AnimSprite_HurtmutEff01OBJ2_Right_08BA8848[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE884[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE8A8[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE8CC[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE8F0[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE914[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE938[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE95C[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE980[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE9A4[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E24[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E48[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E6C[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E90[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0EB4[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0ED8[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0EFC[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0F20[],
    AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0F44[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD5E4[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD608[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD62C[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD650[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD674[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD698[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD6BC[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD6E0[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD704[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFB54[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFB78[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFB9C[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFBC0[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFBE4[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC08[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC2C[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC50[],
    AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC74[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAE9C8[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAE9EC[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA10[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA34[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA58[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA7C[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEAA0[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEAC4[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEAE8[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEB0C[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEB30[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEB54[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0F68[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0F8C[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0FB0[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0FD4[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0FF8[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB101C[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB1040[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB1064[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB1088[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB10AC[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB10D0[],
    AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB10F4[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD728[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD74C[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD770[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD794[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD7B8[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD7DC[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD800[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD824[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD848[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD86C[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD890[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD8B4[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFC98[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFCBC[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFCE0[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD04[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD28[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD4C[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD70[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD94[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFDB8[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFDDC[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFE00[],
    AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFE24[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC7B0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC7D4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC810[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC84C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC87C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC8B8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC8F4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC930[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC954[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC990[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC9CC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACA08[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACA44[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACA80[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACABC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACAEC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACB28[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACB64[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACBA0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACBD0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACC0C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACC48[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACC6C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACCA8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACCE4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACD20[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACD5C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACD98[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACDD4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACE10[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACE4C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACE88[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACEC4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACF00[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACF3C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACF78[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACFA8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACFE4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD020[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD05C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD098[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD0D4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD110[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD14C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD188[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD1C4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD200[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD23C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD278[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD2B4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD2F0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD32C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD368[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD3A4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD3E0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD41C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD458[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD494[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD4C4[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD500[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD53C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD578[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD5A8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD8D8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAECF0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAED14[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAED50[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAED8C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEDC8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEE04[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEE40[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEE7C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEEA0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEEDC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEF18[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEF54[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEF90[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEFCC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF008[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF044[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF080[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF0BC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF0F8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF134[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF170[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF1AC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF1D0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF20C[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF248[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF284[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF2C0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF2FC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF338[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF374[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF3B0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF3EC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF428[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF464[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF4A0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF4DC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF518[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF554[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF590[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF5CC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF608[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF644[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF680[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF6BC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF6F8[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF734[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF764[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF7A0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF7DC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF818[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF854[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF884[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF8C0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF8FC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF938[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF974[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF9B0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF9EC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFA28[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFA64[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFAA0[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFADC[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFB18[],
    AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFE48[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADA50[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADA74[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADAB0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADAEC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADB1C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADB58[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADB94[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADBD0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADBF4[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADC30[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADC6C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADCA8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADCE4[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADD20[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADD5C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADD8C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADDC8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADE04[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADE40[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADE70[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADEAC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADEE8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADF0C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADF48[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADF84[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADFC0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADFFC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE038[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE074[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE0B0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE0EC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE128[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE164[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE1A0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE1DC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE218[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE248[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE284[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE2C0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE2FC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE338[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE374[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE3B0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE3EC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE428[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE464[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE4A0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE4DC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE518[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE554[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE590[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE5CC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE608[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE644[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE680[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE6BC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE6F8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE734[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE764[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE7A0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE7DC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE818[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE848[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAEB78[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BAFFC0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BAFFE4[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0020[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB005C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0098[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB00D4[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0110[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB014C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0170[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB01AC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB01E8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0224[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0260[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB029C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB02D8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0314[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0350[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB038C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB03C8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0404[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0440[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB047C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB04A0[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB04DC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0518[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0554[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0590[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB05CC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0608[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0644[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0680[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB06BC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB06F8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0734[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0770[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB07AC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB07E8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0824[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0860[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB089C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB08D8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0914[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0950[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB098C[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB09C8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0A04[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0A34[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0A70[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0AAC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0AE8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0B24[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0B54[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0B90[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0BCC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0C08[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0C44[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0C80[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0CBC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0CF8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0D34[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0D70[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0DAC[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0DE8[],
    AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB1118[];

/**
 * Misc banim effects (fireemblem8u: banim-efxmisc.c)
 */

extern int gEfxBgSemaphore;
extern s16 gEfxSpecalEffectExist[2];
extern s16 gBanimTerrain[2];
extern struct Anim * gUnknown_02000010[2];

void EfxYushaSpinShieldMain(struct ProcEfx * proc);
void NewEfxYushaSpinShieldOBJ(struct Anim * anim, int type);
void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ * proc);
void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ * proc);
void EfxHurtmutEff00Main(struct ProcEfx * proc);
void NewEfxHurtmutEff00OBJ(struct Anim * anim);
void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ * proc);
void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ * proc);
void NewEfxHurtmutEff01OBJ(struct Anim * anim);
void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ * proc);
void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ * proc);
void EfxMagfcastMain(struct ProcEfx * proc);
void NewEfxMagfcastBG(struct Anim * anim, u32 type);
void EfxMagfcastBGMain(struct ProcEfxBG * proc);
void EfxSunakemuriMain(struct ProcEfx * proc);
void NewEfxSunakemuriOBJ(struct Anim * anim, int type);
void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc);
void EfxLokmsunaMain(struct ProcEfx * proc);
void NewEfxLokmsunaOBJ(struct Anim * anim);
void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc);
void EfxKingPikaMain(struct ProcEfx * proc);
void EfxFlashFXMain(struct ProcEfx * proc);
void NewEfxSongOBJ2(struct Anim * anim);
void EfxSongOBJ2Main(struct ProcEfxOBJ * proc);
void NewEfxDanceOBJ(struct Anim * anim);
void EfxDanceOBJMain(struct ProcEfxOBJ * proc);
void EfxSpecalEffectMain(ProcPtr proc);
void NewEfxSRankWeaponEffect(struct Anim * anim);
void EfxSRankWeaponEffectMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectBG(struct Anim * anim);
void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc);
void NewEfxSRankWeaponEffectSCR(void);
void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc);
void NewEfxSRankWeaponEffectSCR2(struct ProcEfx * seff_scr);
void NewEfxMagdhisEffect(struct Anim * anim);
void EfxMagdhisEffectMain(struct ProcEfx * proc);
void NewEfxMagdhisEffectBG(struct Anim * anim, int duration);
void EfxMagdhisEffectBGMain(struct ProcEfxBG * proc);
void EfxMantBatabata_Loop1(struct ProcEfxOBJ * proc);
void EfxMantBatabata_Loop2(struct ProcEfxOBJ * proc);
void EfxChillEffectMain(struct ProcEfx * proc);
void NewEfxChillEffectBG(struct Anim * anim);
void EfxChillEffectBGMain(struct ProcEfxBG * proc);
void NewEfxChillEffectBGCOL(struct Anim * anim);
void EfxChillEffectBGCOL_Loop(struct ProcEfxBGCOL * proc);
void EfxChillAnime_Loop(struct ProcEfxOBJ * proc);

extern const struct ProcCmd ProcScr_efxYushaSpinShield[];
extern const struct ProcCmd ProcScr_efxYushaSpinShieldOBJ[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_LeftTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_RightTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_LeftTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ_RightTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_LeftTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_RightTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_LeftTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ2_RightTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_LeftTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_RightTypeA[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_LeftTypeB[];
extern const AnimScr AnimScr_YushaSpinShieldOBJ3_RightTypeB[];

extern const struct ProcCmd ProcScr_efxHurtmutEff00[];
extern const struct ProcCmd ProcScr_efxHurtmutEff00OBJ[];
extern const struct ProcCmd ProcScr_efxHurtmutEff01OBJ[];
extern const AnimScr FramScr_Unk5D4F90[];
extern const AnimScr AnimScr_HurtmutEff00OBJ1_Right[];
extern const AnimScr AnimScr_HurtmutEff00OBJ1_Left[];
extern const AnimScr AnimScr_HurtmutEff00OBJ2_Right[];
extern const AnimScr AnimScr_HurtmutEff00OBJ2_Left[];
extern const AnimScr AnimScr_HurtmutEff01OBJ1_Right[];
extern const AnimScr AnimScr_HurtmutEff01OBJ1_Left[];
extern const AnimScr AnimScr_HurtmutEff01OBJ2_Right[];
extern const AnimScr AnimScr_HurtmutEff01OBJ2_Left[];
extern const u16 Pal_EfxHurtmutEff00OBJ[];
extern const u8 Img_EfxHurtmutEff00OBJ1[];
extern const u8 Img_EfxHurtmutEff00OBJ2[];

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
void NewEfxYushaSpinShield(struct Anim * anim, int type)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxYushaSpinShield, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    NewEfxYushaSpinShieldOBJ(anim, type);
}

void EfxYushaSpinShieldMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxYushaSpinShieldOBJ(struct Anim * anim, int type)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    proc = Proc_Start(ProcScr_efxYushaSpinShieldOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = type;

    if (type == 0)
    {
        scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeA;
        scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeA;
    }
    else
    {
        scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeB;
        scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeB;
    }

    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    anim2->oam2Base &= 0xC00;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;
}

void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (++proc->timer != 0x45)
        return;

    if (proc->unk29 == 0)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
        }
    }
    else
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ * proc)
{
    if (!(proc->anim->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
        return;

    if (!(proc->anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
        return;

    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (CheckEkrHitDone() != true)
        return;

    if (proc->unk29 == 0)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
        }
    }
    else
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
        }
        else
        {
            anim2->pScrStart = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
            anim2->pScrCurrent = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x14)
    {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
void NewEfxHurtmutEff00(struct Anim * anim)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;

    proc = Proc_Start(ProcScr_efxHurtmutEff00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        NewEfxHurtmutEff00OBJ(anim);
    else
        NewEfxHurtmutEff01OBJ(anim);
}

void EfxHurtmutEff00Main(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxHurtmutEff00OBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff00OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxHurtmutEff01OBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff01OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ * proc)
{
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(proc->anim) == EKR_POS_R)
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Right;
    }
    else
    {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

/**
 * C2E: banim_code_effect_magic_rune_normal
 * C2F: banim_code_effect_magic_rune_critical
 */
extern const struct ProcCmd ProcScr_efxMagfcast[];
extern const struct ProcCmd ProcScr_efxMagfcastBG[];
extern const u16 FrameConfig_EfxMagFcastBg1[];
extern const u16 FrameConfig_EfxMagFcastBg2[];
extern const u16 FrameConfig_EfxMagFcastBg3[];
extern const u16 FrameConfig_EfxMagFcastBg4[];
extern u16 * const TsaLut1_EfxMagfcastBG[];
extern u16 * const TsaLut2_EfxMagfcastBG[];
extern const u8 Img_EfxMagfcastBG[];
extern const u16 Pal_EfxMagfcastBG[];

void NewEfxMagfcast(struct Anim * anim, int type)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    switch (gBanimIdx[GetAnimPosition(anim)])
    {
    case 0x57:
    case 0x58:
        NewEfxMagfcastBG(proc->anim, type);
        break;

    /* Just for switch case align */
    case 0x59:
    case 0x5A:
    default:
        NewEfxMagfcastBG(proc->anim, type + 2);
        break;
    }
}

void EfxMagfcastMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x14)
        Proc_Break(proc);
}

void NewEfxMagfcastBG(struct Anim * anim, u32 type)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagfcastBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (type)
    {
    case 0:
        proc->frame_config = FrameConfig_EfxMagFcastBg1;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 1:
        proc->frame_config = FrameConfig_EfxMagFcastBg2;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 2:
        proc->frame_config = FrameConfig_EfxMagFcastBg3;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        break;

    case 3:
        proc->frame_config = FrameConfig_EfxMagFcastBg4;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
        break;

    default:
        break;
    }

    SpellFx_RegisterBgGfx(Img_EfxMagfcastBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxMagfcastBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0x18, 0);
        else
            SetBgOffset(BG_1, 0xE8, 0);
    }
}

void EfxMagfcastBGMain(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsa1 = proc->tsal;
        u16 * const * tsa2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_End(proc);
    }
}

/**
 * C30: banim_code_effect_dirt_kick
 * C31: banim_code_effect_dirt_wave_small
 * C32: banim_code_effect_dirt_wave_medium
 */
extern const struct ProcCmd ProcScr_efxSunakemuri[];
extern const struct ProcCmd ProcScr_efxSunakemuriOBJ[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ1_R[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ2_R[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ3_R[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ1_L[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ2_L[];
extern const AnimScr AnimScr_EfxSunakemuriOBJ3_L[];
extern const u16 Pal_EfxSunakemuriOBJ1[];
extern const u16 Pal_EfxSunakemuriOBJ2[];
extern const u16 Pal_EfxSunakemuriOBJ3[];
extern const u8 Img_EfxSunakemuriOBJ[];

int IsAnimSoundInPositionMaybe(struct Anim * anim);

void NewEfxSunakemuri(struct Anim * anim, int type)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0)
    {
        proc = Proc_Start(ProcScr_efxSunakemuri, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxSunakemuriOBJ(anim, type);
    }
}

void EfxSunakemuriMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxSunakemuriOBJ(struct Anim * anim, int type)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSunakemuriOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxSunakemuriOBJ1_R;
    if (type != 0)
    {
        scr1 = AnimScr_EfxSunakemuriOBJ3_R;
        if (type == 1)
            scr1 = AnimScr_EfxSunakemuriOBJ2_R;
    }

    scr2 = AnimScr_EfxSunakemuriOBJ1_L;
    if (type != 0)
    {
        scr2 = AnimScr_EfxSunakemuriOBJ3_L;
        if (type == 1)
            scr2 = AnimScr_EfxSunakemuriOBJ2_L;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);

    switch (gBanimTerrain[GetAnimPosition(proc->anim)])
    {
    case 0x01: case 0x02: case 0x03: case 0x04: case 0x05:
    case 0x0A:
    case 0x0C: case 0x0D: case 0x0E: case 0x0F:
    case 0x11: case 0x12: case 0x13:
    case 0x19: case 0x1A: case 0x1B: case 0x1C:
    case 0x22: case 0x23:
    case 0x25: case 0x26: case 0x27: case 0x28: case 0x29: case 0x2A: case 0x2B:
    case 0x2F:
    case 0x33:
    case 0x38: case 0x39: case 0x3A: case 0x3B:
    case 0x3D:
    case 0x3F: case 0x40:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
        break;

    case 0x14:
        if (IsAnimSoundInPositionMaybe(proc->anim) != EKR_POS_L)
            SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
        else
            SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
        break;

    case 0x10: case 0x15: case 0x16: case 0x36: case 0x3C:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
        break;

    case 0x06: case 0x07: case 0x08: case 0x09:
    case 0x0B:
    case 0x17: case 0x18:
    case 0x1D: case 0x1E: case 0x1F: case 0x20: case 0x21:
    case 0x24:
    case 0x2D:
    case 0x30: case 0x31: case 0x32:
    case 0x37:
    case 0x3E:
        SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ3, 0x20);
        break;

    case 0x00:
    default:
        break;
    }

    SpellFx_RegisterObjGfx(Img_EfxSunakemuriOBJ, 0x1000);
}

void EfxSunakemuriOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x9)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C4E: banim_code_effect_dirt_wave
 */
extern const struct ProcCmd ProcScr_efxLokmsuna[];
extern const struct ProcCmd ProcScr_efxLokmsunaOBJ[];
extern const AnimScr AnimScr_EfxLokmsunaObjLeft[];
extern const AnimScr AnimScr_EfxLokmsunaObjRight[];
extern const u8 Img_EfxLokmsunaObj[];

void NewEfxLokmsuna(struct Anim * anim)
{
    struct ProcEfx * proc;

    if (gEfxBgSemaphore == 0)
    {
        proc = Proc_Start(ProcScr_efxLokmsuna, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxLokmsunaOBJ(anim);
    }
}

void EfxLokmsunaMain(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void NewEfxLokmsunaOBJ(struct Anim * anim)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct Anim * anim2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLokmsunaOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxLokmsunaObjLeft;
    scr2 = AnimScr_EfxLokmsunaObjRight;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    anim2->oam2Base &= 0xFFF;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7000;
    else
        anim2->oam2Base |= 0x9000;

    SpellFx_RegisterObjGfx(Img_EfxLokmsunaObj, 0x1000);
}

void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0xF)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C39: banim_code_hit_fake
 */
extern const struct ProcCmd ProcScr_efxKingPika[];
extern const struct ProcCmd ProcScr_efxFlashFX[];

void NewEfxFlashUnit(struct Anim * anim, u16 a, u16 b, int c);

void NewEfxKingPika(struct Anim * anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxKingPika, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxKingPikaMain(struct ProcEfx * proc)
{
    struct Anim * anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1)
    {
        NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
        return;
    }

    if (time == 0xA)
    {
        NewEfxFlashBgWhite(anim, 0x14);
        return;
    }

    if (time == 0x2D)
    {
        struct Anim * anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim * anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * C51: banim_code_flash_white
 */
void NewEfxFlashFX(struct Anim * anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxFlashFX, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxFlashFXMain(struct ProcEfx * proc)
{
    struct Anim * anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1)
    {
        NewEfxFlashBgWhite(anim, 0x5);
        return;
    }

    if (time == 0x6)
    {
        struct Anim * anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim * anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * Maybe unused banim commands?
 */
extern const struct ProcCmd ProcScr_efxSongOBJ2[];
extern const struct ProcCmd ProcScr_efxDanceOBJ[];
extern const AnimScr AnimScr_EfxSongObj2[];
extern const AnimScr AnimScr_EfxDanceObj[];
extern const u16 Pal_EfxDanceObj[];
extern const u8 Img_EfxDanceObj[];

void NewEfxSongOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSongOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);
}

void EfxSongOBJ2Main(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x18)
        PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxDanceOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxDanceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x19;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xE1, 0x100, proc->anim->xPosition, 0x1);
}

void EfxDanceOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Shinning effect for legend weapon
 */
extern const struct ProcCmd ProcScr_efxSpecalEffect[];
extern const struct ProcCmd ProcScr_efxSRankWeaponEffect[];
extern const struct ProcCmd ProcScr_efxSRankWeaponEffectBG[];
extern const struct ProcCmd ProcScr_efxSRankWeaponEffectSCR[];
extern const struct ProcCmd ProcScr_efxSRankWeaponEffectSCR2[];
extern const u8 Img_EfxSRankWeaponEffectBG[];
extern const u16 Pal_EfxSRankWeaponEffectBG[];
extern const u16 Tsa_EfxSRankWeaponEffectBG[];
extern const s16 gUnknown_085D9154[];

struct ProcEfxSRankSCR2 {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct ProcEfx * seff_scr1;
};

void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc);

void NewEfxSpecalEffect(struct Anim * anim)
{
    struct BattleUnit * bu;
    struct ProcEfx * proc;
    struct Anim * anim1;
    struct Anim * anim2;

    if (gEfxSpecalEffectExist[GetAnimPosition(anim)] == false)
    {
        gEfxSpecalEffectExist[GetAnimPosition(anim)] = true;

        if (GetAnimPosition(anim) == EKR_POS_L)
            bu = gpEkrBattleUnitLeft;
        else
            bu = gpEkrBattleUnitRight;

        if (IsWeaponLegency(bu->weaponBefore) == false)
        {
            anim1 = gAnims[GetAnimPosition(anim) * 2];
            anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

            anim1->state3 |= ANIM_BIT3_BLOCKEND;
            anim2->state3 |= ANIM_BIT3_BLOCKEND;
            return;
        }
    }
    else
    {
        anim1 = gAnims[GetAnimPosition(anim) * 2];
        anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        return;
    }

    proc = Proc_Start(ProcScr_efxSpecalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
    PlaySFX(0xF0, 0x100, 0x78, 0x0);
    NewEfxSRankWeaponEffect(anim);
}

void EfxSpecalEffectMain(ProcPtr proc)
{
    Proc_Break(proc);
}

void NewEfxSRankWeaponEffect(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxSRankWeaponEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
}

void EfxSRankWeaponEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;

    if (time == 1)
    {
        NewEfxSRankWeaponEffectBG(proc->anim);
        return;
    }

    if (time == 0x15)
    {
        NewEfxRestWINH_(proc->anim, 0x2D, 0x1);
        NewEfxSRankWeaponEffectSCR();
        return;
    }

    if (time == 0x46)
    {
        struct Anim * anim1;
        struct Anim * anim2;

        anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    proc = Proc_Start(ProcScr_efxSRankWeaponEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(Img_EfxSRankWeaponEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxSRankWeaponEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxSRankWeaponEffectBG, Tsa_EfxSRankWeaponEffectBG);
    SpellFx_SetSomeColorEffect();
}

void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x3C)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectSCR(void)
{
    struct ProcEfx * proc;

    proc = Proc_Start(ProcScr_efxSRankWeaponEffectSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;
    NewEfxSRankWeaponEffectSCR2(proc);
}

void EfxSRankWeaponEffectSCRMain(struct ProcEfx * proc)
{
    u32 i;
    u16 * dst = !gEkrBg1ScrollFlip
        ? gpBg1ScrollOffsetList1
        : gpBg1ScrollOffsetList2;

    for (i = 0; i < 160; dst++, i++)
    {
        if (i < 120)
        {
            s16 ref = gUnknown_085D9154[i] * proc->unk44 >> 0xC;

            if (ref)
            {
                if (i < 60)
                {
                    if (ref < i - 0x88)
                        ref = i + -0x88; // required for matching
                }
                else
                {
                    if (ref > 0x88 - i)
                        ref = 0x88 - i;
                }
            }
            *dst = ref;
        }
        else
        {
            *dst = 0;
        }
    }
}

void NewEfxSRankWeaponEffectSCR2(struct ProcEfx * seff_scr)
{
    struct ProcEfxSRankSCR2 * proc;

    proc = Proc_Start(ProcScr_efxSRankWeaponEffectSCR2, PROC_TREE_3);
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->seff_scr1 = seff_scr;
}

void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc)
{
    struct ProcEfx * seff_scr = proc->seff_scr1;

    seff_scr->unk44 = Interpolate(INTERPOLATE_LINEAR, 0, 0x40000, proc->timer, proc->terminator);

    if (++proc->timer > proc->terminator)
    {
        Proc_End(seff_scr);
        Proc_Break(proc);
    }
}

extern const struct ProcCmd ProcScr_efxMagdhisEffect[];
extern const struct ProcCmd ProcScr_efxMagdhisEffectBG[];
extern u16 * const TsaLut_EfxMagdhisEffectBG[];
extern const u16 FrameConf_EfxMagdhisEffectBG[];
extern const u16 Pal_EfxMagdhisEffectBG[];
extern const u8 Img_EfxMagdhisEffectBG[];

void M4aPlayWithPostionCtrl(int songid, int x, int flag);

void NewEfxMagdhisEffect(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxMagdhisEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxMagdhisEffectMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x11)
    {
        NewEfxMagdhisEffectBG(proc->anim, 0x49);
        EfxPlaySE(0x140, 0x100);
        M4aPlayWithPostionCtrl(0x140, proc->anim->xPosition, 1);
    }

    if (proc->timer == 0x64)
        Proc_Break(proc);
}

void NewEfxMagdhisEffectBG(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMagdhisEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = duration;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxMagdhisEffectBG;
    proc->tsal = TsaLut_EfxMagdhisEffectBG;
    proc->tsar = TsaLut_EfxMagdhisEffectBG;

    SpellFx_RegisterBgPal(Pal_EfxMagdhisEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxMagdhisEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;
    SetBgOffset(BG_1, 0x10, 0x0);
}

void EfxMagdhisEffectBGMain(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * buf1 = proc->tsal;
        u16 * const * buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
    }

    if (++proc->terminator == proc->unk30)
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg3_ct.priority = 2;
        gDispIo.bg2_ct.priority = 3;
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

/**
 * C47: banim_code_cape_flowing
 */
extern const struct ProcCmd ProcScr_efxMantBatabata[];
extern const AnimScr AnimScr_EfxMantBatabata1_R[];
extern const AnimScr AnimScr_EfxMantBatabata1_L[];
extern const AnimScr AnimScr_EfxMantBatabata2_R[];
extern const AnimScr AnimScr_EfxMantBatabata2_L[];
extern const AnimScr AnimScr_EfxMantBatabata3_R[];
extern const AnimScr AnimScr_EfxMantBatabata3_L[];
extern const AnimScr AnimScr_EfxMantBatabata4_R[];
extern const AnimScr AnimScr_EfxMantBatabata4_L[];
extern const AnimScr AnimScr_EfxMantBatabata5_R[];
extern const AnimScr AnimScr_EfxMantBatabata5_L[];
extern const AnimScr AnimScr_EfxMantBatabata6_R[];
extern const AnimScr AnimScr_EfxMantBatabata6_L[];

void NewEfxMantBatabata(struct Anim * anim)
{
    s16 banim_index;
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    banim_index = gBanimIdx[GetAnimPosition(anim)] - 0x57;
    switch (banim_index)
    {
    case 0x0:
    case 0x1:
        scr1 = AnimScr_EfxMantBatabata1_R;
        scr2 = AnimScr_EfxMantBatabata1_L;
        break;

    case 0x2:
    case 0x4:
        scr1 = AnimScr_EfxMantBatabata2_R;
        scr2 = AnimScr_EfxMantBatabata2_L;
        break;

    case 0x11:
        scr1 = AnimScr_EfxMantBatabata3_R;
        scr2 = AnimScr_EfxMantBatabata3_L;
        break;

    case 0x1A:
    case 0x1B:
        scr1 = AnimScr_EfxMantBatabata4_R;
        scr2 = AnimScr_EfxMantBatabata4_L;
        break;

    case 0x14:
    case 0x15:
        scr1 = AnimScr_EfxMantBatabata5_R;
        scr2 = AnimScr_EfxMantBatabata5_L;
        break;

    default:
        scr1 = AnimScr_EfxMantBatabata6_R;
        scr2 = AnimScr_EfxMantBatabata6_L;
        break;
    }

    proc = Proc_Start(ProcScr_efxMantBatabata, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gUnknown_02000010[GetAnimPosition(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;

    SetAnimStateHidden(GetAnimPosition(proc->anim));
}

void EfxMantBatabata_Loop1(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (!(proc->anim->state3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
        return;

    if (!(proc->anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
        return;

    Proc_Break(proc);
}

void EfxMantBatabata_Loop2(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (CheckEkrHitDone() == 0x1)
    {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        AnimDelete(proc->anim2);
        gUnknown_02000010[GetAnimPosition(proc->anim)] = NULL;
        Proc_Break(proc);
    }
}

/**
 * Some critical atk effect?
 */
extern const struct ProcCmd ProcScr_efxChillEffect[];
extern const struct ProcCmd ProcScr_efxChillEffectBG[];
extern const struct ProcCmd ProcScr_efxChillEffectBGCOL[];
extern const struct ProcCmd ProcScr_efxChillAnime[];
extern const u16 FrameConf_EfxChillEffectBG[];
extern u16 * const TsaLut_EfxChillEffectBG[];
extern const u8 Img_ExcaliburBg2[];
extern const u16 FrameConf_EfxChillEffectBGCOL[];
extern u16 Pal_EfxChillEffectBG[];
extern const AnimScr AnimScr_EfxChill1_R[];
extern const AnimScr AnimScr_EfxChill1_L[];
extern const AnimScr AnimScr_EfxChill2_R[];
extern const AnimScr AnimScr_EfxChill2_L[];

void NewEfxChillEffect(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_SetBG1Position();
    proc = Proc_Start(ProcScr_efxChillEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxChillEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;

    if (time == 0x1)
    {
        NewEfxChillEffectBG(proc->anim);
        NewEfxChillEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x3)
    {
        NewEfxFlashBgBlack(proc->anim, 0x5);
        return;
    }

    if (time == 0x11)
    {
        NewEfxFlashBgBlack(proc->anim, 0x5);
        return;
    }

    if (time == 0x24)
    {
        Proc_Break(proc);
        return;
    }
}

void NewEfxChillEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxChillEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxChillEffectBG;
    proc->tsal = TsaLut_EfxChillEffectBG;
    proc->tsar = TsaLut_EfxChillEffectBG;
    SpellFx_RegisterBgGfx(Img_ExcaliburBg2, 0x2000);
    SetBgOffset(BG_1, 0x0, 0x0);
}

void EfxChillEffectBGMain(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * buf1 = proc->tsal;
        u16 * const * buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void NewEfxChillEffectBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    proc = Proc_Start(ProcScr_efxChillEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxChillEffectBGCOL;
    proc->pal = Pal_EfxChillEffectBG;
}

void EfxChillEffectBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, (const s16 *)proc->frame_config);

    if (ret >= 0)
    {
        u16 * src = proc->pal;
        SpellFx_RegisterBgPal(src + ret * 0x10, 0x20);
        return;
    }

    if (ret == -1)
    {
        Proc_Break(proc);
        return;
    }
}

void NewEfxChillAnime(struct Anim * anim, int type)
{
    const AnimScr * scr1;
    const AnimScr * scr2;
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    if (type == 0)
    {
        scr1 = AnimScr_EfxChill1_R;
        scr2 = AnimScr_EfxChill1_L;
    }
    else
    {
        scr1 = AnimScr_EfxChill2_R;
        scr2 = AnimScr_EfxChill2_L;
    }

    proc = Proc_Start(ProcScr_efxChillAnime, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;
    gUnknown_02000010[GetAnimPosition(proc->anim)] = proc->anim2;

    anim2->oam2Base &= 0xC00;

    anim2->drawLayerPriority = 0x64;
    AnimSort();

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200;
    else
        anim2->oam2Base |= 0x9300;

    SetAnimStateHidden(GetAnimPosition(proc->anim));
}

void EfxChillAnime_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * _anim1;
    struct Anim * _anim2;

    proc->anim2->xPosition = proc->anim->xPosition;

    if (++proc->timer == 0x14)
    {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        AnimDelete(proc->anim2);
        gUnknown_02000010[GetAnimPosition(proc->anim)] = NULL;

        _anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        _anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];

        _anim1->state3 |= ANIM_BIT3_BLOCKEND;
        _anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

SECTION(".rodata.08BA42AC")
const struct ProcCmd ProcScr_efxYushaSpinShield[] = {
    PROC_19,
    PROC_REPEAT(EfxYushaSpinShieldMain),
    PROC_END,
};

SECTION(".rodata.08BA42C4")
const struct ProcCmd ProcScr_efxYushaSpinShieldOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CD14),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CD7C),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CDA4),
    PROC_REPEAT(efxYushaSpinShieldOBJ_806CE08),
    PROC_END,
};

SECTION(".rodata.08BA42F4")
const struct ProcCmd ProcScr_efxHurtmutEff00[] = {
    PROC_19,
    PROC_REPEAT(EfxHurtmutEff00Main),
    PROC_END,
};

SECTION(".rodata.08BA430C")
const struct ProcCmd ProcScr_efxHurtmutEff00OBJ[] = {
    PROC_19,
    PROC_REPEAT(efxHurtmutEff00OBJ_806CEC4),
    PROC_SLEEP(26),
    PROC_REPEAT(efxHurtmutEff00OBJ_806CF10),
    PROC_SLEEP(8),
    PROC_REPEAT(efxHurtmutEff00OBJ_806CF5C),
    PROC_END,
};

SECTION(".rodata.08BA4344")
const struct ProcCmd ProcScr_efxHurtmutEff01OBJ[] = {
    PROC_19,
    PROC_REPEAT(efxHurtmutEff01OBJ_806CFC4),
    PROC_SLEEP(58),
    PROC_REPEAT(efxHurtmutEff01OBJ_806D010),
    PROC_SLEEP(21),
    PROC_REPEAT(efxHurtmutEff01OBJ_806D05C),
    PROC_END,
};

SECTION(".rodata.08BA437C")
const struct ProcCmd ProcScr_efxMagfcast[] = {
    PROC_19,
    PROC_REPEAT(EfxMagfcastMain),
    PROC_END,
};

SECTION(".rodata.08BA4394")
const struct ProcCmd ProcScr_efxMagfcastBG[] = {
    PROC_19,
    PROC_REPEAT(EfxMagfcastBGMain),
    PROC_END,
};

SECTION(".rodata.08BA4404")
const struct ProcCmd ProcScr_efxSunakemuri[] = {
    PROC_19,
    PROC_REPEAT(EfxSunakemuriMain),
    PROC_END,
};

SECTION(".rodata.08BA441C")
const struct ProcCmd ProcScr_efxSunakemuriOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxSunakemuriOBJMain),
    PROC_END,
};

SECTION(".rodata.08BA4434")
const struct ProcCmd ProcScr_efxLokmsuna[] = {
    PROC_19,
    PROC_REPEAT(EfxLokmsunaMain),
    PROC_END,
};

SECTION(".rodata.08BA444C")
const struct ProcCmd ProcScr_efxLokmsunaOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxLokmsunaIOBJMain),
    PROC_END,
};

SECTION(".rodata.08BA4464")
const struct ProcCmd ProcScr_efxKingPika[] = {
    PROC_19,
    PROC_REPEAT(EfxKingPikaMain),
    PROC_END,
};

SECTION(".rodata.08BA447C")
const struct ProcCmd ProcScr_efxFlashFX[] = {
    PROC_19,
    PROC_REPEAT(EfxFlashFXMain),
    PROC_END,
};

SECTION(".rodata.08BA4494")
const struct ProcCmd ProcScr_efxSongOBJ2[] = {
    PROC_19,
    PROC_REPEAT(EfxSongOBJ2Main),
    PROC_END,
};

SECTION(".rodata.08BA44AC")
const struct ProcCmd ProcScr_efxDanceOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxDanceOBJMain),
    PROC_END,
};

SECTION(".rodata.08BA44C4")
const struct ProcCmd ProcScr_efxSpecalEffect[] = {
    PROC_19,
    PROC_REPEAT(EfxSpecalEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA44DC")
const struct ProcCmd ProcScr_efxSRankWeaponEffect[] = {
    PROC_19,
    PROC_REPEAT(EfxSRankWeaponEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA44F4")
const struct ProcCmd ProcScr_efxSRankWeaponEffectBG[] = {
    PROC_19,
    PROC_REPEAT(EfxSRankWeaponEffectBGMain),
    PROC_END,
};

SECTION(".rodata.08BA450C")
const struct ProcCmd ProcScr_efxSRankWeaponEffectSCR[] = {
    PROC_19,
    PROC_REPEAT(EfxSRankWeaponEffectSCRMain),
    PROC_END,
};

SECTION(".rodata.08BA4524")
const struct ProcCmd ProcScr_efxSRankWeaponEffectSCR2[] = {
    PROC_19,
    PROC_REPEAT(EfxSRankWeaponEffectSCR2Main),
    PROC_END,
};

SECTION(".rodata.08BA462C")
const struct ProcCmd ProcScr_efxMagdhisEffect[] = {
    PROC_19,
    PROC_REPEAT(EfxMagdhisEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA4644")
const struct ProcCmd ProcScr_efxMagdhisEffectBG[] = {
    PROC_19,
    PROC_REPEAT(EfxMagdhisEffectBGMain),
    PROC_END,
};

SECTION(".rodata.08BA466C")
const struct ProcCmd ProcScr_efxMantBatabata[] = {
    PROC_19,
    PROC_REPEAT(EfxMantBatabata_Loop1),
    PROC_REPEAT(EfxMantBatabata_Loop2),
    PROC_END,
};

SECTION(".rodata.08BA468C")
const struct ProcCmd ProcScr_efxChillEffect[] = {
    PROC_19,
    PROC_REPEAT(EfxChillEffectMain),
    PROC_END,
};

SECTION(".rodata.08BA46A4")
const struct ProcCmd ProcScr_efxChillEffectBG[] = {
    PROC_19,
    PROC_REPEAT(EfxChillEffectBGMain),
    PROC_END,
};

SECTION(".rodata.08BA46C8")
const struct ProcCmd ProcScr_efxChillEffectBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxChillEffectBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA46E8")
const struct ProcCmd ProcScr_efxChillAnime[] = {
    PROC_19,
    PROC_REPEAT(EfxChillAnime_Loop),
    PROC_END,
};

SECTION(".rodata.08BA6630")
const AnimScr AnimScr_EfxDanceObj[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5E50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5E74, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5E98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5EBC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5EE0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5F04, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5F28, 30),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5F40, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5F64, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5F88, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxDanceObj_08BA5FAC, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA6660")
const AnimScr AnimScr_EfxSongObj2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6348, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6360, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6390, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA63CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA642C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA64A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6510, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6564, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA65B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA65E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6600, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6618, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6348, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6360, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6390, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA63CC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA642C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA64A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6510, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6564, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA65B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA65E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6600, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSongObj2_08BA6618, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA8230")
const AnimScr AnimScr_HurtmutEff00OBJ1_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7F84, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7F9C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7FB4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7FD8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7FFC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8014, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA802C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8050, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8074, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA80BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA80D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA80F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA811C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA814C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA817C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA81A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA81E8, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA8278")
const AnimScr AnimScr_HurtmutEff01OBJ1_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7F84, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7F9C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7FB4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7FD8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA7FFC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8014, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA802C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8050, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8074, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Right_08BA808C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Right_08BA80A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8014, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA802C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8050, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8074, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Right_08BA808C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Right_08BA80A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8074, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Right_08BA808C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Right_08BA80A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA8014, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA80BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA80D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA80F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA811C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA814C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA817C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA81A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Right_08BA81E8, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA859C")
const AnimScr AnimScr_HurtmutEff00OBJ1_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA82F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8308, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8320, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8344, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8368, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8380, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8398, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8428, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8440, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8464, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8488, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA84B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA84E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA850C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8554, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA85E4")
const AnimScr AnimScr_HurtmutEff01OBJ1_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA82F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8308, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8320, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8344, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8368, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8380, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8398, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Left_08BA83F8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Left_08BA8410, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8380, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8398, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83BC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Left_08BA83F8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Left_08BA8410, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA83E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Left_08BA83F8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ1_Left_08BA8410, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8380, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8428, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8440, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8464, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8488, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA84B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA84E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA850C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ1_Left_08BA8554, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA8884")
const AnimScr AnimScr_HurtmutEff00OBJ2_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Right_08BA865C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Right_08BA86A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Right_08BA86E0, 3),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA8894")
const AnimScr AnimScr_HurtmutEff01OBJ2_Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Right_08BA865C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Right_08BA86A4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Right_08BA86E0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Right_08BA8710, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Right_08BA8728, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Right_08BA8758, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Right_08BA87DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Right_08BA8848, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA8AE0")
const AnimScr AnimScr_HurtmutEff00OBJ2_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Left_08BA88B8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Left_08BA8900, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Left_08BA893C, 3),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA8AF0")
const AnimScr AnimScr_HurtmutEff01OBJ2_Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Left_08BA88B8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Left_08BA8900, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff00OBJ2_Left_08BA893C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Left_08BA896C, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Left_08BA8984, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Left_08BA89B4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Left_08BA8A38, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_HurtmutEff01OBJ2_Left_08BA8AA4, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BAD8F0")
const AnimScr AnimScr_YushaSpinShieldOBJ_LeftTypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC7B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC7D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC810, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC84C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC87C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC8B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC8F4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC930, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC954, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC990, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAC9CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACA08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACA44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACA80, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACABC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACAEC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACB28, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACB64, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACBA0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACBD0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACC0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACC48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACC6C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACCA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACCE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACD20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACD5C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACD98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACDD4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACE10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACE4C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACE88, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACEC4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACF00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACF3C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACF78, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACFA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BACFE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD020, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD05C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD098, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD0D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD110, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD14C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD188, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD1C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD200, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD23C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD278, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD2B4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD2F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD32C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD368, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD3A4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD3E0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD41C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD458, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD4C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD500, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD53C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD578, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD5A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeA_08BAD8D8, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAD9F4")
const AnimScr AnimScr_YushaSpinShieldOBJ2_RightTypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD5E4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD608, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD62C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD650, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD674, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD6BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD6E0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeA_08BAD704, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BADA1C")
const AnimScr AnimScr_YushaSpinShieldOBJ3_RightTypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD728, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD74C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD770, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD794, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD7B8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD7DC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD800, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD824, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD848, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD86C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD890, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeA_08BAD8B4, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAEB90")
const AnimScr AnimScr_YushaSpinShieldOBJ_RightTypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADA50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADA74, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADAB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADAEC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADB1C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADB58, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADB94, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADBD0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADBF4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADC30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADC6C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADCA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADCE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADD20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADD5C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADD8C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADDC8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADE04, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADE40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADE70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADEAC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADEE8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADF0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADF48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADF84, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADFC0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BADFFC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE038, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE074, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE0B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE0EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE128, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE164, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE1A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE1DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE218, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE248, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE284, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE2C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE2FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE338, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE374, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE3B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE3EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE428, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE464, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE4A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE4DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE518, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE590, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE5CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE608, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE644, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE680, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE6BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE6F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE734, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE764, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE7A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE7DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE818, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAE848, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeA_08BAEB78, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAEC94")
const AnimScr AnimScr_YushaSpinShieldOBJ2_LeftTypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE884, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE8A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE8CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE8F0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE914, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE938, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE95C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE980, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeA_08BAE9A4, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAECBC")
const AnimScr AnimScr_YushaSpinShieldOBJ3_LeftTypeA[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAE9C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAE9EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA34, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA58, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEA7C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEAA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEAC4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEAE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEB0C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEB30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeA_08BAEB54, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAFE60")
const AnimScr AnimScr_YushaSpinShieldOBJ_LeftTypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAECF0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAED14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAED50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAED8C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEDC8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEE04, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEE40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEE7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEEA0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEEDC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEF18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEF54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEF90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAEFCC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF008, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF044, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF080, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF0BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF0F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF134, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF170, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF1AC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF1D0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF20C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF248, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF284, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF2C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF2FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF338, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF374, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF3B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF3EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF428, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF464, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF4A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF4DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF518, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF590, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF5CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF608, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF644, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF680, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF6BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF6F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF734, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF764, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF7A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF7DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF818, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF854, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF884, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF8C0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF8FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF938, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF974, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF9B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAF9EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFA28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFA64, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFAA0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFADC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFB18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_LeftTypeB_08BAFE48, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAFF64")
const AnimScr AnimScr_YushaSpinShieldOBJ2_RightTypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFB54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFB78, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFB9C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFBC0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFBE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC2C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_RightTypeB_08BAFC74, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BAFF8C")
const AnimScr AnimScr_YushaSpinShieldOBJ3_RightTypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFC98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFCBC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFCE0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD04, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD4C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD70, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFD94, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFDB8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFDDC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFE00, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_RightTypeB_08BAFE24, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB1130")
const AnimScr AnimScr_YushaSpinShieldOBJ_RightTypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BAFFC0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BAFFE4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0020, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB005C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0098, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB00D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0110, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB014C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0170, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB01AC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB01E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0224, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0260, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB029C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB02D8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0314, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0350, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB038C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB03C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0404, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0440, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB047C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB04A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB04DC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0518, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0590, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB05CC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0608, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0644, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0680, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB06BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB06F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0734, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0770, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB07AC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB07E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0824, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0860, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB089C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB08D8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0914, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0950, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB098C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB09C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0A04, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0A34, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0A70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0AAC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0AE8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0B24, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0B54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0B90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0BCC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0C08, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0C44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0C80, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0CBC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0CF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0D34, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0DAC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB0DE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ_RightTypeB_08BB1118, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB1234")
const AnimScr AnimScr_YushaSpinShieldOBJ2_LeftTypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E6C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0E90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0EB4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0ED8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0EFC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0F20, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ2_LeftTypeB_08BB0F44, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB125C")
const AnimScr AnimScr_YushaSpinShieldOBJ3_LeftTypeB[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0F68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0F8C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0FB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0FD4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB0FF8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB101C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB1040, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB1064, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB1088, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB10AC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB10D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_YushaSpinShieldOBJ3_LeftTypeB_08BB10F4, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB1320")
const AnimScr AnimScr_EfxSunakemuriOBJ1_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_R_08BB1290, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_R_08BB12B4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_R_08BB12D8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_R_08BB12FC, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB13C4")
const AnimScr AnimScr_EfxSunakemuriOBJ1_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_08BB1334, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_08BB1358, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_08BB137C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ1_L_08BB13A0, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB1468")
const AnimScr AnimScr_EfxSunakemuriOBJ2_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_08BB13D8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_08BB13FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_08BB1420, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_R_08BB1444, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB150C")
const AnimScr AnimScr_EfxSunakemuriOBJ2_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_L_08BB147C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_L_08BB14A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_L_08BB14C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ2_L_08BB14E8, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB15B0")
const AnimScr AnimScr_EfxSunakemuriOBJ3_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_R_08BB1520, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_R_08BB1544, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_R_08BB1568, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_R_08BB158C, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB1654")
const AnimScr AnimScr_EfxSunakemuriOBJ3_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_L_08BB15C4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_L_08BB15E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_L_08BB160C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxSunakemuriOBJ3_L_08BB1630, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BB17E8")
const AnimScr AnimScr_EfxMantBatabata1_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_R_08BB1668, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_R_08BB16B0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_R_08BB1710, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_R_08BB177C, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB197C")
const AnimScr AnimScr_EfxMantBatabata1_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_L_08BB17FC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_L_08BB1844, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_L_08BB18A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata1_L_08BB1910, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB1B28")
const AnimScr AnimScr_EfxMantBatabata2_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_R_08BB1990, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_R_08BB19F0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_R_08BB1A50, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_R_08BB1ABC, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB1CD4")
const AnimScr AnimScr_EfxMantBatabata2_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_L_08BB1B3C, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_L_08BB1B9C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_L_08BB1BFC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata2_L_08BB1C68, 2),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB1E80")
const AnimScr AnimScr_EfxMantBatabata3_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata3_R_08BB1CE8, 5),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata3_R_08BB1D78, 5),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata3_R_08BB1DF0, 5),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB2028")
const AnimScr AnimScr_EfxMantBatabata3_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata3_L_08BB1E90, 5),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata3_L_08BB1F20, 5),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata3_L_08BB1F98, 5),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB2164")
const AnimScr AnimScr_EfxMantBatabata4_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata4_R_08BB2038, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata4_R_08BB20D4, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB229C")
const AnimScr AnimScr_EfxMantBatabata4_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata4_L_08BB2170, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata4_L_08BB220C, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB2500")
const AnimScr AnimScr_EfxMantBatabata5_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata5_R_08BB22A8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata5_R_08BB2368, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata5_R_08BB2434, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB2768")
const AnimScr AnimScr_EfxMantBatabata5_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata5_L_08BB2510, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata5_L_08BB25D0, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata5_L_08BB269C, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB288C")
const AnimScr AnimScr_EfxMantBatabata6_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata6_R_08BB2778, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata6_R_08BB27D8, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata6_R_08BB2838, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BB29B0")
const AnimScr AnimScr_EfxMantBatabata6_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata6_L_08BB289C, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata6_L_08BB28FC, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxMantBatabata6_L_08BB295C, 3),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD5644")
const AnimScr AnimScr_EfxChill1_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD54C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD54F4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5524, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD55E4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5584, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5614, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD55B4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD55E4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5524, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD54C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD5494, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_R_08BD54F4, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD5848")
const AnimScr AnimScr_EfxChill1_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD56C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD56F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5728, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5758, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD57E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5788, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5818, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD57B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD57E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5728, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5758, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD56C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD5698, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill1_L_08BD56F8, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD5BFC")
const AnimScr AnimScr_EfxChill2_R[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD58FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD595C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD59BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5A1C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5B3C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5A7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5B9C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5ADC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5B3C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD59BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD5A1C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD58FC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD589C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_R_08BD595C, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD5FB0")
const AnimScr AnimScr_EfxChill2_L[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5CB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5D10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5DD0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5EF0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5E30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5F50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5E90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5EF0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5D70, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5DD0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5CB0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5C50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxChill2_L_08BD5D10, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD91D8")
const AnimScr AnimScr_EfxLokmsunaObjLeft[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjLeft_08BD90D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjLeft_08BD9100, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjLeft_08BD9148, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjLeft_08BD9184, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjLeft_08BD91A8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjLeft_08BD91C0, 3),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD92FC")
const AnimScr AnimScr_EfxLokmsunaObjRight[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjRight_08BD91F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjRight_08BD9224, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjRight_08BD926C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjRight_08BD92A8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjRight_08BD92CC, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxLokmsunaObjRight_08BD92E4, 3),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA14DC")
const AnimScr FramScr_Unk5D4F90[] = {
    ANIMSCR_FORCE_SPRITE(gUnk_08BA14D0, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA43AC")
u16 * const TsaLut1_EfxMagfcastBG[] = {
    Tsa1_EfxMagfcastBG,
    Tsa2_EfxMagfcastBG,
    Tsa3_EfxMagfcastBG,
    Tsa4_EfxMagfcastBG,
    Tsa5_EfxMagfcastBG,
    Tsa6_EfxMagfcastBG,
};

SECTION(".rodata.08BA43C4")
u16 * const TsaLut2_EfxMagfcastBG[] = {
    Tsa7_EfxMagfcastBG,
    Tsa8_EfxMagfcastBG,
    Tsa9_EfxMagfcastBG,
    Tsa10_EfxMagfcastBG,
    Tsa11_EfxMagfcastBG,
    Tsa12_EfxMagfcastBG,
    Tsa13_EfxMagfcastBG,
    Tsa14_EfxMagfcastBG,
    Tsa15_EfxMagfcastBG,
    Tsa16_EfxMagfcastBG,
    Tsa17_EfxMagfcastBG,
    Tsa18_EfxMagfcastBG,
    Tsa19_EfxMagfcastBG,
    Tsa20_EfxMagfcastBG,
    Tsa21_EfxMagfcastBG,
    Tsa22_EfxMagfcastBG,
};

SECTION(".rodata.08BA465C")
u16 * const TsaLut_EfxMagdhisEffectBG[] = {
    Tsa1_EfxMagdhisEffectBG,
    Tsa2_EfxMagdhisEffectBG,
    Tsa3_EfxMagdhisEffectBG,
    Tsa4_EfxMagdhisEffectBG,
};

SECTION(".rodata.08BA46BC")
u16 * const TsaLut_EfxChillEffectBG[] = {
    Tsa1_EfxChillEffectBG,
    Tsa2_EfxChillEffectBG,
    Tsa3_EfxChillEffectBG,
};
