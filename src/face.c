#include "gbafe.h"

extern const u8 Img_Portrait_001_Chibi[], Img_Portrait_001_Face[], Img_Portrait_001_Mouth[],
    Img_Portrait_003_Chibi[], Img_Portrait_003_Face[], Img_Portrait_003_Mouth[],
    Img_Portrait_004_Chibi[], Img_Portrait_004_Face[], Img_Portrait_004_Mouth[],
    Img_Portrait_005_Chibi[], Img_Portrait_005_Face[], Img_Portrait_005_Mouth[],
    Img_Portrait_006_Chibi[], Img_Portrait_006_Face[], Img_Portrait_006_Mouth[],
    Img_Portrait_007_Chibi[], Img_Portrait_007_Face[], Img_Portrait_007_Mouth[],
    Img_Portrait_008_Chibi[], Img_Portrait_008_Face[], Img_Portrait_008_Mouth[],
    Img_Portrait_009_Chibi[], Img_Portrait_009_Face[], Img_Portrait_009_Mouth[],
    Img_Portrait_00B_Chibi[], Img_Portrait_00B_Face[], Img_Portrait_00B_Mouth[],
    Img_Portrait_00D_Chibi[], Img_Portrait_00D_Face[], Img_Portrait_00D_Mouth[],
    Img_Portrait_00E_Chibi[], Img_Portrait_00E_Face[], Img_Portrait_00E_Mouth[],
    Img_Portrait_00F_Chibi[], Img_Portrait_00F_Face[], Img_Portrait_00F_Mouth[],
    Img_Portrait_010_Chibi[], Img_Portrait_010_Face[], Img_Portrait_010_Mouth[],
    Img_Portrait_011_Chibi[], Img_Portrait_011_Face[], Img_Portrait_011_Mouth[],
    Img_Portrait_012_Chibi[], Img_Portrait_012_Face[], Img_Portrait_012_Mouth[],
    Img_Portrait_013_Chibi[], Img_Portrait_013_Face[], Img_Portrait_013_Mouth[],
    Img_Portrait_014_Chibi[], Img_Portrait_014_Face[], Img_Portrait_014_Mouth[],
    Img_Portrait_015_Chibi[], Img_Portrait_015_Face[], Img_Portrait_015_Mouth[],
    Img_Portrait_017_Chibi[], Img_Portrait_017_Face[], Img_Portrait_017_Mouth[],
    Img_Portrait_018_Chibi[], Img_Portrait_018_Face[], Img_Portrait_018_Mouth[],
    Img_Portrait_019_Chibi[], Img_Portrait_019_Face[], Img_Portrait_019_Mouth[],
    Img_Portrait_01A_Chibi[], Img_Portrait_01A_Face[], Img_Portrait_01A_Mouth[],
    Img_Portrait_01D_Chibi[], Img_Portrait_01D_Face[], Img_Portrait_01D_Mouth[],
    Img_Portrait_042_Chibi[], Img_Portrait_042_Face[], Img_Portrait_042_Mouth[],
    Img_Portrait_043_Chibi[], Img_Portrait_043_Face[], Img_Portrait_043_Mouth[],
    Img_Portrait_04B_Chibi[], Img_Portrait_04B_Face[], Img_Portrait_04B_Mouth[],
    Img_Portrait_052_Chibi[], Img_Portrait_052_Face[], Img_Portrait_052_Mouth[],
    Img_Portrait_053_Chibi[], Img_Portrait_053_Face[], Img_Portrait_053_Mouth[],
    Img_Portrait_054_Chibi[], Img_Portrait_054_Face[], Img_Portrait_054_Mouth[],
    Img_Portrait_055_Chibi[], Img_Portrait_055_Face[], Img_Portrait_055_Mouth[],
    Img_Portrait_056_Chibi[], Img_Portrait_056_Face[], Img_Portrait_056_Mouth[],
    Img_Portrait_058_Chibi[], Img_Portrait_058_Face[], Img_Portrait_058_Mouth[],
    Img_Portrait_059_Chibi[], Img_Portrait_059_Face[], Img_Portrait_059_Mouth[],
    Img_Portrait_05A_Chibi[], Img_Portrait_05A_Face[], Img_Portrait_05A_Mouth[],
    Img_Portrait_05D_Chibi[], Img_Portrait_05D_Face[], Img_Portrait_05D_Mouth[],
    Img_Portrait_05E_Chibi[], Img_Portrait_05E_Face[], Img_Portrait_05E_Mouth[],
    Img_Portrait_05F_Chibi[], Img_Portrait_05F_Face[], Img_Portrait_05F_Mouth[],
    Img_Portrait_060_Chibi[], Img_Portrait_060_Face[], Img_Portrait_060_Mouth[],
    Img_Portrait_062_Chibi[], Img_Portrait_062_Face[], Img_Portrait_062_Mouth[],
    Img_Portrait_064_Brendan_Chibi[], Img_Portrait_064_Brendan_Face[],
    Img_Portrait_064_Brendan_Mouth[], Img_Portrait_065_Lloyd_Chibi[], Img_Portrait_065_Lloyd_Face[],
    Img_Portrait_065_Lloyd_Mouth[], Img_Portrait_066_Linus_Chibi[], Img_Portrait_066_Linus_Face[],
    Img_Portrait_066_Linus_Mouth[], Img_Portrait_068_Chibi[], Img_Portrait_068_Face[],
    Img_Portrait_068_Mouth[], Img_Portrait_069_Chibi[], Img_Portrait_069_Face[],
    Img_Portrait_069_Mouth[], Img_Portrait_06A_Darin_Chibi[], Img_Portrait_06A_Darin_Face[],
    Img_Portrait_06A_Darin_Mouth[], Img_Portrait_06D_Chibi[], Img_Portrait_06D_Face[],
    Img_Portrait_06D_Mouth[], Img_Portrait_077_Uhai_Chibi[], Img_Portrait_077_Uhai_Face[],
    Img_Portrait_077_Uhai_Mouth[], Img_Portrait_081_Kenneth_Chibi[],
    Img_Portrait_081_Kenneth_Face[], Img_Portrait_081_Kenneth_Mouth[],
    Img_Portrait_082_Jerme_Chibi[], Img_Portrait_082_Jerme_Face[], Img_Portrait_082_Jerme_Mouth[],
    Img_Portrait_084_Ursula_Chibi[], Img_Portrait_084_Ursula_Face[],
    Img_Portrait_084_Ursula_Mouth[], Img_Portrait_096_Lloyd_Chibi[], Img_Portrait_096_Lloyd_Face[],
    Img_Portrait_096_Lloyd_Mouth[], Img_Portrait_097_Linus_Chibi[], Img_Portrait_097_Linus_Face[],
    Img_Portrait_097_Linus_Mouth[], Img_Portrait_098_Brendan_Chibi[],
    Img_Portrait_098_Brendan_Face[], Img_Portrait_098_Brendan_Mouth[],
    Img_Portrait_099_Uhai_Chibi[], Img_Portrait_099_Uhai_Face[], Img_Portrait_099_Uhai_Mouth[],
    Img_Portrait_09A_Ursula_Chibi[], Img_Portrait_09A_Ursula_Face[],
    Img_Portrait_09A_Ursula_Mouth[], Img_Portrait_09B_Kenneth_Chibi[],
    Img_Portrait_09B_Kenneth_Face[], Img_Portrait_09B_Kenneth_Mouth[],
    Img_Portrait_09C_Darin_Chibi[], Img_Portrait_09C_Darin_Face[], Img_Portrait_09C_Darin_Mouth[],
    Img_Portrait_09D_Jerme_Chibi[], Img_Portrait_09D_Jerme_Face[], Img_Portrait_09D_Jerme_Mouth[],
    Img_Portrait_09E_Chibi[], Img_Portrait_09E_Face[], Img_Portrait_09E_Mouth[],
    Img_Portrait_09F_Chibi[], Img_Portrait_09F_Face[], Img_Portrait_09F_Mouth[],
    Img_Portrait_0A0_Chibi[], Img_Portrait_0A0_Face[], Img_Portrait_0A0_Mouth[],
    Img_Portrait_0A1_Chibi[], Img_Portrait_0A1_Face[], Img_Portrait_0A1_Mouth[],
    Img_Portrait_0A2_Chibi[], Img_Portrait_0A2_Face[], Img_Portrait_0A2_Mouth[],
    Img_Portrait_0A3_Chibi[], Img_Portrait_0A3_Face[], Img_Portrait_0A3_Mouth[],
    Img_Portrait_0A5_Chibi[], Img_Portrait_0A5_Face[], Img_Portrait_0A5_Mouth[],
    Img_Portrait_0A9_Chibi[], Img_Portrait_0A9_Face[], Img_Portrait_0A9_Mouth[],
    Img_Portrait_0AA_Chibi[], Img_Portrait_0AA_Face[], Img_Portrait_0AA_Mouth[],
    Img_Portrait_0AC_Chibi[], Img_Portrait_0AC_Face[], Img_Portrait_0AC_Mouth[],
    Img_Portrait_0AD_Chibi[], Img_Portrait_0AD_Face[], Img_Portrait_0AD_Mouth[],
    Img_Portrait_0AE_Chibi[], Img_Portrait_0AE_Face[], Img_Portrait_0AE_Mouth[],
    Img_Portrait_0AF_Chibi[], Img_Portrait_0AF_Face[], Img_Portrait_0AF_Mouth[],
    Img_Portrait_0B0_Chibi[], Img_Portrait_0B0_Face[], Img_Portrait_0B0_Mouth[],
    Img_Portrait_0B1_Chibi[], Img_Portrait_0B1_Face[], Img_Portrait_0B1_Mouth[],
    Img_Portrait_0B2_Chibi[], Img_Portrait_0B2_Face[], Img_Portrait_0B2_Mouth[],
    Img_Portrait_0B4_Chibi[], Img_Portrait_0B4_Face[], Img_Portrait_0B4_Mouth[],
    Img_Portrait_0B6_Chibi[], Img_Portrait_0B6_Face[], Img_Portrait_0B6_Mouth[],
    Img_Portrait_0B7_Chibi[], Img_Portrait_0B7_Face[], Img_Portrait_0B7_Mouth[],
    Img_Portrait_0BA_Chibi[], Img_Portrait_0BA_Face[], Img_Portrait_0BA_Mouth[],
    Img_Portrait_0BC_Chibi[], Img_Portrait_0BC_Face[], Img_Portrait_0BC_Mouth[],
    Img_Portrait_0BD_Chibi[], Img_Portrait_0BD_Face[], Img_Portrait_0BD_Mouth[],
    Img_Portrait_Athos_Chibi[], Img_Portrait_Athos_Face[], Img_Portrait_Athos_Mouth[],
    Img_Portrait_Bartre_Chibi[], Img_Portrait_Bartre_Face[], Img_Portrait_Bartre_Mouth[],
    Img_Portrait_Batta_Chibi[], Img_Portrait_Batta_Face[], Img_Portrait_Batta_Mouth[],
    Img_Portrait_Bauker_Chibi[], Img_Portrait_Bauker_Face[], Img_Portrait_Bauker_Mouth[],
    Img_Portrait_Bernard_Chibi[], Img_Portrait_Bernard_Face[], Img_Portrait_Bernard_Mouth[],
    Img_Portrait_Boies_Chibi[], Img_Portrait_Boies_Face[], Img_Portrait_Boies_Mouth[],
    Img_Portrait_Bool_Chibi[], Img_Portrait_Bool_Face[], Img_Portrait_Bool_Mouth[],
    Img_Portrait_Bramimond_Chibi[], Img_Portrait_Bramimond_Face[], Img_Portrait_Bramimond_Mouth[],
    Img_Portrait_Bug_Chibi[], Img_Portrait_Bug_Face[], Img_Portrait_Bug_Mouth[],
    Img_Portrait_Cameron_Chibi[], Img_Portrait_Cameron_Face[], Img_Portrait_Cameron_Mouth[],
    Img_Portrait_Canas_Chibi[], Img_Portrait_Canas_Face[], Img_Portrait_Canas_Mouth[],
    Img_Portrait_Carjiga_Chibi[], Img_Portrait_Carjiga_Face[], Img_Portrait_Carjiga_Mouth[],
    Img_Portrait_Dart_Chibi[], Img_Portrait_Dart_Face[], Img_Portrait_Dart_Mouth[],
    Img_Portrait_Denning_Chibi[], Img_Portrait_Denning_Face[], Img_Portrait_Denning_Mouth[],
    Img_Portrait_Dorcas_Chibi[], Img_Portrait_Dorcas_Face[], Img_Portrait_Dorcas_Mouth[],
    Img_Portrait_Eagler_Chibi[], Img_Portrait_Eagler_Face[], Img_Portrait_Eagler_Mouth[],
    Img_Portrait_Elbert_Chibi[], Img_Portrait_Elbert_Face[], Img_Portrait_Elbert_Mouth[],
    Img_Portrait_Eleanora_Chibi[], Img_Portrait_Eleanora_Face[], Img_Portrait_Eleanora_Mouth[],
    Img_Portrait_Eliwood_Chibi[], Img_Portrait_Eliwood_Face[], Img_Portrait_Eliwood_Mouth[],
    Img_Portrait_Erik_Chibi[], Img_Portrait_Erik_Face[], Img_Portrait_Erik_Mouth[],
    Img_Portrait_Erk_Chibi[], Img_Portrait_Erk_Face[], Img_Portrait_Erk_Mouth[],
    Img_Portrait_Eubans_Chibi[], Img_Portrait_Eubans_Face[], Img_Portrait_Eubans_Mouth[],
    Img_Portrait_Fargus_Chibi[], Img_Portrait_Fargus_Face[], Img_Portrait_Fargus_Mouth[],
    Img_Portrait_Farina_Chibi[], Img_Portrait_Farina_Face[], Img_Portrait_Farina_Mouth[],
    Img_Portrait_Fiora_Chibi[], Img_Portrait_Fiora_Face[], Img_Portrait_Fiora_Mouth[],
    Img_Portrait_Florina_Chibi[], Img_Portrait_Florina_Face[], Img_Portrait_Florina_Mouth[],
    Img_Portrait_Geitz_Chibi[], Img_Portrait_Geitz_Face[], Img_Portrait_Geitz_Mouth[],
    Img_Portrait_Georg_Chibi[], Img_Portrait_Georg_Face[], Img_Portrait_Georg_Mouth[],
    Img_Portrait_Glass_Chibi[], Img_Portrait_Glass_Face[], Img_Portrait_Glass_Mouth[],
    Img_Portrait_Groznyi_Chibi[], Img_Portrait_Groznyi_Face[], Img_Portrait_Groznyi_Mouth[],
    Img_Portrait_Guy_Chibi[], Img_Portrait_Guy_Face[], Img_Portrait_Guy_Mouth[],
    Img_Portrait_Harken_Chibi[], Img_Portrait_Harken_Face[], Img_Portrait_Harken_Mouth[],
    Img_Portrait_Hawkeye_Chibi[], Img_Portrait_Hawkeye_Face[], Img_Portrait_Hawkeye_Mouth[],
    Img_Portrait_Heath_Chibi[], Img_Portrait_Heath_Face[], Img_Portrait_Heath_Mouth[],
    Img_Portrait_Hector_Chibi[], Img_Portrait_Hector_Face[], Img_Portrait_Hector_Mouth[],
    Img_Portrait_Isadora_Chibi[], Img_Portrait_Isadora_Face[], Img_Portrait_Isadora_Mouth[],
    Img_Portrait_Jaffar_Chibi[], Img_Portrait_Jaffar_Face[], Img_Portrait_Jaffar_Mouth[],
    Img_Portrait_Jasmine_Chibi[], Img_Portrait_Jasmine_Face[], Img_Portrait_Jasmine_Mouth[],
    Img_Portrait_Karel_Chibi[], Img_Portrait_Karel_Face[], Img_Portrait_Karel_Mouth[],
    Img_Portrait_Karla_Chibi[], Img_Portrait_Karla_Face[], Img_Portrait_Karla_Mouth[],
    Img_Portrait_Kent_Chibi[], Img_Portrait_Kent_Face[], Img_Portrait_Kent_Mouth[],
    Img_Portrait_Kishuna_Chibi[], Img_Portrait_Kishuna_Face[], Img_Portrait_Kishuna_Mouth[],
    Img_Portrait_Legault_Chibi[], Img_Portrait_Legault_Face[], Img_Portrait_Legault_Mouth[],
    Img_Portrait_Leila_Chibi[], Img_Portrait_Leila_Face[], Img_Portrait_Leila_Mouth[],
    Img_Portrait_Limstella_Chibi[], Img_Portrait_Limstella_Face[], Img_Portrait_Limstella_Mouth[],
    Img_Portrait_Louise_Chibi[], Img_Portrait_Louise_Face[], Img_Portrait_Louise_Mouth[],
    Img_Portrait_Lowen_Chibi[], Img_Portrait_Lowen_Face[], Img_Portrait_Lowen_Mouth[],
    Img_Portrait_Lucius_Chibi[], Img_Portrait_Lucius_Face[], Img_Portrait_Lucius_Mouth[],
    Img_Portrait_Lundgren_Chibi[], Img_Portrait_Lundgren_Face[], Img_Portrait_Lundgren_Mouth[],
    Img_Portrait_Lyn_Chibi[], Img_Portrait_Lyn_Face[], Img_Portrait_Lyn_Mouth[],
    Img_Portrait_Marcus_Chibi[], Img_Portrait_Marcus_Face[], Img_Portrait_Marcus_Mouth[],
    Img_Portrait_Matthew_Chibi[], Img_Portrait_Matthew_Face[], Img_Portrait_Matthew_Mouth[],
    Img_Portrait_Merlinus_Chibi[], Img_Portrait_Merlinus_Face[], Img_Portrait_Merlinus_Mouth[],
    Img_Portrait_Migal_Chibi[], Img_Portrait_Migal_Face[], Img_Portrait_Migal_Mouth[],
    Img_Portrait_Natalie_Chibi[], Img_Portrait_Natalie_Face[], Img_Portrait_Natalie_Mouth[],
    Img_Portrait_Nergal_Chibi[], Img_Portrait_Nergal_Face[], Img_Portrait_Nergal_Mouth[],
    Img_Portrait_Nils_Chibi[], Img_Portrait_Nils_Face[], Img_Portrait_Nils_Mouth[],
    Img_Portrait_Ninian_Chibi[], Img_Portrait_Ninian_Face[], Img_Portrait_Ninian_Mouth[],
    Img_Portrait_Nino_Chibi[], Img_Portrait_Nino_Face[], Img_Portrait_Nino_Mouth[],
    Img_Portrait_Oswin_Chibi[], Img_Portrait_Oswin_Face[], Img_Portrait_Oswin_Mouth[],
    Img_Portrait_Paul_Chibi[], Img_Portrait_Paul_Face[], Img_Portrait_Paul_Mouth[],
    Img_Portrait_Pent_Chibi[], Img_Portrait_Pent_Face[], Img_Portrait_Pent_Mouth[],
    Img_Portrait_Priscilla_Chibi[], Img_Portrait_Priscilla_Face[], Img_Portrait_Priscilla_Mouth[],
    Img_Portrait_Puzon_Chibi[], Img_Portrait_Puzon_Face[], Img_Portrait_Puzon_Mouth[],
    Img_Portrait_Rath_Chibi[], Img_Portrait_Rath_Face[], Img_Portrait_Rath_Mouth[],
    Img_Portrait_Raven_Chibi[], Img_Portrait_Raven_Face[], Img_Portrait_Raven_Mouth[],
    Img_Portrait_Rebecca_Chibi[], Img_Portrait_Rebecca_Face[], Img_Portrait_Rebecca_Mouth[],
    Img_Portrait_Renault_Chibi[], Img_Portrait_Renault_Face[], Img_Portrait_Renault_Mouth[],
    Img_Portrait_Sain_Chibi[], Img_Portrait_Sain_Face[], Img_Portrait_Sain_Mouth[],
    Img_Portrait_Santals_Chibi[], Img_Portrait_Santals_Face[], Img_Portrait_Santals_Mouth[],
    Img_Portrait_Sealen_Chibi[], Img_Portrait_Sealen_Face[], Img_Portrait_Sealen_Mouth[],
    Img_Portrait_Serra_Chibi[], Img_Portrait_Serra_Face[], Img_Portrait_Serra_Mouth[],
    Img_Portrait_Sonia_Chibi[], Img_Portrait_Sonia_Face[], Img_Portrait_Sonia_Mouth[],
    Img_Portrait_Teodor_Chibi[], Img_Portrait_Teodor_Face[], Img_Portrait_Teodor_Mouth[],
    Img_Portrait_Uther_Chibi[], Img_Portrait_Uther_Face[], Img_Portrait_Uther_Mouth[],
    Img_Portrait_Vaida_Chibi[], Img_Portrait_Vaida_Face[], Img_Portrait_Vaida_Mouth[],
    Img_Portrait_Wallace_Chibi[], Img_Portrait_Wallace_Face[], Img_Portrait_Wallace_Mouth[],
    Img_Portrait_Wil_Chibi[], Img_Portrait_Wil_Face[], Img_Portrait_Wil_Mouth[],
    Img_Portrait_Wire_Chibi[], Img_Portrait_Wire_Face[], Img_Portrait_Wire_Mouth[],
    Img_Portrait_Yogi_Chibi[], Img_Portrait_Yogi_Face[], Img_Portrait_Yogi_Mouth[],
    Img_Portrait_Zagan_Chibi[], Img_Portrait_Zagan_Face[], Img_Portrait_Zagan_Mouth[],
    Img_Portrait_Zephiel_Chibi[], Img_Portrait_Zephiel_Face[], Img_Portrait_Zephiel_Mouth[],
    Img_Portrait_Zoldam_Chibi[], Img_Portrait_Zoldam_Face[], Img_Portrait_Zoldam_Mouth[],
    Img_Portrait_Zugu_Chibi[], Img_Portrait_Zugu_Face[], Img_Portrait_Zugu_Mouth[], gUnk_08BE518C[],
    gUnk_08BE578C[], gUnk_08BE5DC0[], gUnk_08BE63C0[], gUnk_08BE69F8[], gUnk_08BE6FF8[],
    gUnk_08BE75B8[], gUnk_08BE7BB8[], gUnk_08BE81CC[], gUnk_08BE87CC[], gUnk_08BE8864[],
    gUnk_08BE8F1C[], gUnk_08BE951C[], gUnk_08BE95B4[], gUnk_08BE9DBC[], gUnk_08BEA754[],
    gUnk_08BEAD84[], gUnk_08BEB37C[], gUnk_08BEBCD8[], gUnk_08BEC264[], gUnk_08BECA70[],
    gUnk_08BED2B8[], gUnk_08BEDA0C[], gUnk_08BEE040[], gUnk_08BEE8B4[], gUnk_08BEF0D8[],
    gUnk_08BEFA04[], gUnk_08BF0300[], gUnk_08BF0AA4[], gUnk_08BF121C[], gUnk_08BF19F0[],
    gUnk_08BF2164[], gUnk_08BF2A6C[], gUnk_08BF332C[], gUnk_08BF3AC0[], gUnk_08BF4154[],
    gUnk_08BF4808[], gUnk_08BF4EE8[], gUnk_08BF5590[], gUnk_08BF5B98[], gUnk_08BF61D4[],
    gUnk_08BF67BC[], gUnk_08BF6FF8[], gUnk_08BF776C[], gUnk_08BF7F6C[], gUnk_08BF86D4[],
    gUnk_08BF8C4C[];
extern const u16 Pal_Portrait_001[], Pal_Portrait_003[], Pal_Portrait_004[], Pal_Portrait_005[],
    Pal_Portrait_006[], Pal_Portrait_007[], Pal_Portrait_008[], Pal_Portrait_009[],
    Pal_Portrait_00B[], Pal_Portrait_00D[], Pal_Portrait_00E[], Pal_Portrait_00F[],
    Pal_Portrait_010[], Pal_Portrait_011[], Pal_Portrait_012[], Pal_Portrait_013[],
    Pal_Portrait_014[], Pal_Portrait_015[], Pal_Portrait_017[], Pal_Portrait_018[],
    Pal_Portrait_019[], Pal_Portrait_01A[], Pal_Portrait_01D[], Pal_Portrait_042[],
    Pal_Portrait_043[], Pal_Portrait_04B[], Pal_Portrait_052[], Pal_Portrait_053[],
    Pal_Portrait_054[], Pal_Portrait_055[], Pal_Portrait_056[], Pal_Portrait_058[],
    Pal_Portrait_059[], Pal_Portrait_05A[], Pal_Portrait_05D[], Pal_Portrait_05E[],
    Pal_Portrait_05F[], Pal_Portrait_060[], Pal_Portrait_062[], Pal_Portrait_064_Brendan[],
    Pal_Portrait_065_Lloyd[], Pal_Portrait_066_Linus[], Pal_Portrait_068[], Pal_Portrait_069[],
    Pal_Portrait_06A_Darin[], Pal_Portrait_06D[], Pal_Portrait_077_Uhai[],
    Pal_Portrait_081_Kenneth[], Pal_Portrait_082_Jerme[], Pal_Portrait_084_Ursula[],
    Pal_Portrait_095[], Pal_Portrait_096_Lloyd[], Pal_Portrait_097_Linus[],
    Pal_Portrait_098_Brendan[], Pal_Portrait_099_Uhai[], Pal_Portrait_09A_Ursula[],
    Pal_Portrait_09B_Kenneth[], Pal_Portrait_09C_Darin[], Pal_Portrait_09D_Jerme[],
    Pal_Portrait_09E[], Pal_Portrait_09F[], Pal_Portrait_0A0[], Pal_Portrait_0A1[],
    Pal_Portrait_0A2[], Pal_Portrait_0A3[], Pal_Portrait_0A4[], Pal_Portrait_0A5[],
    Pal_Portrait_0A6[], Pal_Portrait_0A7[], Pal_Portrait_0A8[], Pal_Portrait_0A9[],
    Pal_Portrait_0AA[], Pal_Portrait_0AB[], Pal_Portrait_0AC[], Pal_Portrait_0AD[],
    Pal_Portrait_0AE[], Pal_Portrait_0AF[], Pal_Portrait_0B0[], Pal_Portrait_0B1[],
    Pal_Portrait_0B2[], Pal_Portrait_0B3[], Pal_Portrait_0B4[], Pal_Portrait_0B5[],
    Pal_Portrait_0B6[], Pal_Portrait_0B7[], Pal_Portrait_0B8[], Pal_Portrait_0B9[],
    Pal_Portrait_0BA[], Pal_Portrait_0BB[], Pal_Portrait_0BC[], Pal_Portrait_0BD[],
    Pal_Portrait_Aion[], Pal_Portrait_Athos[], Pal_Portrait_Bartre[], Pal_Portrait_Batta[],
    Pal_Portrait_Bauker[], Pal_Portrait_Bernard[], Pal_Portrait_Beyard[], Pal_Portrait_Boies[],
    Pal_Portrait_Bool[], Pal_Portrait_Bramimond[], Pal_Portrait_Bug[], Pal_Portrait_Cameron[],
    Pal_Portrait_Canas[], Pal_Portrait_Carjiga[], Pal_Portrait_Damian[], Pal_Portrait_Dart[],
    Pal_Portrait_Denning[], Pal_Portrait_Dorcas[], Pal_Portrait_Eagler[], Pal_Portrait_Elbert[],
    Pal_Portrait_Eleanora[], Pal_Portrait_Eliwood[], Pal_Portrait_Erik[], Pal_Portrait_Erk[],
    Pal_Portrait_Eubans[], Pal_Portrait_Fargus[], Pal_Portrait_Farina[], Pal_Portrait_Fiora[],
    Pal_Portrait_Florina[], Pal_Portrait_Geitz[], Pal_Portrait_Georg[], Pal_Portrait_Glass[],
    Pal_Portrait_Groznyi[], Pal_Portrait_Guy[], Pal_Portrait_Harken[], Pal_Portrait_Hawkeye[],
    Pal_Portrait_Heath[], Pal_Portrait_Hector[], Pal_Portrait_Heintz[], Pal_Portrait_Isadora[],
    Pal_Portrait_Jaffar[], Pal_Portrait_Jasmine[], Pal_Portrait_Kaim[], Pal_Portrait_Karel[],
    Pal_Portrait_Karla[], Pal_Portrait_Kent[], Pal_Portrait_Kishuna[], Pal_Portrait_Legault[],
    Pal_Portrait_Leila[], Pal_Portrait_Limstella[], Pal_Portrait_Louise[], Pal_Portrait_Lowen[],
    Pal_Portrait_Lucius[], Pal_Portrait_Lundgren[], Pal_Portrait_Lyn[], Pal_Portrait_Marcus[],
    Pal_Portrait_Matthew[], Pal_Portrait_Maxime[], Pal_Portrait_Merlinus[], Pal_Portrait_Migal[],
    Pal_Portrait_Natalie[], Pal_Portrait_Nergal[], Pal_Portrait_Nils[], Pal_Portrait_Ninian[],
    Pal_Portrait_Nino[], Pal_Portrait_Oleg[], Pal_Portrait_Oswin[], Pal_Portrait_Pascal[],
    Pal_Portrait_Paul[], Pal_Portrait_Pent[], Pal_Portrait_Priscilla[], Pal_Portrait_Puzon[],
    Pal_Portrait_Rath[], Pal_Portrait_Raven[], Pal_Portrait_Rebecca[], Pal_Portrait_Renault[],
    Pal_Portrait_Sain[], Pal_Portrait_Santals[], Pal_Portrait_Sealen[], Pal_Portrait_Serra[],
    Pal_Portrait_Sonia[], Pal_Portrait_Teodor[], Pal_Portrait_Uther[], Pal_Portrait_Vaida[],
    Pal_Portrait_Wallace[], Pal_Portrait_Wil[], Pal_Portrait_Wire[], Pal_Portrait_Yogi[],
    Pal_Portrait_Zagan[], Pal_Portrait_Zephiel[], Pal_Portrait_Zoldam[], Pal_Portrait_Zugu[],
    gUnk_08BE516C[], gUnk_08BE5DA0[], gUnk_08BE69D8[], gUnk_08BE7598[], gUnk_08BE81AC[],
    gUnk_08BE8EFC[], gUnk_08BE9D9C[], gUnk_08BEA734[], gUnk_08BEAD64[], gUnk_08BEB35C[],
    gUnk_08BEBCB8[], gUnk_08BEC244[], gUnk_08BECA50[], gUnk_08BED298[], gUnk_08BED9EC[],
    gUnk_08BEE020[], gUnk_08BEE894[], gUnk_08BEF0B8[], gUnk_08BEF9E4[], gUnk_08BF02E0[],
    gUnk_08BF0A84[], gUnk_08BF11FC[], gUnk_08BF19D0[], gUnk_08BF2144[], gUnk_08BF2A4C[],
    gUnk_08BF330C[], gUnk_08BF3AA0[], gUnk_08BF4134[], gUnk_08BF47E8[], gUnk_08BF4EC8[],
    gUnk_08BF5570[], gUnk_08BF5B78[], gUnk_08BF61B4[], gUnk_08BF679C[], gUnk_08BF6FD8[],
    gUnk_08BF774C[], gUnk_08BF7F4C[], gUnk_08BF86B4[], gUnk_08BF8C2C[];

struct FaceVramEnt CONST_DATA DefaultFaceConfig[FACE_SLOT_COUNT] = {
    [0] = { OBCHR_FACE_DEFAULT0 * CHR_SIZE, OBPAL_FACE_DEFAULT0 },
    [1] = { OBCHR_FACE_DEFAULT1 * CHR_SIZE, OBPAL_FACE_DEFAULT1 },
    [2] = { OBCHR_FACE_DEFAULT2 * CHR_SIZE, OBPAL_FACE_DEFAULT2 },
    [3] = { OBCHR_FACE_DEFAULT3 * CHR_SIZE, OBPAL_FACE_DEFAULT3 },
};

u16 CONST_DATA Sprite_Face64x80[] = {
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
};

u16 CONST_DATA Sprite_Face64x80_Flipped[] = {
    4,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
};

u16 CONST_DATA Sprite_Face96x80[] = {
    6,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16,               OAM2_CHR(0x50),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_X(-48), OAM2_CHR(0x14),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_X(+32), OAM2_CHR(0x16),
};

u16 CONST_DATA Sprite_Face96x80_Flipped[] = {
    6,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x16 + OAM0_Y(64), OAM1_SIZE_32x16 + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x16),
    OAM0_SHAPE_16x32 + OAM0_Y(48), OAM1_SIZE_16x32 + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_Face64x72[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8,                OAM2_CHR(0x50),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_X(-40), OAM2_CHR(0x15),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_X(+32), OAM2_CHR(0x16),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_X(-40), OAM2_CHR(0x55),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_X(+32), OAM2_CHR(0x56),
};

u16 CONST_DATA Sprite_Face64x72_Flipped[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_HFLIP + OAM1_X(-40), OAM2_CHR(0x16),
    OAM0_SHAPE_8x16  + OAM0_Y(48), OAM1_SIZE_8x16  + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x15),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_HFLIP + OAM1_X(-40), OAM2_CHR(0x56),
    OAM0_SHAPE_8x8   + OAM0_Y(64), OAM1_SIZE_8x8   + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x55),
};

u16 CONST_DATA Sprite_Face96x72[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_X(-32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8,                OAM2_CHR(0x50),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_X(-48), OAM2_CHR(0x14),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_X(+32), OAM2_CHR(0x16),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_X(-48), OAM2_CHR(0x54),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_X(+32), OAM2_CHR(0x56),
};

u16 CONST_DATA Sprite_Face96x72_Flipped[] = {
    8,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x00),
    OAM0_SHAPE_64x32 + OAM0_Y(32), OAM1_SIZE_64x32 + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x08),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP + OAM1_X(-32), OAM2_CHR(0x50),
    OAM0_SHAPE_32x8  + OAM0_Y(64), OAM1_SIZE_32x8  + OAM1_HFLIP,               OAM2_CHR(0x10),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x16),
    OAM0_SHAPE_16x16 + OAM0_Y(48), OAM1_SIZE_16x16 + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x14),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_HFLIP + OAM1_X(-48), OAM2_CHR(0x56),
    OAM0_SHAPE_16x8  + OAM0_Y(64), OAM1_SIZE_16x8  + OAM1_HFLIP + OAM1_X(+32), OAM2_CHR(0x54),
};

struct FaceInfo const * GetFaceInfo(int fid)
{
    return gFaceInfoTable + (fid - 1);
}

void InitFaces(void)
{
    int i;
    for (i = 0; i < FACE_SLOT_COUNT; ++i)
        EndFaceById(i);

    SetFaceConfig(NULL);
}

void SetFaceConfig(struct FaceVramEnt const * config)
{
    int i;

    if (config == NULL)
        config = DefaultFaceConfig;

    for (i = 0; i < FACE_SLOT_COUNT; ++i)
    {
        gFaceConfig[i].chr_off = config[i].chr_off;
        gFaceConfig[i].palid = config[i].palid;
    }
}

int GetFreeFaceSlot(void)
{
    int i;
    for (i = 0; i < FACE_SLOT_COUNT; ++i)
    {
        if (gFaces[i] == NULL)
            return i;
    }
    return -1;
}

void Face_OnInit(struct FaceProc * proc)
{
    Decompress(proc->info->img, gFaceConfig[proc->slot].chr_off + OBJ_VRAM0);
}

void Face_OnIdle(struct FaceProc * proc)
{
    int oam0;

    oam0 = (GetFaceDisp(proc) & FACE_DISP_BLEND) != 0 ? OAM0_BLEND : 0;
    oam0 += OAM0_Y(proc->y_disp);


    PutSpriteExt(
        proc->sprite_layer,
        OAM1_X(proc->x_disp),
        oam0,
        proc->sprite,
        proc->oam2
    );
}

struct FaceProc * StartFaceAuto(int fid, int x, int y, int disp)
{
    int slot = GetFreeFaceSlot();

    if (slot < 0)
        return NULL;

    return StartFace(slot, fid, x, y, disp);
}

struct ProcCmd CONST_DATA ProcScr_Face[] = {
    PROC_19,
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_YIELD,
    PROC_CALL(Face_OnInit),
    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),
    PROC_END,
};

struct FaceProc * StartFace(int slot, int fid, int x, int y, int disp)
{
    struct FaceProc * proc;
    const struct FaceInfo * info;

    if (gFaces[slot] != NULL)
        return NULL;

    proc = Proc_Start(ProcScr_Face, PROC_TREE_5);

    gFaces[slot] = proc;

    info = GetFaceInfo(fid);

    if (disp & FACE_DISP_BIT_13)
    {
        CpuFastFill(0, PAL_OBJ(0) + PAL_OFFSET(gFaceConfig[slot].palid), 0x20);
        EnablePalSync();
    }
    else
    {
        ApplyPalette(info->pal, gFaceConfig[slot].palid + 0x10);
    }

    proc->info = info;
    proc->slot= slot;
    proc->fid = fid;
    proc->sprite_layer = 5;

    proc->x_disp = x;
    proc->y_disp = y;

    if (disp & FACE_DISP_BIT_12)
    {
        proc->mouth_proc = NULL;
        proc->eye_proc   = NULL;
    }
    else
    {
        proc->mouth_proc = Proc_Start(ProcScr_FaceMouth, proc);
        proc->eye_proc   = Proc_Start(ProcScr_FaceEye, proc);
    }

    proc->disp = ~disp;

    SetFaceDisp(proc, disp);
    return proc;
}

void EndFace(struct FaceProc * proc)
{
    gFaces[proc->slot] = NULL;
    Proc_End(proc);
}

void EndFaceById(int slot)
{
    EndFace(gFaces[slot]);
}

u32 SetFaceDisp(struct FaceProc * proc, u32 disp)
{
    if (proc == NULL)
        return 0;

    proc->disp = disp;
    FaceRefreshSprite(proc);
    return proc->disp;
}

u32 SetFaceDispById(int slot, u32 disp)
{
    return SetFaceDisp(gFaces[slot], disp);
}

u32 GetFaceDisp(struct FaceProc * proc)
{
    return proc->disp;
}

u32 GetFaceDispById(int slot)
{
    return GetFaceDisp(gFaces[slot]);
}

void FaceRefreshSprite(struct FaceProc * proc)
{
    int oam2Layer;
    switch (proc->disp & 0x807) {
    case FACE_64x80:
        proc->sprite = Sprite_Face64x80;
        break;

    case FACE_64x80_FLIPPED:
        proc->sprite = Sprite_Face64x80_Flipped;
        break;

    case FACE_96x80:
        proc->sprite = Sprite_Face96x80;
        break;

    case FACE_96x80_FLIPPED:
        proc->sprite = Sprite_Face96x80_Flipped;
        break;

    case FACE_64x72:
        proc->sprite = Sprite_Face64x72;
        break;

    case FACE_64x72_FLIPPED:
        proc->sprite = Sprite_Face64x72_Flipped;
        break;

    case FACE_96x72:
        proc->sprite = Sprite_Face96x72;
        break;

    case FACE_96x72_FLIPPED:
        proc->sprite = Sprite_Face96x72_Flipped;
        break;
    }

    switch (proc->disp & FACE_DISP_HLAYER_MASK) {
    case FACE_DISP_HLAYER(FACE_HLAYER_0):
        oam2Layer = OAM2_LAYER(0);
        break;

    case FACE_DISP_HLAYER(FACE_HLAYER_1):
        oam2Layer = OAM2_LAYER(1);
        break;

    case FACE_DISP_HLAYER(FACE_HLAYER_3):
        oam2Layer = OAM2_LAYER(3);
        break;

    default:
        oam2Layer = OAM2_LAYER(2);
        break;
    }

    proc->oam2 = (gFaceConfig[proc->slot].chr_off / CHR_SIZE) + ((gFaceConfig[proc->slot].palid & 0xF) * 0x1000) + oam2Layer;
}

void PutFaceTm(u16 * tm, u8 const * data, int tileref, bool is_flipped)
{
    int width = *data++;
    int height = *data++;

    u8 const * it = data;

    int ix, iy;

    if (!is_flipped)
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = 0; ix < width; ++ix)
            {
                if (*it == 0xFF)
                {
                    it++;
                    continue;
                }

                tm[TM_OFFSET(ix, iy)] = *it++ + tileref;
            }
        }
    }
    else
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = width - 1; ix >= 0; --ix)
            {
                if (*it == 0xFF)
                {
                    it++;
                    continue;
                }

                tm[TM_OFFSET(ix, iy)] = *it++ + tileref + TILE_HFLIP;
            }
        }
    }
}

void UnpackFaceChibiGraphics(int fid, int chr, int pal)
{
    if (fid >= FID_FACTION_CHIBI)
    {
        RegisterDataMove(GetFactionFaceImg(fid), (void *)(((chr * CHR_SIZE + VRAM) & 0x1FFFF) + VRAM), 0x200);
        ApplyFactionFacePal(fid, pal);
    }
    else
    {
        const struct FaceInfo * info = GetFaceInfo(fid);

        Decompress(info->img_chibi, (void *)(chr * CHR_SIZE + VRAM));
        ApplyPalette(info->pal, pal);
    }
}

struct ProcCmd CONST_DATA ProcScr_BmFace[] = {
    PROC_19,
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_SLEEP(1),
    PROC_CALL(Face_OnInit),
    PROC_CALL(Face_OnIdle),
    PROC_REPEAT(Face_OnIdle),
    PROC_END,
};

u8 CONST_DATA FaceTm_Chibi[] =
{
    4, 4,
    0x00, 0x01, 0x02, 0x03,
    0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B,
    0x0C, 0x0D, 0x0E, 0x0F,

    /* pad */
    0x00, 0x00,
};

void PutFaceChibi(int fid, u16 * tm, int chr, int pal, bool is_flipped)
{
    UnpackFaceChibiGraphics(fid, chr, pal);

    chr &= 0x3FF;
    PutFaceTm(tm, FaceTm_Chibi, TILEREF(chr, pal), is_flipped);
}

void UnpackFaceChibiSprGraphics(int fid, int chr, int pal)
{
    chr += 0x800; // chr relative to obj chr base

    if (fid >= FID_FACTION_CHIBI)
    {
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 0,  (chr + 0x00) * CHR_SIZE, 4 * CHR_SIZE);
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 4,  (chr + 0x20) * CHR_SIZE, 4 * CHR_SIZE);
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 8,  (chr + 0x04) * CHR_SIZE, 4 * CHR_SIZE);
        RegisterVramMove(GetFactionFaceImg(fid) + CHR_SIZE * 12, (chr + 0x24) * CHR_SIZE, 4 * CHR_SIZE);

        ApplyFactionFacePal(fid, 0x10 + pal);
    }
    else
    {
        u8 buf[0x200];
        struct FaceInfo const * info = GetFaceInfo(fid);

        Decompress(info->img_chibi, buf);

        CpuFastCopy(buf + CHR_SIZE * 0,  (void *)VRAM + (chr + 0x00) * CHR_SIZE, 4 * CHR_SIZE);
        CpuFastCopy(buf + CHR_SIZE * 4,  (void *)VRAM + (chr + 0x20) * CHR_SIZE, 4 * CHR_SIZE);
        CpuFastCopy(buf + CHR_SIZE * 8,  (void *)VRAM + (chr + 0x04) * CHR_SIZE, 4 * CHR_SIZE);
        CpuFastCopy(buf + CHR_SIZE * 12, (void *)VRAM + (chr + 0x24) * CHR_SIZE, 4 * CHR_SIZE);

        ApplyPalette(info->pal, 0x10 + pal);
    }
}

void FaceChibiSpr_OnIdle(struct FaceProc * proc)
{
    PutSprite(5,
        proc->x_disp - gDispIo.bg_off[0].x,
        proc->y_disp - gDispIo.bg_off[0].y,
        proc->sprite, proc->oam2);
}

struct ProcCmd CONST_DATA ProcScr_FaceChibiSpr[] = {
    PROC_REPEAT(FaceChibiSpr_OnIdle),
    PROC_END,
};

u16 CONST_DATA Sprite_FaceChibi[] = 
{
    2,
    OAM0_SHAPE_32x16,               OAM1_SIZE_32x16, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_Y(+16), OAM1_SIZE_32x16, OAM2_CHR(4),
};

u16 CONST_DATA Sprite_FaceChibi_Flipped[] =
{
    2,
    OAM0_SHAPE_32x16,               OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_Y(+16), OAM1_SIZE_32x16 + OAM1_HFLIP, OAM2_CHR(4),
};

void StartFaceChibiStr(int x, int y, int fid, int chr, int pal, bool is_flipped, ProcPtr parent)
{
    struct FaceProc * proc;

    UnpackFaceChibiSprGraphics(fid, chr, pal);

    proc = Proc_Start(ProcScr_FaceChibiSpr, parent);

    proc->x_disp = x;
    proc->y_disp = y;

    proc->oam2 = chr + OAM2_PAL(pal);

    if (is_flipped)
        proc->sprite = Sprite_FaceChibi_Flipped;
    else
        proc->sprite = Sprite_FaceChibi;
}

void EndFaceChibiSpr(void)
{
    Proc_EndEach(ProcScr_FaceChibiSpr);
}

void PutFace80x72_Standard(u16 * tm, int tileref, const struct FaceInfo * info)
{
    int x = info->x_mouth - 1;
    int y = info->y_mouth;

    TmApplyTsa(tm, Tsa_Unk_08195680, (u16)tileref);

    tm[TM_OFFSET(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TM_OFFSET(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;
}

void PutFace80x72_Raised(u16 * tm, int tileref, const struct FaceInfo * info)
{
    int x = info->x_mouth - 1;
    int y = info->y_mouth - 1;

    TmApplyTsa(tm, Tsa_Unk_08195738, (u16)tileref);

    tm[TM_OFFSET(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TM_OFFSET(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TM_OFFSET(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TM_OFFSET(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TM_OFFSET(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;
}

bool ShouldFaceBeRaised(int fid)
{
    switch (fid) {
    case 0x1C:
    case 0x33:
    case 0x39:
    case 0x3E:
    case 0x3F:
    case 0x41:
        return 1;

    default:
        return 0;
    }
}

void PutFace80x72_Core(u16 * tm, int fid, int chr, int pal)
{
    const struct FaceInfo * info;

    if (fid == 0)
        return;

    info = GetFaceInfo(fid);

    ApplyPalette(info->pal, pal);

    if (info->img != NULL)
    {
        int i;

        Decompress(info->img, (void *)(chr * 0x20 + VRAM));
        ApplyPalette(info->pal, pal);

        if (ShouldFaceBeRaised(fid))
            PutFace80x72_Raised(tm, (pal << 12) + (0x3FF & chr), info);
        else
            PutFace80x72_Standard(tm, (pal << 12) + (0x3FF & chr), info);

        for (i = 0; i < 6; i++)
        {
            tm[i * 0x20 + 0] = 0;
            tm[i * 0x20 + 9] = 0;
        }
    }
    else
    {
        Decompress(info->img_card, (void*)(chr * CHR_SIZE + VRAM));
        PutAppliedBitmap(tm, (pal << 12) + (0x3FF & chr), 10, 9);
    }
}

struct ProcCmd CONST_DATA ProcScr_BgFaceEyeBlink[] = {
    PROC_CALL(BgFaceEyeBlink_Init),
PROC_LABEL(0),
    PROC_REPEAT(BgFaceEyeBlink_Delay),
    PROC_REPEAT(BgFaceEyeBlink_PutFace),
    PROC_GOTO(0),
    PROC_END,
};

void BgFaceEyeBlink_Init(struct FaceEyeProc * proc)
{
    proc->face_proc = NULL;
    proc->dealy = 120;
    proc->state = FACE_EYE_INIT;
}

void BgFaceEyeBlink_Delay(struct FaceEyeProc * proc)
{
    if (--proc->dealy >= 0)
        return;

    proc->dealy = GetFaceBlinkInterval(proc);
    proc->timer = 0;

    Proc_Break(proc);
}

void BgFaceEyeBlink_PutFace(struct FaceEyeProc * proc)
{
    const struct FaceInfo * info;
    u16 * tm1;
    u16 * tm2;
    int offset;

    int tileref = (proc->palId << 12) + (0x3FF & proc->tileId);

    info = GetFaceInfo(proc->faceId);
    offset = 0;

    switch (proc->timer) {
    case 3:
        offset = 88;
        break;

    case 0:
    case 6:
        offset = 24;
        break;

    case 9:
        PutFace80x72_Standard(proc->tm, (proc->palId << 12) + (0x3FF & proc->tileId), info);
        EnableBgSyncById(GetBgFromPtr(proc->tm));
        Proc_Break(proc);

        return;

    case 1:
    case 2:
    case 4:
    case 5:
    case 7:
    case 8:
        proc->timer++;
        return;
    }

    info = GetFaceInfo(proc->faceId);

    tm1 = ((info->y_eyes << 5) + proc->tm) + info->x_eyes;

    tm2 = tm1 - 1;

    *(tm2 + 0x00 + 0) = tileref + offset + 0x00 + 0;
    *(tm2 + 0x00 + 1) = tileref + offset + 0x00 + 1;
    *(tm2 + 0x00 + 2) = tileref + offset + 0x00 + 2;
    *(tm2 + 0x00 + 3) = tileref + offset + 0x00 + 3;

    *(tm1 + 0x20 - 1) = tileref + offset + 0x20 + 0;
    *(tm1 + 0x20 + 0) = tileref + offset + 0x20 + 1;
    *(tm1 + 0x20 + 1) = tileref + offset + 0x20 + 2;
    *(tm1 + 0x20 + 2) = tileref + offset + 0x20 + 3;

    EnableBgSyncById(GetBgFromPtr(tm2));
    proc->timer++;
}

void PutFace80x72(ProcPtr proc, u16 * tm, int fid, int chr, int pal)
{
    Proc_EndEach(ProcScr_BgFaceEyeBlink);
    PutFace80x72_Core(tm, fid, chr, pal);
    GetFaceInfo(fid);
}

void EndFacePtr(struct Proc * proc)
{
    EndFace(proc->ptr);
    return;
}

struct ProcCmd CONST_DATA ProcScr_FaceEndIn8Frames[] = {
    PROC_SLEEP(8),
    PROC_CALL(EndFacePtr),
    PROC_END,
};

void EndFaceIn8Frames(struct FaceProc * proc)
{
    struct Proc * gproc;

    gproc = Proc_Start(ProcScr_FaceEndIn8Frames, PROC_TREE_3);
    gproc->ptr = proc;
}

void StartFaceFadeIn(struct FaceProc * proc)
{
    struct FaceInfo const * info = GetFaceInfo(proc->fid);

    SetBlackPal(0x10 + gFaceConfig[proc->slot].palid);
    StartPalFade(info->pal, 0x10 + gFaceConfig[proc->slot].palid, 12, proc);
}

void StartFaceFadeOut(struct FaceProc * proc)
{
    struct FaceInfo const * info = GetFaceInfo(proc->fid);

    StartPalFadeToBlack(0x10 + gFaceConfig[proc->slot].palid, 12, proc);
    EndFaceIn8Frames(proc);
}

u8 const * GetFactionFaceImg(int fid)
{
    const u8 * img_table[] =
    {
        Img_FactionMiniCard + 0xC00,
        Img_FactionMiniCard,
        Img_FactionMiniCard + 0x200,
        Img_FactionMiniCard + 0x400,
        Img_FactionMiniCard + 0x600,
        Img_FactionMiniCard + 0x800,
        Img_FactionMiniCard + 0xA00,
    };

    fid = fid - FID_FACTION_CHIBI;

    return img_table[fid];
}

void ApplyFactionFacePal(int fid, int pal)
{
    const u16 * pal_table[] =
    {
        Pal_FactionMiniCard,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
        Pal_FactionMiniCard + 0x10,
    };

    fid = fid - FID_FACTION_CHIBI;

    ApplyPalette(pal_table[fid], pal);
}

struct ProcCmd CONST_DATA ProcScr_FaceMouth[] = {
    PROC_CALL(FaceMouth_Init),
    PROC_REPEAT(FaceMouth_Loop),
    PROC_END,
};

void FaceMouth_Init(struct FaceMouthProc * proc)
{
    proc->face_proc = proc->proc_parent;
    proc->timer = 0;
}

void FaceMouth_Loop(struct FaceMouthProc * proc)
{
    int oam1;
    int oam0;

    if (!(GetFaceDisp(proc->face_proc) & (FACE_DISP_TALK_1 | FACE_DISP_TALK_2)))
    {
        int chr = (GetFaceDisp(proc->face_proc) & FACE_DISP_SMILE) ? 0 : 24;
        chr += 16;

        Register2dChrMove(
            proc->face_proc->info->img_mouth + chr * 0x20,
            ((proc->face_proc->oam2 + 28) & 0x3FF) * 0x20 + OBJ_VRAM0,
            4,
            2
        );
    }
    else
    {
        if (--proc->timer < 0)
        {
            int chr = (GetFaceDisp(proc->face_proc) & FACE_DISP_SMILE) ? 0 : 24;

            proc->timer = ((RandNextB() >> 16) & 7) + 1;
            proc->frame = (proc->frame + 1) & 3;

            switch (proc->frame) {
            case 1:
            case 3:
                chr += 8;
                break;

            case 2:
                chr += 16;
                break;

            case 0:
            default:
                chr += 0;
                break;
            }

            Register2dChrMove(
                proc->face_proc->info->img_mouth + chr * 0x20,
                ((proc->face_proc->oam2 + 28) & 0x3FF) * 0x20 + OBJ_VRAM0,
                4,
                2
            );
        }
    }

    oam1 = 4 - proc->face_proc->info->x_mouth;
    oam1 = (GetFaceDisp(proc->face_proc) & FACE_DISP_FLIPPED) ? oam1 : -oam1;
    oam1 = OAM1_X((oam1 * 8 + proc->face_proc->x_disp) - 16);

    if (GetFaceDisp(proc->face_proc) & FACE_DISP_FLIPPED)
        oam1 = oam1 + OAM1_HFLIP;

    if (GetFaceDisp(proc->face_proc) & FACE_DISP_BLEND)
        oam0 = OAM0_BLEND;
    else
        oam0 = 0;

    oam0 += (proc->face_proc->y_disp + (proc->face_proc->info->y_mouth * 8)) & 0xFF;

    PutSpriteExt(
        proc->face_proc->sprite_layer,
        oam1,
        oam0,
        Sprite_32x16,
        proc->face_proc->oam2 + 28
    );
}

void PutFaceEyeSprite(struct FaceEyeProc * proc, int frame_idx)
{
    int oam1;
    int oam0;
    int chr = frame_idx;

    bool flip = 0;

    switch (frame_idx) {
    case FACE_EYE_FRAME_0:
        chr = 88;
        break;

    case FACE_EYE_FRAME_1:
        chr = 24;
        break;

    case FACE_EYE_FRAME_0 + 0x80:
        chr = 88;
        flip = true;
        break;

    case FACE_EYE_FRAME_1 + 0x80:
        chr = 24;
        flip = true;
        break;

    default:
        return;
    }

    oam1 = 4 - proc->face_proc->info->x_eyes;

    oam1 = (GetFaceDisp(proc->face_proc) & FACE_DISP_FLIPPED) ? oam1 : -oam1;

    oam1 = ((oam1 * 8 + proc->face_proc->x_disp) - 16) & 0x1FF;

    if (GetFaceDisp(proc->face_proc) & 1)
        oam1 = oam1 + 0x1000;

    if (GetFaceDisp(proc->face_proc) & FACE_DISP_BLEND)
        oam0 = OAM0_BLEND;
    else
        oam0 = 0;

    oam0 += (proc->face_proc->y_disp + (proc->face_proc->info->y_eyes * 8)) & 0xff;

    if (flip)
    {
        if (!(GetFaceDisp(proc->face_proc) & FACE_DISP_FLIPPED))
            oam1 = oam1 + 16;

        PutSpriteExt(
            proc->face_proc->sprite_layer,
            oam1,
            oam0,
            Sprite_16x16,
            proc->face_proc->oam2 + chr + 2
        );
    }
    else
    {
        PutSpriteExt(
            proc->face_proc->sprite_layer,
            oam1,
            oam0,
            Sprite_32x16,
            proc->face_proc->oam2 + chr
        );
    }
}

struct ProcCmd CONST_DATA ProcScr_FaceEye[] = {
PROC_LABEL(FACE_EYE_INIT),
    PROC_CALL(FaceEye_Init),
PROC_LABEL(FACE_EYE_INIT),
    PROC_REPEAT(FaceEye_Delay),
PROC_LABEL(FACE_EYE_PRE_SWITCH),
    PROC_REPEAT(FaceEye_PreSwitch),

PROC_LABEL(FACE_EYE_FRAME0_DISP),
    PROC_CALL(FaceEye_InitDisplayFrame0),
    PROC_REPEAT(FaceEye_DisplayFrame0),
    PROC_REPEAT(FaceEye_Delay),

PROC_LABEL(FACE_EYE_FRAME1_DISP),
    PROC_CALL(FaceEye_InitDisplayFrame1),
    PROC_REPEAT(FaceEye_DisplayFrame1),
    PROC_REPEAT(FaceEye_Delay),

PROC_LABEL(FACE_EYE_FRAME_FLIP_DISP),
    PROC_CALL(FaceEye_InitDisplayFrameFlip),
    PROC_REPEAT(FaceEye_DisplayFrameFlip),

PROC_LABEL(FACE_EYE_END),
    PROC_REPEAT(FaceEye_DisplayFrame0),
    PROC_END,
};

void FaceEye_Init(struct FaceEyeProc * proc)
{
    proc->face_proc = proc->proc_parent;
    proc->blink = ((struct FaceProc *)(proc->proc_parent))->info->blink_type;
    proc->dealy = GetFaceBlinkInterval(proc);
    proc->state = FACE_EYE_INIT;

    if (proc->blink == 6)
    {
        proc->blink = 5;
        proc->dealy = INT32_MAX;
        proc->state = 2;
        proc->timer = 6;

        Proc_Goto(proc, FACE_EYE_END);
    }
}

void FaceEye_Delay(struct FaceEyeProc * proc)
{
    int state;

    proc->dealy--;

    state = proc->state;

    if (state != 0)
    {
        Proc_Goto(proc, (s16)state);
        return;
    }

    if (proc->dealy < 0)
    {
        proc->dealy = GetFaceBlinkInterval(proc);
        proc->timer = 0;

        Proc_Goto(proc, FACE_EYE_PRE_SWITCH);
    }
}

void FaceEye_PreSwitch(struct FaceEyeProc * proc)
{
    int frame_idx = 2;

    switch (proc->timer) {
    case 3:
    case 4:
    case 5:
        frame_idx = 0;
        break;

    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
        frame_idx = 1;
        break;

    case 10:
        Proc_Goto(proc, FACE_EYE_INIT);
        break;
    }

    PutFaceEyeSprite(proc, frame_idx);
    proc->timer++;
}

void FaceEye_InitDisplayFrame0(struct FaceEyeProc * proc)
{
    proc->timer = 0;
}

void FaceEye_DisplayFrame0(struct FaceEyeProc * proc)
{
    if (proc->timer < 6)
    {
        FaceEye_PreSwitch(proc);
        return;
    }

    PutFaceEyeSprite(proc, 0);

    if (proc->state == FACE_EYE_INIT)
        Proc_Goto(proc, FACE_EYE_PRE_SWITCH);
}

void FaceEye_InitDisplayFrame1(struct FaceEyeProc * proc)
{
    proc->timer = 0;
}

void FaceEye_DisplayFrame1(struct FaceEyeProc * proc)
{
    if (proc->timer < 3)
    {
        FaceEye_PreSwitch(proc);
        return;
    }

    PutFaceEyeSprite(proc, 1);

    if (proc->state == FACE_EYE_INIT)
        Proc_Goto(proc, FACE_EYE_PRE_SWITCH);
}

void FaceEye_InitDisplayFrameFlip(struct FaceEyeProc * proc)
{
    proc->timer = 0;
}

void FaceEye_DisplayFrameFlip(struct FaceEyeProc * proc)
{
    int frame = 2;

    switch (proc->timer) {
    case 3:
    case 4:
    case 5:
        frame = 0;
        break;

    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
        frame = 1;
        break;

    case 10:
        Proc_Goto(proc, FACE_EYE_INIT);
        proc->state = FACE_EYE_INIT;
    }

    PutFaceEyeSprite(proc, 0x80 + frame);
    proc->timer++;
}

void SetFaceBlinkControl(struct FaceProc * proc, int blink)
{
    struct FaceEyeProc * eye_proc;

    if (blink == 0)
        blink = proc->info->blink_type;

    eye_proc = proc->eye_proc;
    eye_proc->blink = blink;
    eye_proc->dealy = GetFaceBlinkInterval(eye_proc);
}

void SetFaceBlinkControlById(int slot, int blink)
{
    SetFaceBlinkControl(gFaces[slot], blink);
}

int GetFaceBlinkInterval(struct FaceEyeProc * proc)
{
    int var = RandNextB() >> 16;

    switch (proc->blink) {
    case 3:
        return (var >> 7) + 300;

    case 1:
        return (var >> 7) + 30;

    case 2:
        return (var >> 9) + 30;

    case 4:
        return 1;

    case 5:
        return INT32_MAX;
    }

#if NONMATCHING
    // Original bug: no return for other blink kinds (0: a face info with
    // blink_type 0); r0 holds the switch value, blink - 1.
    return (s16)(proc->blink - 1);
#endif
}

void SetFaceEyeState(struct FaceProc * proc, int state)
{
    proc->eye_proc->state = state;
}

void SetFaceEyeStateById(int slot, int state)
{
    SetFaceEyeState(gFaces[slot], state);
}

void sub_08007AFC(void)
{
    struct FaceEyeProc * eye_proc;

    eye_proc = gFaces[0]->eye_proc;

    if (gpKeySt->held & A_BUTTON)
        eye_proc->state = 2;
    else
        eye_proc->state = 0;

    eye_proc = gFaces[2]->eye_proc;

    if (gpKeySt->held & B_BUTTON)
        eye_proc->state = 3;
    else
        eye_proc->state = 0;

    eye_proc = gFaces[1]->eye_proc;

    if (gpKeySt->pressed & L_BUTTON)
        eye_proc->state = 4;

    eye_proc = gFaces[3]->eye_proc;

    if (gpKeySt->pressed & R_BUTTON)
        eye_proc->state = 4;
}

// clang-format off

struct ProcCmd CONST_DATA gUnk_08B90970[] = {
    PROC_REPEAT(sub_08007AFC),
    PROC_END,
};

// clang-format on

void sub_08007B70(void)
{
    SetFaceBlinkControl(StartFaceAuto(0x16, 48, 0, FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_TALK_1), 3);
    SetFaceBlinkControl(StartFaceAuto(0x16, 48, 80, FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_FLIPPED | FACE_DISP_SMILE | FACE_DISP_TALK_1), 1);
    SetFaceBlinkControl(StartFaceAuto(0x16, 192, 0, FACE_DISP_KIND(FACE_96x80) | FACE_DISP_TALK_1), 2);
    SetFaceBlinkControl(StartFaceAuto(0x16, 192, 80, FACE_DISP_KIND(FACE_96x80) | FACE_DISP_SMILE | FACE_DISP_TALK_1), 4);

    Proc_Start(gUnk_08B90970, PROC_TREE_3);
}

struct FaceProc * StartBmFace(int slot, int fid, int x, int y, int disp)
{
    struct FaceProc * proc;
    const struct FaceInfo * info;
    s16 oam2_layer;

    if (gFaces[slot] != NULL) {
        return NULL;
    }

    proc = Proc_Start(ProcScr_BmFace, PROC_TREE_5);

    gFaces[slot] = proc;

    info = GetFaceInfo(fid);

    if (disp & FACE_DISP_BIT_13)
    {
        CpuFastFill(0, PAL_OBJ(0) + PAL_OFFSET(gFaceConfig[slot].palid), 0x20);
        EnablePalSync();
    }
    else
    {
        ApplyPalette(info->pal, gFaceConfig[slot].palid + 0x10);
    }

    proc->info = info;

    proc->slot = slot;
    proc->fid = fid;

    proc->sprite_layer = 5;

    proc->x_disp = x;
    proc->y_disp = y;

    proc->mouth_proc = NULL;
    proc->eye_proc = NULL;

    proc->disp = disp;

    FaceRefreshSprite(proc);

    switch (disp & FACE_DISP_HLAYER_MASK)
    {
    case FACE_DISP_HLAYER(FACE_HLAYER_0):
        oam2_layer = OAM2_LAYER(0);
        break;

    case FACE_DISP_HLAYER(FACE_HLAYER_1):
        oam2_layer = OAM2_LAYER(1);
        break;

    case FACE_DISP_HLAYER(FACE_HLAYER_3):
        oam2_layer = OAM2_LAYER(3);
        break;

    default:
        oam2_layer = OAM2_LAYER(2);
        break;
    }

    proc->oam2 = (gFaceConfig[slot].chr_off / CHR_SIZE) + OAM2_PAL(gFaceConfig[slot].palid) + oam2_layer;

    return proc;
}

void SetFacePosition(int slot, int x, int y)
{
    gFaces[slot]->x_disp = x;
    gFaces[slot]->y_disp = y;
}

void sub_08007D04(struct UnkFaceProc * proc)
{
    if (proc->face_proc->eye_proc != NULL)
        TryLockProc(proc->face_proc->eye_proc);

    if (proc->face_proc->mouth_proc != NULL)
        TryLockProc(proc->face_proc->mouth_proc);
}

void sub_08007D28(struct UnkFaceProc * proc)
{
    struct FaceProc * face_proc;

    proc->face_info = GetFaceInfo(proc->fid);

    Decompress(proc->face_info->img, (void *)(gFaceConfig[proc->face_proc->slot].chr_off + 0x06010000));
    ApplyPalette(proc->face_info->pal, gFaceConfig[proc->face_proc->slot].palid + 0x10);

    face_proc = proc->face_proc;
    face_proc->info = proc->face_info;
    face_proc->fid = proc->fid;

    return;
}

void sub_08007D80(struct UnkFaceProc * proc)
{
    if (proc->face_proc->eye_proc)
    {
        proc->face_proc->eye_proc->blink = proc->face_info->blink_type;
        Proc_Goto(proc->face_proc->eye_proc, 0);
        TryUnlockProc(proc->face_proc->eye_proc);
    }

    if (proc->face_proc->mouth_proc)
    {
        TryUnlockProc(proc->face_proc->mouth_proc);
    }
}

// clang-format off

struct ProcCmd CONST_DATA gUnk_08B90980[] = {
    PROC_YIELD,
    PROC_CALL(sub_08007D04),
    PROC_SLEEP(2),

    PROC_CALL(sub_08007D28),
    PROC_YIELD,

    PROC_CALL(sub_08007D80),

    PROC_END,
};

// clang-format on

void sub_08007DB8(struct FaceProc * parent, int face_id)
{
    struct UnkFaceProc * proc = Proc_Start(gUnk_08B90980, parent);
    proc->face_proc = parent;
    proc->fid = face_id;
}


SECTION(".rodata.08C965A0")
const struct FaceInfo gFaceInfoTable[] = {
    {
        .img = Img_Portrait_001_Face,
        .img_chibi = Img_Portrait_001_Chibi,
        .pal = Pal_Portrait_001,
        .img_mouth = Img_Portrait_001_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eliwood_Face,
        .img_chibi = Img_Portrait_Eliwood_Chibi,
        .pal = Pal_Portrait_Eliwood,
        .img_mouth = Img_Portrait_Eliwood_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_003_Face,
        .img_chibi = Img_Portrait_003_Chibi,
        .pal = Pal_Portrait_003,
        .img_mouth = Img_Portrait_003_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_004_Face,
        .img_chibi = Img_Portrait_004_Chibi,
        .pal = Pal_Portrait_004,
        .img_mouth = Img_Portrait_004_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_005_Face,
        .img_chibi = Img_Portrait_005_Chibi,
        .pal = Pal_Portrait_005,
        .img_mouth = Img_Portrait_005_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_006_Face,
        .img_chibi = Img_Portrait_006_Chibi,
        .pal = Pal_Portrait_006,
        .img_mouth = Img_Portrait_006_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_007_Face,
        .img_chibi = Img_Portrait_007_Chibi,
        .pal = Pal_Portrait_007,
        .img_mouth = Img_Portrait_007_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_008_Face,
        .img_chibi = Img_Portrait_008_Chibi,
        .pal = Pal_Portrait_008,
        .img_mouth = Img_Portrait_008_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_009_Face,
        .img_chibi = Img_Portrait_009_Chibi,
        .pal = Pal_Portrait_009,
        .img_mouth = Img_Portrait_009_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eliwood_Face,
        .img_chibi = Img_Portrait_Eliwood_Chibi,
        .pal = Pal_Portrait_Eliwood,
        .img_mouth = Img_Portrait_Eliwood_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 6,
    },
    {
        .img = Img_Portrait_00B_Face,
        .img_chibi = Img_Portrait_00B_Chibi,
        .pal = Pal_Portrait_00B,
        .img_mouth = Img_Portrait_00B_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Hector_Face,
        .img_chibi = Img_Portrait_Hector_Chibi,
        .pal = Pal_Portrait_Hector,
        .img_mouth = Img_Portrait_Hector_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_00D_Face,
        .img_chibi = Img_Portrait_00D_Chibi,
        .pal = Pal_Portrait_00D,
        .img_mouth = Img_Portrait_00D_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_00E_Face,
        .img_chibi = Img_Portrait_00E_Chibi,
        .pal = Pal_Portrait_00E,
        .img_mouth = Img_Portrait_00E_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_00F_Face,
        .img_chibi = Img_Portrait_00F_Chibi,
        .pal = Pal_Portrait_00F,
        .img_mouth = Img_Portrait_00F_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_010_Face,
        .img_chibi = Img_Portrait_010_Chibi,
        .pal = Pal_Portrait_010,
        .img_mouth = Img_Portrait_010_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_011_Face,
        .img_chibi = Img_Portrait_011_Chibi,
        .pal = Pal_Portrait_011,
        .img_mouth = Img_Portrait_011_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_012_Face,
        .img_chibi = Img_Portrait_012_Chibi,
        .pal = Pal_Portrait_012,
        .img_mouth = Img_Portrait_012_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_013_Face,
        .img_chibi = Img_Portrait_013_Chibi,
        .pal = Pal_Portrait_013,
        .img_mouth = Img_Portrait_013_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_014_Face,
        .img_chibi = Img_Portrait_014_Chibi,
        .pal = Pal_Portrait_014,
        .img_mouth = Img_Portrait_014_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_015_Face,
        .img_chibi = Img_Portrait_015_Chibi,
        .pal = Pal_Portrait_015,
        .img_mouth = Img_Portrait_015_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Lyn_Face,
        .img_chibi = Img_Portrait_Lyn_Chibi,
        .pal = Pal_Portrait_Lyn,
        .img_mouth = Img_Portrait_Lyn_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_017_Face,
        .img_chibi = Img_Portrait_017_Chibi,
        .pal = Pal_Portrait_017,
        .img_mouth = Img_Portrait_017_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_018_Face,
        .img_chibi = Img_Portrait_018_Chibi,
        .pal = Pal_Portrait_018,
        .img_mouth = Img_Portrait_018_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_019_Face,
        .img_chibi = Img_Portrait_019_Chibi,
        .pal = Pal_Portrait_019,
        .img_mouth = Img_Portrait_019_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_01A_Face,
        .img_chibi = Img_Portrait_01A_Chibi,
        .pal = Pal_Portrait_01A,
        .img_mouth = Img_Portrait_01A_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Athos_Face,
        .img_chibi = Img_Portrait_Athos_Chibi,
        .pal = Pal_Portrait_Athos,
        .img_mouth = Img_Portrait_Athos_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Ninian_Face,
        .img_chibi = Img_Portrait_Ninian_Chibi,
        .pal = Pal_Portrait_Ninian,
        .img_mouth = Img_Portrait_Ninian_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 4,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_01D_Face,
        .img_chibi = Img_Portrait_01D_Chibi,
        .pal = Pal_Portrait_01D,
        .img_mouth = Img_Portrait_01D_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 4,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Ninian_Face,
        .img_chibi = Img_Portrait_Ninian_Chibi,
        .pal = Pal_Portrait_Ninian,
        .img_mouth = Img_Portrait_Ninian_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 4,
        .y_eyes = 4,
        .blink_type = 6,
    },
    {
        .img = Img_Portrait_Hawkeye_Face,
        .img_chibi = Img_Portrait_Hawkeye_Chibi,
        .pal = Pal_Portrait_Hawkeye,
        .img_mouth = Img_Portrait_Hawkeye_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Matthew_Face,
        .img_chibi = Img_Portrait_Matthew_Chibi,
        .pal = Pal_Portrait_Matthew,
        .img_mouth = Img_Portrait_Matthew_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Jaffar_Face,
        .img_chibi = Img_Portrait_Jaffar_Chibi,
        .pal = Pal_Portrait_Jaffar,
        .img_mouth = Img_Portrait_Jaffar_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Jaffar_Face,
        .img_chibi = Img_Portrait_Jaffar_Chibi,
        .pal = Pal_Portrait_Jaffar,
        .img_mouth = Img_Portrait_Jaffar_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 6,
    },
    {
        .img = Img_Portrait_Raven_Face,
        .img_chibi = Img_Portrait_Raven_Chibi,
        .pal = Pal_Portrait_Raven,
        .img_mouth = Img_Portrait_Raven_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Geitz_Face,
        .img_chibi = Img_Portrait_Geitz_Chibi,
        .pal = Pal_Portrait_Geitz,
        .img_mouth = Img_Portrait_Geitz_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Legault_Face,
        .img_chibi = Img_Portrait_Legault_Chibi,
        .pal = Pal_Portrait_Legault,
        .img_mouth = Img_Portrait_Legault_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Karel_Face,
        .img_chibi = Img_Portrait_Karel_Chibi,
        .pal = Pal_Portrait_Karel,
        .img_mouth = Img_Portrait_Karel_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Dorcas_Face,
        .img_chibi = Img_Portrait_Dorcas_Chibi,
        .pal = Pal_Portrait_Dorcas,
        .img_mouth = Img_Portrait_Dorcas_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bartre_Face,
        .img_chibi = Img_Portrait_Bartre_Chibi,
        .pal = Pal_Portrait_Bartre,
        .img_mouth = Img_Portrait_Bartre_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Oswin_Face,
        .img_chibi = Img_Portrait_Oswin_Chibi,
        .pal = Pal_Portrait_Oswin,
        .img_mouth = Img_Portrait_Oswin_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Dart_Face,
        .img_chibi = Img_Portrait_Dart_Chibi,
        .pal = Pal_Portrait_Dart,
        .img_mouth = Img_Portrait_Dart_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Wil_Face,
        .img_chibi = Img_Portrait_Wil_Chibi,
        .pal = Pal_Portrait_Wil,
        .img_mouth = Img_Portrait_Wil_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Guy_Face,
        .img_chibi = Img_Portrait_Guy_Chibi,
        .pal = Pal_Portrait_Guy,
        .img_mouth = Img_Portrait_Guy_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Karla_Face,
        .img_chibi = Img_Portrait_Karla_Chibi,
        .pal = Pal_Portrait_Karla,
        .img_mouth = Img_Portrait_Karla_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Rath_Face,
        .img_chibi = Img_Portrait_Rath_Chibi,
        .pal = Pal_Portrait_Rath,
        .img_mouth = Img_Portrait_Rath_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Kent_Face,
        .img_chibi = Img_Portrait_Kent_Chibi,
        .pal = Pal_Portrait_Kent,
        .img_mouth = Img_Portrait_Kent_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Sain_Face,
        .img_chibi = Img_Portrait_Sain_Chibi,
        .pal = Pal_Portrait_Sain,
        .img_mouth = Img_Portrait_Sain_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Lowen_Face,
        .img_chibi = Img_Portrait_Lowen_Chibi,
        .pal = Pal_Portrait_Lowen,
        .img_mouth = Img_Portrait_Lowen_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Marcus_Face,
        .img_chibi = Img_Portrait_Marcus_Chibi,
        .pal = Pal_Portrait_Marcus,
        .img_mouth = Img_Portrait_Marcus_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Florina_Face,
        .img_chibi = Img_Portrait_Florina_Chibi,
        .pal = Pal_Portrait_Florina,
        .img_mouth = Img_Portrait_Florina_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Florina_Face,
        .img_chibi = Img_Portrait_Florina_Chibi,
        .pal = Pal_Portrait_Florina,
        .img_mouth = Img_Portrait_Florina_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 6,
    },
    {
        .img = Img_Portrait_Fiora_Face,
        .img_chibi = Img_Portrait_Fiora_Chibi,
        .pal = Pal_Portrait_Fiora,
        .img_mouth = Img_Portrait_Fiora_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Heath_Face,
        .img_chibi = Img_Portrait_Heath_Chibi,
        .pal = Pal_Portrait_Heath,
        .img_mouth = Img_Portrait_Heath_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Vaida_Face,
        .img_chibi = Img_Portrait_Vaida_Chibi,
        .pal = Pal_Portrait_Vaida,
        .img_mouth = Img_Portrait_Vaida_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Erk_Face,
        .img_chibi = Img_Portrait_Erk_Chibi,
        .pal = Pal_Portrait_Erk,
        .img_mouth = Img_Portrait_Erk_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Nino_Face,
        .img_chibi = Img_Portrait_Nino_Chibi,
        .pal = Pal_Portrait_Nino,
        .img_mouth = Img_Portrait_Nino_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Pent_Face,
        .img_chibi = Img_Portrait_Pent_Chibi,
        .pal = Pal_Portrait_Pent,
        .img_mouth = Img_Portrait_Pent_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 4,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Louise_Face,
        .img_chibi = Img_Portrait_Louise_Chibi,
        .pal = Pal_Portrait_Louise,
        .img_mouth = Img_Portrait_Louise_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Canas_Face,
        .img_chibi = Img_Portrait_Canas_Chibi,
        .pal = Pal_Portrait_Canas,
        .img_mouth = Img_Portrait_Canas_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Lucius_Face,
        .img_chibi = Img_Portrait_Lucius_Chibi,
        .pal = Pal_Portrait_Lucius,
        .img_mouth = Img_Portrait_Lucius_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Serra_Face,
        .img_chibi = Img_Portrait_Serra_Chibi,
        .pal = Pal_Portrait_Serra,
        .img_mouth = Img_Portrait_Serra_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Priscilla_Face,
        .img_chibi = Img_Portrait_Priscilla_Chibi,
        .pal = Pal_Portrait_Priscilla,
        .img_mouth = Img_Portrait_Priscilla_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Farina_Face,
        .img_chibi = Img_Portrait_Farina_Chibi,
        .pal = Pal_Portrait_Farina,
        .img_mouth = Img_Portrait_Farina_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Nils_Face,
        .img_chibi = Img_Portrait_Nils_Chibi,
        .pal = Pal_Portrait_Nils,
        .img_mouth = Img_Portrait_Nils_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_042_Face,
        .img_chibi = Img_Portrait_042_Chibi,
        .pal = Pal_Portrait_042,
        .img_mouth = Img_Portrait_042_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_043_Face,
        .img_chibi = Img_Portrait_043_Chibi,
        .pal = Pal_Portrait_043,
        .img_mouth = Img_Portrait_043_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Nils_Face,
        .img_chibi = Img_Portrait_Nils_Chibi,
        .pal = Pal_Portrait_Nils,
        .img_mouth = Img_Portrait_Nils_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 6,
    },
    {
        .img = Img_Portrait_Renault_Face,
        .img_chibi = Img_Portrait_Renault_Chibi,
        .pal = Pal_Portrait_Renault,
        .img_mouth = Img_Portrait_Renault_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Isadora_Face,
        .img_chibi = Img_Portrait_Isadora_Chibi,
        .pal = Pal_Portrait_Isadora,
        .img_mouth = Img_Portrait_Isadora_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Harken_Face,
        .img_chibi = Img_Portrait_Harken_Chibi,
        .pal = Pal_Portrait_Harken,
        .img_mouth = Img_Portrait_Harken_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Rebecca_Face,
        .img_chibi = Img_Portrait_Rebecca_Chibi,
        .pal = Pal_Portrait_Rebecca,
        .img_mouth = Img_Portrait_Rebecca_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Wallace_Face,
        .img_chibi = Img_Portrait_Wallace_Chibi,
        .pal = Pal_Portrait_Wallace,
        .img_mouth = Img_Portrait_Wallace_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Merlinus_Face,
        .img_chibi = Img_Portrait_Merlinus_Chibi,
        .pal = Pal_Portrait_Merlinus,
        .img_mouth = Img_Portrait_Merlinus_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_04B_Face,
        .img_chibi = Img_Portrait_04B_Chibi,
        .pal = Pal_Portrait_04B,
        .img_mouth = Img_Portrait_04B_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eleanora_Face,
        .img_chibi = Img_Portrait_Eleanora_Chibi,
        .pal = Pal_Portrait_Eleanora,
        .img_mouth = Img_Portrait_Eleanora_Mouth,
        .x_mouth = 1,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eleanora_Face,
        .img_chibi = Img_Portrait_Eleanora_Chibi,
        .pal = Pal_Portrait_Eleanora,
        .img_mouth = Img_Portrait_Eleanora_Mouth,
        .x_mouth = 1,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 6,
    },
    {
        .img = Img_Portrait_Uther_Face,
        .img_chibi = Img_Portrait_Uther_Chibi,
        .pal = Pal_Portrait_Uther,
        .img_mouth = Img_Portrait_Uther_Mouth,
        .x_mouth = 3,
        .y_mouth = 4,
        .x_eyes = 4,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Elbert_Face,
        .img_chibi = Img_Portrait_Elbert_Chibi,
        .pal = Pal_Portrait_Elbert,
        .img_mouth = Img_Portrait_Elbert_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Fargus_Face,
        .img_chibi = Img_Portrait_Fargus_Chibi,
        .pal = Pal_Portrait_Fargus,
        .img_mouth = Img_Portrait_Fargus_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Zephiel_Face,
        .img_chibi = Img_Portrait_Zephiel_Chibi,
        .pal = Pal_Portrait_Zephiel,
        .img_mouth = Img_Portrait_Zephiel_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_052_Face,
        .img_chibi = Img_Portrait_052_Chibi,
        .pal = Pal_Portrait_052,
        .img_mouth = Img_Portrait_052_Mouth,
        .x_mouth = 2,
        .y_mouth = 8,
        .x_eyes = 3,
        .y_eyes = 6,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_053_Face,
        .img_chibi = Img_Portrait_053_Chibi,
        .pal = Pal_Portrait_053,
        .img_mouth = Img_Portrait_053_Mouth,
        .x_mouth = 3,
        .y_mouth = 4,
        .x_eyes = 4,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_054_Face,
        .img_chibi = Img_Portrait_054_Chibi,
        .pal = Pal_Portrait_054,
        .img_mouth = Img_Portrait_054_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_055_Face,
        .img_chibi = Img_Portrait_055_Chibi,
        .pal = Pal_Portrait_055,
        .img_mouth = Img_Portrait_055_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_056_Face,
        .img_chibi = Img_Portrait_056_Chibi,
        .pal = Pal_Portrait_056,
        .img_mouth = Img_Portrait_056_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Leila_Face,
        .img_chibi = Img_Portrait_Leila_Chibi,
        .pal = Pal_Portrait_Leila,
        .img_mouth = Img_Portrait_Leila_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_058_Face,
        .img_chibi = Img_Portrait_058_Chibi,
        .pal = Pal_Portrait_058,
        .img_mouth = Img_Portrait_058_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_059_Face,
        .img_chibi = Img_Portrait_059_Chibi,
        .pal = Pal_Portrait_059,
        .img_mouth = Img_Portrait_059_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_05A_Face,
        .img_chibi = Img_Portrait_05A_Chibi,
        .pal = Pal_Portrait_05A,
        .img_mouth = Img_Portrait_05A_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Natalie_Face,
        .img_chibi = Img_Portrait_Natalie_Chibi,
        .pal = Pal_Portrait_Natalie,
        .img_mouth = Img_Portrait_Natalie_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bramimond_Face,
        .img_chibi = Img_Portrait_Bramimond_Chibi,
        .pal = Pal_Portrait_Bramimond,
        .img_mouth = Img_Portrait_Bramimond_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_05D_Face,
        .img_chibi = Img_Portrait_05D_Chibi,
        .pal = Pal_Portrait_05D,
        .img_mouth = Img_Portrait_05D_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_05E_Face,
        .img_chibi = Img_Portrait_05E_Chibi,
        .pal = Pal_Portrait_05E,
        .img_mouth = Img_Portrait_05E_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_05F_Face,
        .img_chibi = Img_Portrait_05F_Chibi,
        .pal = Pal_Portrait_05F,
        .img_mouth = Img_Portrait_05F_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_060_Face,
        .img_chibi = Img_Portrait_060_Chibi,
        .pal = Pal_Portrait_060,
        .img_mouth = Img_Portrait_060_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Nergal_Face,
        .img_chibi = Img_Portrait_Nergal_Chibi,
        .pal = Pal_Portrait_Nergal,
        .img_mouth = Img_Portrait_Nergal_Mouth,
        .x_mouth = 3,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_062_Face,
        .img_chibi = Img_Portrait_062_Chibi,
        .pal = Pal_Portrait_062,
        .img_mouth = Img_Portrait_062_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Sonia_Face,
        .img_chibi = Img_Portrait_Sonia_Chibi,
        .pal = Pal_Portrait_Sonia,
        .img_mouth = Img_Portrait_Sonia_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 4,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_064_Brendan_Face,
        .img_chibi = Img_Portrait_064_Brendan_Chibi,
        .pal = Pal_Portrait_064_Brendan,
        .img_mouth = Img_Portrait_064_Brendan_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_065_Lloyd_Face,
        .img_chibi = Img_Portrait_065_Lloyd_Chibi,
        .pal = Pal_Portrait_065_Lloyd,
        .img_mouth = Img_Portrait_065_Lloyd_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_066_Linus_Face,
        .img_chibi = Img_Portrait_066_Linus_Chibi,
        .pal = Pal_Portrait_066_Linus,
        .img_mouth = Img_Portrait_066_Linus_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Limstella_Face,
        .img_chibi = Img_Portrait_Limstella_Chibi,
        .pal = Pal_Portrait_Limstella,
        .img_mouth = Img_Portrait_Limstella_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_068_Face,
        .img_chibi = Img_Portrait_068_Chibi,
        .pal = Pal_Portrait_068,
        .img_mouth = Img_Portrait_068_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_069_Face,
        .img_chibi = Img_Portrait_069_Chibi,
        .pal = Pal_Portrait_069,
        .img_mouth = Img_Portrait_069_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_06A_Darin_Face,
        .img_chibi = Img_Portrait_06A_Darin_Chibi,
        .pal = Pal_Portrait_06A_Darin,
        .img_mouth = Img_Portrait_06A_Darin_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Erik_Face,
        .img_chibi = Img_Portrait_Erik_Chibi,
        .pal = Pal_Portrait_Erik,
        .img_mouth = Img_Portrait_Erik_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Santals_Face,
        .img_chibi = Img_Portrait_Santals_Chibi,
        .pal = Pal_Portrait_Santals,
        .img_mouth = Img_Portrait_Santals_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_06D_Face,
        .img_chibi = Img_Portrait_06D_Chibi,
        .pal = Pal_Portrait_06D,
        .img_mouth = Img_Portrait_06D_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Groznyi_Face,
        .img_chibi = Img_Portrait_Groznyi_Chibi,
        .pal = Pal_Portrait_Groznyi,
        .img_mouth = Img_Portrait_Groznyi_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Wire_Face,
        .img_chibi = Img_Portrait_Wire_Chibi,
        .pal = Pal_Portrait_Wire,
        .img_mouth = Img_Portrait_Wire_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Zagan_Face,
        .img_chibi = Img_Portrait_Zagan_Chibi,
        .pal = Pal_Portrait_Zagan,
        .img_mouth = Img_Portrait_Zagan_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Boies_Face,
        .img_chibi = Img_Portrait_Boies_Chibi,
        .pal = Pal_Portrait_Boies,
        .img_mouth = Img_Portrait_Boies_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Sealen_Face,
        .img_chibi = Img_Portrait_Sealen_Chibi,
        .pal = Pal_Portrait_Sealen,
        .img_mouth = Img_Portrait_Sealen_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bauker_Face,
        .img_chibi = Img_Portrait_Bauker_Chibi,
        .pal = Pal_Portrait_Bauker,
        .img_mouth = Img_Portrait_Bauker_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bernard_Face,
        .img_chibi = Img_Portrait_Bernard_Chibi,
        .pal = Pal_Portrait_Bernard,
        .img_mouth = Img_Portrait_Bernard_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Wire_Face,
        .img_chibi = Img_Portrait_Wire_Chibi,
        .pal = Pal_Portrait_Damian,
        .img_mouth = Img_Portrait_Wire_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Zoldam_Face,
        .img_chibi = Img_Portrait_Zoldam_Chibi,
        .pal = Pal_Portrait_Zoldam,
        .img_mouth = Img_Portrait_Zoldam_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_077_Uhai_Face,
        .img_chibi = Img_Portrait_077_Uhai_Chibi,
        .pal = Pal_Portrait_077_Uhai,
        .img_mouth = Img_Portrait_077_Uhai_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_06D_Face,
        .img_chibi = Img_Portrait_06D_Chibi,
        .pal = Pal_Portrait_Aion,
        .img_mouth = Img_Portrait_06D_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Georg_Face,
        .img_chibi = Img_Portrait_Georg_Chibi,
        .pal = Pal_Portrait_Georg,
        .img_mouth = Img_Portrait_Georg_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Cameron_Face,
        .img_chibi = Img_Portrait_Cameron_Chibi,
        .pal = Pal_Portrait_Cameron,
        .img_mouth = Img_Portrait_Cameron_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Sealen_Face,
        .img_chibi = Img_Portrait_Sealen_Chibi,
        .pal = Pal_Portrait_Oleg,
        .img_mouth = Img_Portrait_Sealen_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eubans_Face,
        .img_chibi = Img_Portrait_Eubans_Chibi,
        .pal = Pal_Portrait_Eubans,
        .img_mouth = Img_Portrait_Eubans_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Kishuna_Face,
        .img_chibi = Img_Portrait_Kishuna_Chibi,
        .pal = Pal_Portrait_Kishuna,
        .img_mouth = Img_Portrait_Kishuna_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Paul_Face,
        .img_chibi = Img_Portrait_Paul_Chibi,
        .pal = Pal_Portrait_Paul,
        .img_mouth = Img_Portrait_Paul_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Jasmine_Face,
        .img_chibi = Img_Portrait_Jasmine_Chibi,
        .pal = Pal_Portrait_Jasmine,
        .img_mouth = Img_Portrait_Jasmine_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bauker_Face,
        .img_chibi = Img_Portrait_Bauker_Chibi,
        .pal = Pal_Portrait_Pascal,
        .img_mouth = Img_Portrait_Bauker_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_081_Kenneth_Face,
        .img_chibi = Img_Portrait_081_Kenneth_Chibi,
        .pal = Pal_Portrait_081_Kenneth,
        .img_mouth = Img_Portrait_081_Kenneth_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_082_Jerme_Face,
        .img_chibi = Img_Portrait_082_Jerme_Chibi,
        .pal = Pal_Portrait_082_Jerme,
        .img_mouth = Img_Portrait_082_Jerme_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Cameron_Face,
        .img_chibi = Img_Portrait_Cameron_Chibi,
        .pal = Pal_Portrait_Maxime,
        .img_mouth = Img_Portrait_Cameron_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_084_Ursula_Face,
        .img_chibi = Img_Portrait_084_Ursula_Chibi,
        .pal = Pal_Portrait_084_Ursula,
        .img_mouth = Img_Portrait_084_Ursula_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Teodor_Face,
        .img_chibi = Img_Portrait_Teodor_Chibi,
        .pal = Pal_Portrait_Teodor,
        .img_mouth = Img_Portrait_Teodor_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Denning_Face,
        .img_chibi = Img_Portrait_Denning_Chibi,
        .pal = Pal_Portrait_Denning,
        .img_mouth = Img_Portrait_Denning_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Georg_Face,
        .img_chibi = Img_Portrait_Georg_Chibi,
        .pal = Pal_Portrait_Kaim,
        .img_mouth = Img_Portrait_Georg_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Batta_Face,
        .img_chibi = Img_Portrait_Batta_Chibi,
        .pal = Pal_Portrait_Batta,
        .img_mouth = Img_Portrait_Batta_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Zugu_Face,
        .img_chibi = Img_Portrait_Zugu_Chibi,
        .pal = Pal_Portrait_Zugu,
        .img_mouth = Img_Portrait_Zugu_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Glass_Face,
        .img_chibi = Img_Portrait_Glass_Chibi,
        .pal = Pal_Portrait_Glass,
        .img_mouth = Img_Portrait_Glass_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Migal_Face,
        .img_chibi = Img_Portrait_Migal_Chibi,
        .pal = Pal_Portrait_Migal,
        .img_mouth = Img_Portrait_Migal_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Carjiga_Face,
        .img_chibi = Img_Portrait_Carjiga_Chibi,
        .pal = Pal_Portrait_Carjiga,
        .img_mouth = Img_Portrait_Carjiga_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bug_Face,
        .img_chibi = Img_Portrait_Bug_Chibi,
        .pal = Pal_Portrait_Bug,
        .img_mouth = Img_Portrait_Bug_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Puzon_Face,
        .img_chibi = Img_Portrait_Puzon_Chibi,
        .pal = Pal_Portrait_Puzon,
        .img_mouth = Img_Portrait_Puzon_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Bool_Face,
        .img_chibi = Img_Portrait_Bool_Chibi,
        .pal = Pal_Portrait_Bool,
        .img_mouth = Img_Portrait_Bool_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Zoldam_Face,
        .img_chibi = Img_Portrait_Zoldam_Chibi,
        .pal = Pal_Portrait_Heintz,
        .img_mouth = Img_Portrait_Zoldam_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eubans_Face,
        .img_chibi = Img_Portrait_Eubans_Chibi,
        .pal = Pal_Portrait_Beyard,
        .img_mouth = Img_Portrait_Eubans_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Yogi_Face,
        .img_chibi = Img_Portrait_Yogi_Chibi,
        .pal = Pal_Portrait_Yogi,
        .img_mouth = Img_Portrait_Yogi_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Eagler_Face,
        .img_chibi = Img_Portrait_Eagler_Chibi,
        .pal = Pal_Portrait_Eagler,
        .img_mouth = Img_Portrait_Eagler_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Lundgren_Face,
        .img_chibi = Img_Portrait_Lundgren_Chibi,
        .pal = Pal_Portrait_Lundgren,
        .img_mouth = Img_Portrait_Lundgren_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Glass_Face,
        .img_chibi = Img_Portrait_Glass_Chibi,
        .pal = Pal_Portrait_095,
        .img_mouth = Img_Portrait_Glass_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_096_Lloyd_Face,
        .img_chibi = Img_Portrait_096_Lloyd_Chibi,
        .pal = Pal_Portrait_096_Lloyd,
        .img_mouth = Img_Portrait_096_Lloyd_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_097_Linus_Face,
        .img_chibi = Img_Portrait_097_Linus_Chibi,
        .pal = Pal_Portrait_097_Linus,
        .img_mouth = Img_Portrait_097_Linus_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_098_Brendan_Face,
        .img_chibi = Img_Portrait_098_Brendan_Chibi,
        .pal = Pal_Portrait_098_Brendan,
        .img_mouth = Img_Portrait_098_Brendan_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 2,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_099_Uhai_Face,
        .img_chibi = Img_Portrait_099_Uhai_Chibi,
        .pal = Pal_Portrait_099_Uhai,
        .img_mouth = Img_Portrait_099_Uhai_Mouth,
        .x_mouth = 2,
        .y_mouth = 4,
        .x_eyes = 3,
        .y_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_09A_Ursula_Face,
        .img_chibi = Img_Portrait_09A_Ursula_Chibi,
        .pal = Pal_Portrait_09A_Ursula,
        .img_mouth = Img_Portrait_09A_Ursula_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_09B_Kenneth_Face,
        .img_chibi = Img_Portrait_09B_Kenneth_Chibi,
        .pal = Pal_Portrait_09B_Kenneth,
        .img_mouth = Img_Portrait_09B_Kenneth_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_09C_Darin_Face,
        .img_chibi = Img_Portrait_09C_Darin_Chibi,
        .pal = Pal_Portrait_09C_Darin,
        .img_mouth = Img_Portrait_09C_Darin_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_09D_Jerme_Face,
        .img_chibi = Img_Portrait_09D_Jerme_Chibi,
        .pal = Pal_Portrait_09D_Jerme,
        .img_mouth = Img_Portrait_09D_Jerme_Mouth,
        .x_mouth = 3,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_09E_Face,
        .img_chibi = Img_Portrait_09E_Chibi,
        .pal = Pal_Portrait_09E,
        .img_mouth = Img_Portrait_09E_Mouth,
        .x_mouth = 2,
        .y_mouth = 8,
        .x_eyes = 3,
        .y_eyes = 6,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_09F_Face,
        .img_chibi = Img_Portrait_09F_Chibi,
        .pal = Pal_Portrait_09F,
        .img_mouth = Img_Portrait_09F_Mouth,
        .x_mouth = 2,
        .y_mouth = 8,
        .x_eyes = 3,
        .y_eyes = 6,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A0_Face,
        .img_chibi = Img_Portrait_0A0_Chibi,
        .pal = Pal_Portrait_0A0,
        .img_mouth = Img_Portrait_0A0_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A1_Face,
        .img_chibi = Img_Portrait_0A1_Chibi,
        .pal = Pal_Portrait_0A1,
        .img_mouth = Img_Portrait_0A1_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 2,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A2_Face,
        .img_chibi = Img_Portrait_0A2_Chibi,
        .pal = Pal_Portrait_0A2,
        .img_mouth = Img_Portrait_0A2_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A3_Face,
        .img_chibi = Img_Portrait_0A3_Chibi,
        .pal = Pal_Portrait_0A3,
        .img_mouth = Img_Portrait_0A3_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A3_Face,
        .img_chibi = Img_Portrait_0A3_Chibi,
        .pal = Pal_Portrait_0A4,
        .img_mouth = Img_Portrait_0A3_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A5_Face,
        .img_chibi = Img_Portrait_0A5_Chibi,
        .pal = Pal_Portrait_0A5,
        .img_mouth = Img_Portrait_0A5_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A5_Face,
        .img_chibi = Img_Portrait_0A5_Chibi,
        .pal = Pal_Portrait_0A6,
        .img_mouth = Img_Portrait_0A5_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A5_Face,
        .img_chibi = Img_Portrait_0A5_Chibi,
        .pal = Pal_Portrait_0A7,
        .img_mouth = Img_Portrait_0A5_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A5_Face,
        .img_chibi = Img_Portrait_0A5_Chibi,
        .pal = Pal_Portrait_0A8,
        .img_mouth = Img_Portrait_0A5_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0A9_Face,
        .img_chibi = Img_Portrait_0A9_Chibi,
        .pal = Pal_Portrait_0A9,
        .img_mouth = Img_Portrait_0A9_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AA_Face,
        .img_chibi = Img_Portrait_0AA_Chibi,
        .pal = Pal_Portrait_0AA,
        .img_mouth = Img_Portrait_0AA_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AA_Face,
        .img_chibi = Img_Portrait_0AA_Chibi,
        .pal = Pal_Portrait_0AB,
        .img_mouth = Img_Portrait_0AA_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AC_Face,
        .img_chibi = Img_Portrait_0AC_Chibi,
        .pal = Pal_Portrait_0AC,
        .img_mouth = Img_Portrait_0AC_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AD_Face,
        .img_chibi = Img_Portrait_0AD_Chibi,
        .pal = Pal_Portrait_0AD,
        .img_mouth = Img_Portrait_0AD_Mouth,
        .x_mouth = 3,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AE_Face,
        .img_chibi = Img_Portrait_0AE_Chibi,
        .pal = Pal_Portrait_0AE,
        .img_mouth = Img_Portrait_0AE_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AF_Face,
        .img_chibi = Img_Portrait_0AF_Chibi,
        .pal = Pal_Portrait_0AF,
        .img_mouth = Img_Portrait_0AF_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B0_Face,
        .img_chibi = Img_Portrait_0B0_Chibi,
        .pal = Pal_Portrait_0B0,
        .img_mouth = Img_Portrait_0B0_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B1_Face,
        .img_chibi = Img_Portrait_0B1_Chibi,
        .pal = Pal_Portrait_0B1,
        .img_mouth = Img_Portrait_0B1_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B2_Face,
        .img_chibi = Img_Portrait_0B2_Chibi,
        .pal = Pal_Portrait_0B2,
        .img_mouth = Img_Portrait_0B2_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B2_Face,
        .img_chibi = Img_Portrait_0B2_Chibi,
        .pal = Pal_Portrait_0B3,
        .img_mouth = Img_Portrait_0B2_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B4_Face,
        .img_chibi = Img_Portrait_0B4_Chibi,
        .pal = Pal_Portrait_0B4,
        .img_mouth = Img_Portrait_0B4_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 3,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0AF_Face,
        .img_chibi = Img_Portrait_0AF_Chibi,
        .pal = Pal_Portrait_0B5,
        .img_mouth = Img_Portrait_0AF_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B6_Face,
        .img_chibi = Img_Portrait_0B6_Chibi,
        .pal = Pal_Portrait_0B6,
        .img_mouth = Img_Portrait_0B6_Mouth,
        .x_mouth = 2,
        .y_mouth = 7,
        .x_eyes = 2,
        .y_eyes = 5,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B7_Face,
        .img_chibi = Img_Portrait_0B7_Chibi,
        .pal = Pal_Portrait_0B7,
        .img_mouth = Img_Portrait_0B7_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B7_Face,
        .img_chibi = Img_Portrait_0B7_Chibi,
        .pal = Pal_Portrait_0B8,
        .img_mouth = Img_Portrait_0B7_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0B0_Face,
        .img_chibi = Img_Portrait_0B0_Chibi,
        .pal = Pal_Portrait_0B9,
        .img_mouth = Img_Portrait_0B0_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0BA_Face,
        .img_chibi = Img_Portrait_0BA_Chibi,
        .pal = Pal_Portrait_0BA,
        .img_mouth = Img_Portrait_0BA_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_Batta_Face,
        .img_chibi = Img_Portrait_Batta_Chibi,
        .pal = Pal_Portrait_0BB,
        .img_mouth = Img_Portrait_Batta_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0BC_Face,
        .img_chibi = Img_Portrait_0BC_Chibi,
        .pal = Pal_Portrait_0BC,
        .img_mouth = Img_Portrait_0BC_Mouth,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 2,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = Img_Portrait_0BD_Face,
        .img_chibi = Img_Portrait_0BD_Chibi,
        .pal = Pal_Portrait_0BD,
        .img_mouth = Img_Portrait_0BD_Mouth,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 2,
        .y_eyes = 3,
        .blink_type = 1,
    },
    { .pal = gUnk_08BF8C2C, .img_card = gUnk_08BF8C4C, .blink_type = 1 },
    { .pal = gUnk_08BF86B4, .img_card = gUnk_08BF86D4, .blink_type = 1 },
    { .pal = gUnk_08BF7F4C, .img_card = gUnk_08BF7F6C, .blink_type = 1 },
    { .pal = gUnk_08BF774C, .img_card = gUnk_08BF776C, .blink_type = 1 },
    { .pal = gUnk_08BF6FD8, .img_card = gUnk_08BF6FF8, .blink_type = 1 },
    { .pal = gUnk_08BF679C, .img_card = gUnk_08BF67BC, .blink_type = 1 },
    { .pal = gUnk_08BF61B4, .img_card = gUnk_08BF61D4, .blink_type = 1 },
    { .pal = gUnk_08BF5B78, .img_card = gUnk_08BF5B98, .blink_type = 1 },
    { .pal = gUnk_08BF5570, .img_card = gUnk_08BF5590, .blink_type = 1 },
    { .pal = gUnk_08BF4EC8, .img_card = gUnk_08BF4EE8, .blink_type = 1 },
    { .pal = gUnk_08BF47E8, .img_card = gUnk_08BF4808, .blink_type = 1 },
    { .pal = gUnk_08BF4134, .img_card = gUnk_08BF4154, .blink_type = 1 },
    { .pal = gUnk_08BF3AA0, .img_card = gUnk_08BF3AC0, .blink_type = 1 },
    { .pal = gUnk_08BF330C, .img_card = gUnk_08BF332C, .blink_type = 1 },
    { .pal = gUnk_08BF2A4C, .img_card = gUnk_08BF2A6C, .blink_type = 1 },
    { .pal = gUnk_08BF2144, .img_card = gUnk_08BF2164, .blink_type = 1 },
    { .pal = gUnk_08BF19D0, .img_card = gUnk_08BF19F0, .blink_type = 1 },
    { .pal = gUnk_08BF11FC, .img_card = gUnk_08BF121C, .blink_type = 1 },
    { .pal = gUnk_08BF0A84, .img_card = gUnk_08BF0AA4, .blink_type = 1 },
    { .pal = gUnk_08BF02E0, .img_card = gUnk_08BF0300, .blink_type = 1 },
    { .pal = gUnk_08BEF9E4, .img_card = gUnk_08BEFA04, .blink_type = 1 },
    { .pal = gUnk_08BEF0B8, .img_card = gUnk_08BEF0D8, .blink_type = 1 },
    { .pal = gUnk_08BEE894, .img_card = gUnk_08BEE8B4, .blink_type = 1 },
    { .pal = gUnk_08BEE020, .img_card = gUnk_08BEE040, .blink_type = 1 },
    { .pal = gUnk_08BED9EC, .img_card = gUnk_08BEDA0C, .blink_type = 1 },
    { .pal = gUnk_08BED298, .img_card = gUnk_08BED2B8, .blink_type = 1 },
    { .pal = gUnk_08BECA50, .img_card = gUnk_08BECA70, .blink_type = 1 },
    { .pal = gUnk_08BEC244, .img_card = gUnk_08BEC264, .blink_type = 1 },
    { .pal = gUnk_08BEBCB8, .img_card = gUnk_08BEBCD8, .blink_type = 1 },
    { .pal = gUnk_08BEB35C, .img_card = gUnk_08BEB37C, .blink_type = 1 },
    { .pal = gUnk_08BEAD64, .img_card = gUnk_08BEAD84, .blink_type = 1 },
    { .pal = gUnk_08BEA734, .img_card = gUnk_08BEA754, .blink_type = 1 },
    { .pal = gUnk_08BE9D9C, .img_card = gUnk_08BE9DBC, .blink_type = 1 },
    {
        .img = gUnk_08BE95B4,
        .img_chibi = gUnk_08BE951C,
        .pal = gUnk_08BE8EFC,
        .img_mouth = gUnk_08BE8F1C,
        .x_mouth = 2,
        .y_mouth = 6,
        .x_eyes = 3,
        .y_eyes = 4,
        .blink_type = 1,
    },
    {
        .img = gUnk_08BE8864,
        .img_chibi = gUnk_08BE87CC,
        .pal = gUnk_08BE81AC,
        .img_mouth = gUnk_08BE81CC,
        .x_mouth = 2,
        .y_mouth = 5,
        .x_eyes = 3,
        .y_eyes = 3,
        .blink_type = 1,
    },
    {
        .img = gUnk_08BE7BB8,
        .pal = gUnk_08BE7598,
        .img_mouth = gUnk_08BE75B8,
        .x_mouth = 3,
        .y_mouth = 2,
        .x_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = gUnk_08BE6FF8,
        .pal = gUnk_08BE69D8,
        .img_mouth = gUnk_08BE69F8,
        .x_mouth = 3,
        .y_mouth = 2,
        .x_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = gUnk_08BE63C0,
        .pal = gUnk_08BE5DA0,
        .img_mouth = gUnk_08BE5DC0,
        .x_mouth = 3,
        .y_mouth = 3,
        .x_eyes = 2,
        .blink_type = 1,
    },
    {
        .img = gUnk_08BE578C,
        .pal = gUnk_08BE516C,
        .img_mouth = gUnk_08BE518C,
        .x_mouth = 3,
        .y_mouth = 3,
        .x_eyes = 2,
        .blink_type = 1,
    },
};
