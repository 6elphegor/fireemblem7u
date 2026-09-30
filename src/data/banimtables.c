// Battle animation tables (see include/gbafe/banim_tables.h).  The readers
// declare them non-const; a const declaration there changes their code, so
// this file includes only the struct definitions.

#include "gbafe/global.h"
#include "gbafe/banim_tables.h"

extern u16 Pal_BanimChara_01_Lin[], Pal_BanimChara_02_Rebacca[], Pal_BanimChara_03_Will[],
    Pal_BanimChara_08_Osin[], Pal_BanimChara_09_Wallace[], Pal_BanimChara_0E_Lagarto[],
    Pal_BanimChara_0F_Matthew[], Pal_BanimChara_17_Serra[], Pal_BanimChara_1A_Ruthea[],
    Pal_BanimChara_1B_Lin[], Pal_BanimChara_1E_Leyvan[], Pal_BanimChara_21_Darts[],
    Pal_BanimChara_25_Heath[], Pal_BanimChara_26_Heath[], Pal_BanimChara_29_Canas[],
    Pal_BanimChara_2B_Eliwod[], Pal_BanimChara_2C_Farina[], Pal_BanimChara_2D_Fiora[],
    Pal_BanimChara_2E_Flolina[], Pal_BanimChara_30_Dorcas[], Pal_BanimChara_33_Osin[],
    Pal_BanimChara_34_Wallace[], Pal_BanimChara_36_Hector[], Pal_BanimChara_37_Hector[],
    Pal_BanimChara_38_Eliwod[], Pal_BanimChara_39_Nino[], Pal_BanimChara_3A_Erk[],
    Pal_BanimChara_3D_Leyvan[], Pal_BanimChara_3F_Ruthea[], Pal_BanimChara_40_Guy[],
    Pal_BanimChara_41_Ruth[], Pal_BanimChara_43_Ruth[], Pal_BanimChara_49_Kent[],
    Pal_BanimChara_4A_Lowen[], Pal_BanimChara_4E_Sain[], Pal_BanimChara_4F_Farina[],
    Pal_BanimChara_50_Fiora[], Pal_BanimChara_51_Flolina[], Pal_BanimChara_52_Darts[],
    Pal_BanimChara_53_Serra[], Pal_BanimChara_55_Nino[], Pal_BanimChara_58_Erk[],
    Pal_BanimChara_5A_Canas[], Pal_BanimChara_5E_Rebacca[], Pal_BanimChara_60_Will[],
    Pal_BanimChara_62_Kent[], Pal_BanimChara_63_Lowen[], Pal_BanimChara_64_Sain[],
    Pal_BanimChara_67_Guy[], Pal_BanimChara_6B_Lagarto[], Pal_BanimChara_6C_Matthew[],
    Pal_BanimChara_6D_Priscilla[], Pal_BanimChara_6E_Priscilla[], Pal_BanimChara_72_Dorcas[],
    Pal_BanimChara_Aion[], Pal_BanimChara_Athos[], Pal_BanimChara_Baltr[], Pal_BanimChara_Bartr[],
    Pal_BanimChara_Batta[], Pal_BanimChara_Beard[], Pal_BanimChara_Belnald[],
    Pal_BanimChara_Boies[], Pal_BanimChara_Bool[], Pal_BanimChara_Bowker[],
    Pal_BanimChara_Brendan[], Pal_BanimChara_Bug[], Pal_BanimChara_Camlann[],
    Pal_BanimChara_Carjiga[], Pal_BanimChara_Damian[], Pal_BanimChara_Darren[],
    Pal_BanimChara_Denning[], Pal_BanimChara_Eagler[], Pal_BanimChara_Elic[],
    Pal_BanimChara_Fergus[], Pal_BanimChara_Gaitz[], Pal_BanimChara_Georg[], Pal_BanimChara_Glass[],
    Pal_BanimChara_Groznyi[], Pal_BanimChara_Haken[], Pal_BanimChara_Hawkeye[],
    Pal_BanimChara_Hintz[], Pal_BanimChara_Isadora[], Pal_BanimChara_Jaffar[],
    Pal_BanimChara_Jasmine[], Pal_BanimChara_Jerme[], Pal_BanimChara_Kaim[], Pal_BanimChara_Karel[],
    Pal_BanimChara_Karla[], Pal_BanimChara_Kenneth[], Pal_BanimChara_Kishuna[],
    Pal_BanimChara_Laila[], Pal_BanimChara_Limstella[], Pal_BanimChara_Linus[],
    Pal_BanimChara_Lloyd[], Pal_BanimChara_Luise[], Pal_BanimChara_Marcus[],
    Pal_BanimChara_Maxime[], Pal_BanimChara_Migal[], Pal_BanimChara_Nergal[], Pal_BanimChara_Nils[],
    Pal_BanimChara_Ninian[], Pal_BanimChara_Olg[], Pal_BanimChara_Pant[], Pal_BanimChara_Pascal[],
    Pal_BanimChara_Paul[], Pal_BanimChara_Pson[], Pal_BanimChara_Renato[], Pal_BanimChara_Siren[],
    Pal_BanimChara_Sonia[], Pal_BanimChara_Teodor[], Pal_BanimChara_Ubands[], Pal_BanimChara_Uhai[],
    Pal_BanimChara_Ursula[], Pal_BanimChara_Vaida[], Pal_BanimChara_Wire[],
    Pal_BanimChara_Wranglen[], Pal_BanimChara_Yog[], Pal_BanimChara_Zagan[],
    Pal_BanimChara_Zoldam[], Pal_BanimChara_Zugu[];

extern char Img_BattleTerrain_00_Heichi1[];
extern char Img_BattleTerrain_01_Arechi1[];
extern char Img_BattleTerrain_02_Jyoumon1[];
extern char Img_BattleTerrain_03_Bukiya1[];
extern char Img_BattleTerrain_04_Gake1[];
extern char Img_BattleTerrain_05_Gyokuza1[];
extern char Img_BattleTerrain_06_Haikyo1[];
extern char Img_BattleTerrain_07_Hanebashi1[];
extern char Img_BattleTerrain_08_Hasi1[];
extern char Img_BattleTerrain_09_Sabaku1[];
extern char Img_BattleTerrain_0A_Kawa1[];
extern char Img_BattleTerrain_0B_Mura1[];
extern char Img_BattleTerrain_0C_Umi1[];
extern char Img_BattleTerrain_0D_Mizuiumi1[];
extern char Img_BattleTerrain_0E_Azukarijo1[];
extern char Img_BattleTerrain_0F_Douguya1[];
extern char Img_BattleTerrain_10_Fukaimori1[];
extern char Img_BattleTerrain_11_Michi1[];
extern char Img_BattleTerrain_12_Minka1[];
extern char Img_BattleTerrain_13_Mori1[];
extern char Img_BattleTerrain_14_Siroyuka1[];
extern char Img_BattleTerrain_15_Sunachi1[];
extern char Img_BattleTerrain_16_Takaiyama1[];
extern char Img_BattleTerrain_17_Toride1[];
extern char Img_BattleTerrain_18_Tougijou1[];
extern char Img_BattleTerrain_19_Yama1[];
extern char Img_BattleTerrain_1A_Mahouyuka1[];
extern char Img_BattleTerrain_1B_Kabe1[];
extern char Img_BattleTerrain_1C_Kowaretakabe[];
extern char Img_BattleTerrain_1D_Kowaretakabe[];
extern char Img_BattleTerrain_1E_Hasira1[];
extern char Img_BattleTerrain_1F_Takarabako1[];
extern char Img_BattleTerrain_20_Killerarechi[];
extern char Img_BattleTerrain_21_Mon1[];
extern char Img_BattleTerrain_22_Tuusintougi1[];
extern char Img_BattleTerrain_55_Maruta1[];
extern char Img_BattleTerrain_68_Fune1[];
extern u16 Pal_BattleTerrain_00_Heichi1[], Pal_BattleTerrain_01_Arechi1[],
    Pal_BattleTerrain_02_Jyoumon1[], Pal_BattleTerrain_03_Bukiya1[], Pal_BattleTerrain_04_Gake1[],
    Pal_BattleTerrain_05_Gyokuza1[], Pal_BattleTerrain_06_Haikyo1[],
    Pal_BattleTerrain_07_Hanebashi1[], Pal_BattleTerrain_08_Hasi1[], Pal_BattleTerrain_09_Sabaku1[],
    Pal_BattleTerrain_0A_Kawa1[], Pal_BattleTerrain_0B_Mura1[], Pal_BattleTerrain_0C_Umi1[],
    Pal_BattleTerrain_0D_Mizuiumi1[], Pal_BattleTerrain_0E_Azukarijo1[],
    Pal_BattleTerrain_0F_Douguya1[], Pal_BattleTerrain_10_Fukaimori1[],
    Pal_BattleTerrain_11_Michi1[], Pal_BattleTerrain_12_Minka1[], Pal_BattleTerrain_13_Mori1[],
    Pal_BattleTerrain_14_Siroyuka1[], Pal_BattleTerrain_15_Sunachi1[],
    Pal_BattleTerrain_16_Takaiyama1[], Pal_BattleTerrain_17_Toride1[],
    Pal_BattleTerrain_18_Tougijou1[], Pal_BattleTerrain_19_Yama1[],
    Pal_BattleTerrain_1A_Mahouyuka1[], Pal_BattleTerrain_1B_Kabe1[],
    Pal_BattleTerrain_1C_Kowaretakabe[], Pal_BattleTerrain_1D_Kowaretakabe[],
    Pal_BattleTerrain_1E_Hasira1[], Pal_BattleTerrain_1F_Takarabako1[],
    Pal_BattleTerrain_20_Killerarechi[], Pal_BattleTerrain_21_Mon1[],
    Pal_BattleTerrain_22_Tuusintougi1[], Pal_BattleTerrain_55_Maruta1[],
    Pal_BattleTerrain_68_Fune1[], gUnk_08FD1618[], gUnk_08FD1638[], gUnk_08FD1658[],
    gUnk_08FD1678[], gUnk_08FD1698[], gUnk_08FD16B8[], gUnk_08FD16D8[], gUnk_08FD16F8[],
    gUnk_08FD1718[], gUnk_08FD1738[], gUnk_08FD1758[], gUnk_08FD1778[], gUnk_08FD1798[],
    gUnk_08FD17B8[], gUnk_08FD17D8[], gUnk_08FD17F8[], gUnk_08FD1818[], gUnk_08FD1838[],
    gUnk_08FD1858[], gUnk_08FD1878[], gUnk_08FD1898[], gUnk_08FD18B8[], gUnk_08FD18D8[],
    gUnk_08FD18F8[], gUnk_08FD1918[], gUnk_08FD1938[], gUnk_08FD1958[], gUnk_08FD1978[],
    gUnk_08FD1998[], gUnk_08FD19B8[], gUnk_08FD19D8[], gUnk_08FD19F8[], gUnk_08FD1A18[],
    gUnk_08FD1A38[], gUnk_08FD1A58[], gUnk_08FD1A78[], gUnk_08FD1A98[], gUnk_08FD1AB8[],
    gUnk_08FD1AD8[], gUnk_08FD1AF8[], gUnk_08FD2280[], gUnk_08FD22A0[], gUnk_08FD22C0[],
    gUnk_08FD22E0[], gUnk_08FD2300[], gUnk_08FD2320[], gUnk_08FD2340[], gUnk_08FD2360[],
    gUnk_08FD2380[], gUnk_08FD23A0[], gUnk_08FD23C0[], gUnk_08FD23E0[], gUnk_08FD2400[],
    gUnk_08FD2420[], gUnk_08FD2440[], gUnk_08FD2460[], gUnk_08FD2480[], gUnk_08FD24A0[],
    gUnk_08FD2DD8[];

extern int BanimModes_001_erlm_sw1[];
extern int BanimModes_002_erlm_sw1[];
extern int BanimModes_003_lokm_sw1[];
extern int BanimModes_004_lokd_sw1[];
extern int BanimModes_005_lokm_sw1[];
extern int BanimModes_006_lokm_sw1[];
extern int BanimModes_007_helm_ax1[];
extern int BanimModes_008_helm_ax1[];
extern int BanimModes_009_helm_ax1[];
extern int BanimModes_00A_grlm_ax1[];
extern int BanimModes_00B_grlm_ax1[];
extern int BanimModes_00C_grlm_ax1[];
extern int BanimModes_00D_grlm_ax1[];
extern int BanimModes_00E_grlm_ax1[];
extern int BanimModes_00F_allf_sw1[];
extern int BanimModes_010_allf_sw1[];
extern int BanimModes_011_bllf_sw1[];
extern int BanimModes_012_blld_sw1[];
extern int BanimModes_013_bllf_sw1[];
extern int BanimModes_014_bllf_sw1[];
extern int BanimModes_015_banm_ax1[];
extern int BanimModes_016_banm_ax1[];
extern int BanimModes_017_banm_ax1[];
extern int BanimModes_018_pirm_ax1[];
extern int BanimModes_019_pirm_ax1[];
extern int BanimModes_01A_pirm_ax1[];
extern int BanimModes_01B_berm_ax1[];
extern int BanimModes_01C_berm_ax1[];
extern int BanimModes_01D_berm_ax1[];
extern int BanimModes_01E_figm_ax1[];
extern int BanimModes_01F_figm_ax1[];
extern int BanimModes_020_figm_ax1[];
extern int BanimModes_021_warm_ax1[];
extern int BanimModes_022_warm_ax1[];
extern int BanimModes_023_warm_ar1[];
extern int BanimModes_024_warm_ax1[];
extern int BanimModes_025_arcm_ar1[];
extern int BanimModes_026_arcm_ar1[];
extern int BanimModes_027_arcf_ar1[];
extern int BanimModes_028_arcf_ar1[];
extern int BanimModes_029_snim_ar1[];
extern int BanimModes_02A_snim_ar1[];
extern int BanimModes_02B_snif_ar1[];
extern int BanimModes_02C_snif_ar1[];
extern int BanimModes_02D_merm_sw1[];
extern int BanimModes_02E_merm_sw1[];
extern int BanimModes_02F_bram_sw1[];
extern int BanimModes_030_bram_sw1[];
extern int BanimModes_031_bram_sw1[];
extern int BanimModes_032_bram_sw1[];
extern int BanimModes_033_myrm_sw1[];
extern int BanimModes_034_myrm_sw1[];
extern int BanimModes_035_swmm_sw1[];
extern int BanimModes_036_swmm_sw1[];
extern int BanimModes_037_swlm_sw1[];
extern int BanimModes_038_swlm_sw1[];
extern int BanimModes_039_swmf_sw1[];
extern int BanimModes_03A_swmf_sw1[];
extern int BanimModes_03B_sokm_sp1[];
extern int BanimModes_03C_sokm_sp1[];
extern int BanimModes_03D_sokm_sp1[];
extern int BanimModes_03E_sokf_sp1[];
extern int BanimModes_03F_asnm_sw1[];
extern int BanimModes_040_asnm_sw1[];
extern int BanimModes_041_pakm_sw1[];
extern int BanimModes_042_pakm_sw1[];
extern int BanimModes_043_pakm_sw1[];
extern int BanimModes_044_pakm_sw1[];
extern int BanimModes_045_pakm_sw1[];
extern int BanimModes_046_pakm_sw1[];
extern int BanimModes_047_pakm_sw1[];
extern int BanimModes_048_pakm_sw1[];
extern int BanimModes_049_pakm_sw1[];
extern int BanimModes_04A_pakm_sw1[];
extern int BanimModes_04B_paif_sw1[];
extern int BanimModes_04C_paif_sw1[];
extern int BanimModes_04D_paif_sw1[];
extern int BanimModes_04E_paif_sw1[];
extern int BanimModes_04F_paif_sw1[];
extern int BanimModes_050_solm_sp1[];
extern int BanimModes_051_solm_sp1[];
extern int BanimModes_052_armm_sp1[];
extern int BanimModes_053_armm_sp1[];
extern int BanimModes_054_genm_al1[];
extern int BanimModes_055_genm_al1[];
extern int BanimModes_056_genm_al1[];
extern int BanimModes_057_genm_al1[];
extern int BanimModes_058_magm_mg1[];
extern int BanimModes_059_magf_mg1[];
extern int BanimModes_05A_sagm_mg1[];
extern int BanimModes_05B_sagm_mg1[];
extern int BanimModes_05C_sagf_mg1[];
extern int BanimModes_05D_sagf_mg1[];
extern int BanimModes_05E_sagf_mg1[];
extern int BanimModes_05F_sagf_mg1[];
extern int BanimModes_060_prim_mg1[];
extern int BanimModes_061_prim_mg1[];
extern int BanimModes_062_prif_mg1[];
extern int BanimModes_063_prif_mg1[];
extern int BanimModes_064_monm_mg1[];
extern int BanimModes_065_bism_mg1[];
extern int BanimModes_066_bism_mg1[];
extern int BanimModes_067_bisf_mg1[];
extern int BanimModes_068_bisf_mg1[];
extern int BanimModes_069_sham_mg1[];
extern int BanimModes_06A_drum_mg1[];
extern int BanimModes_06B_drum_mg1[];
extern int BanimModes_06C_drsm_mg1[];
extern int BanimModes_06D_drsm_mg1[];
extern int BanimModes_06E_trof_ro1[];
extern int BanimModes_06F_trof_ro1[];
extern int BanimModes_070_valf_mg1[];
extern int BanimModes_071_valf_mg1[];
extern int BanimModes_072_ssam_mg1[];
extern int BanimModes_073_ssam_mg1[];
extern int BanimModes_074_nomm_ar1[];
extern int BanimModes_075_nomm_ar1[];
extern int BanimModes_076_notm_sw1[];
extern int BanimModes_077_notm_ar1[];
extern int BanimModes_078_notm_ar1[];
extern int BanimModes_079_thim_sw1[];
extern int BanimModes_07A_thim_sw1[];
extern int BanimModes_07B_thim_sw1[];
extern int BanimModes_07C_thim_sw1[];
extern int BanimModes_07D_thif_sw1[];
extern int BanimModes_07E_thif_sw1[];
extern int BanimModes_07F_asnm_sw1[];
extern int BanimModes_080_asnm_sw1[];
extern int BanimModes_081_pekf_sp1[];
extern int BanimModes_082_pekf_sp1[];
extern int BanimModes_083_fakf_sp1[];
extern int BanimModes_084_fakf_sp1[];
extern int BanimModes_085_fakf_sp1[];
extern int BanimModes_086_drkm_sp1[];
extern int BanimModes_087_drkm_sp1[];
extern int BanimModes_088_drmm_sp1[];
extern int BanimModes_089_drmm_sp1[];
extern int BanimModes_08A_drmm_sp1[];
extern int BanimModes_08B_fnld_mg1[];
extern int BanimModes_08C_stam_ar1[];
extern int BanimModes_08D_danf_no1[];
extern int BanimModes_08E_brdm_no1[];
extern int BanimModes_08F_monm_mg1[];
extern int BanimModes_090_brlm_sw1[];
extern int BanimModes_091_brlm_sw1[];
extern int BanimModes_092_brlm_sw1[];
extern int BanimModes_093_brlm_sw1[];
extern int BanimModes_094_bism_mg1[];
extern int BanimModes_095_bism_mg1[];
extern int BanimModes_096_bism_mg1[];
extern int BanimModes_097_bism_mg1[];
extern int BanimModes_098_bisf_mg1[];
extern int BanimModes_099_mygm_sw1[];
extern int BanimModes_09A_mygm_sw1[];
extern int BanimModes_09B_swgm_sw1[];
extern int BanimModes_09C_swgm_sw1[];
extern int BanimModes_09D_brsm_ax1[];
extern int BanimModes_09E_brsm_ax1[];
extern int BanimModes_09F_brsm_ax1[];
extern int BanimModes_0A0_silm_no1[];
extern int BanimModes_0A1_yuso_no1[];
extern int BanimModes_0A2_yuso_no1[];
extern char BanimOam_001_erlm_sw1_L[];
extern char BanimOam_001_erlm_sw1_R[];
extern char BanimOam_002_erlm_sw1_L[];
extern char BanimOam_002_erlm_sw1_R[];
extern char BanimOam_003_lokm_sw1_L[];
extern char BanimOam_003_lokm_sw1_R[];
extern char BanimOam_004_lokd_sw1_L[];
extern char BanimOam_004_lokd_sw1_R[];
extern char BanimOam_005_lokm_sw1_L[];
extern char BanimOam_005_lokm_sw1_R[];
extern char BanimOam_006_lokm_sw1_L[];
extern char BanimOam_006_lokm_sw1_R[];
extern char BanimOam_007_helm_ax1_L[];
extern char BanimOam_007_helm_ax1_R[];
extern char BanimOam_008_helm_ax1_L[];
extern char BanimOam_008_helm_ax1_R[];
extern char BanimOam_009_helm_ax1_L[];
extern char BanimOam_009_helm_ax1_R[];
extern char BanimOam_00A_grlm_ax1_L[];
extern char BanimOam_00A_grlm_ax1_R[];
extern char BanimOam_00B_grlm_ax1_L[];
extern char BanimOam_00B_grlm_ax1_R[];
extern char BanimOam_00C_grlm_ax1_L[];
extern char BanimOam_00C_grlm_ax1_R[];
extern char BanimOam_00D_grlm_ax1_L[];
extern char BanimOam_00D_grlm_ax1_R[];
extern char BanimOam_00E_grlm_ax1_L[];
extern char BanimOam_00E_grlm_ax1_R[];
extern char BanimOam_00F_allf_sw1_L[];
extern char BanimOam_00F_allf_sw1_R[];
extern char BanimOam_010_allf_sw1_L[];
extern char BanimOam_010_allf_sw1_R[];
extern char BanimOam_011_bllf_sw1_L[];
extern char BanimOam_011_bllf_sw1_R[];
extern char BanimOam_012_blld_sw1_L[];
extern char BanimOam_012_blld_sw1_R[];
extern char BanimOam_013_bllf_sw1_L[];
extern char BanimOam_013_bllf_sw1_R[];
extern char BanimOam_014_bllf_sw1_L[];
extern char BanimOam_014_bllf_sw1_R[];
extern char BanimOam_015_banm_ax1_L[];
extern char BanimOam_015_banm_ax1_R[];
extern char BanimOam_016_banm_ax1_L[];
extern char BanimOam_016_banm_ax1_R[];
extern char BanimOam_017_banm_ax1_L[];
extern char BanimOam_017_banm_ax1_R[];
extern char BanimOam_018_pirm_ax1_L[];
extern char BanimOam_018_pirm_ax1_R[];
extern char BanimOam_019_pirm_ax1_L[];
extern char BanimOam_019_pirm_ax1_R[];
extern char BanimOam_01A_pirm_ax1_L[];
extern char BanimOam_01A_pirm_ax1_R[];
extern char BanimOam_01B_berm_ax1_L[];
extern char BanimOam_01B_berm_ax1_R[];
extern char BanimOam_01C_berm_ax1_L[];
extern char BanimOam_01C_berm_ax1_R[];
extern char BanimOam_01D_berm_ax1_L[];
extern char BanimOam_01D_berm_ax1_R[];
extern char BanimOam_01E_figm_ax1_L[];
extern char BanimOam_01E_figm_ax1_R[];
extern char BanimOam_01F_figm_ax1_L[];
extern char BanimOam_01F_figm_ax1_R[];
extern char BanimOam_020_figm_ax1_L[];
extern char BanimOam_020_figm_ax1_R[];
extern char BanimOam_021_warm_ax1_L[];
extern char BanimOam_021_warm_ax1_R[];
extern char BanimOam_022_warm_ax1_L[];
extern char BanimOam_022_warm_ax1_R[];
extern char BanimOam_023_warm_ar1_L[];
extern char BanimOam_023_warm_ar1_R[];
extern char BanimOam_024_warm_ax1_L[];
extern char BanimOam_024_warm_ax1_R[];
extern char BanimOam_025_arcm_ar1_L[];
extern char BanimOam_025_arcm_ar1_R[];
extern char BanimOam_026_arcm_ar1_L[];
extern char BanimOam_026_arcm_ar1_R[];
extern char BanimOam_027_arcf_ar1_L[];
extern char BanimOam_027_arcf_ar1_R[];
extern char BanimOam_028_arcf_ar1_L[];
extern char BanimOam_028_arcf_ar1_R[];
extern char BanimOam_029_snim_ar1_L[];
extern char BanimOam_029_snim_ar1_R[];
extern char BanimOam_02A_snim_ar1_L[];
extern char BanimOam_02A_snim_ar1_R[];
extern char BanimOam_02B_snif_ar1_L[];
extern char BanimOam_02B_snif_ar1_R[];
extern char BanimOam_02C_snif_ar1_L[];
extern char BanimOam_02C_snif_ar1_R[];
extern char BanimOam_02D_merm_sw1_L[];
extern char BanimOam_02D_merm_sw1_R[];
extern char BanimOam_02E_merm_sw1_L[];
extern char BanimOam_02E_merm_sw1_R[];
extern char BanimOam_02F_bram_sw1_L[];
extern char BanimOam_02F_bram_sw1_R[];
extern char BanimOam_030_bram_sw1_L[];
extern char BanimOam_030_bram_sw1_R[];
extern char BanimOam_031_bram_sw1_L[];
extern char BanimOam_031_bram_sw1_R[];
extern char BanimOam_032_bram_sw1_L[];
extern char BanimOam_032_bram_sw1_R[];
extern char BanimOam_033_myrm_sw1_L[];
extern char BanimOam_033_myrm_sw1_R[];
extern char BanimOam_034_myrm_sw1_L[];
extern char BanimOam_034_myrm_sw1_R[];
extern char BanimOam_035_swmm_sw1_L[];
extern char BanimOam_035_swmm_sw1_R[];
extern char BanimOam_036_swmm_sw1_L[];
extern char BanimOam_036_swmm_sw1_R[];
extern char BanimOam_037_swlm_sw1_L[];
extern char BanimOam_037_swlm_sw1_R[];
extern char BanimOam_038_swlm_sw1_L[];
extern char BanimOam_038_swlm_sw1_R[];
extern char BanimOam_039_swmf_sw1_L[];
extern char BanimOam_039_swmf_sw1_R[];
extern char BanimOam_03A_swmf_sw1_L[];
extern char BanimOam_03A_swmf_sw1_R[];
extern char BanimOam_03B_sokm_sp1_L[];
extern char BanimOam_03B_sokm_sp1_R[];
extern char BanimOam_03C_sokm_sp1_L[];
extern char BanimOam_03C_sokm_sp1_R[];
extern char BanimOam_03D_sokm_sp1_L[];
extern char BanimOam_03D_sokm_sp1_R[];
extern char BanimOam_03E_sokf_sp1_L[];
extern char BanimOam_03E_sokf_sp1_R[];
extern char BanimOam_03F_asnm_sw1_L[];
extern char BanimOam_03F_asnm_sw1_R[];
extern char BanimOam_040_asnm_sw1_L[];
extern char BanimOam_040_asnm_sw1_R[];
extern char BanimOam_041_pakm_sw1_L[];
extern char BanimOam_041_pakm_sw1_R[];
extern char BanimOam_042_pakm_sw1_L[];
extern char BanimOam_042_pakm_sw1_R[];
extern char BanimOam_043_pakm_sw1_L[];
extern char BanimOam_043_pakm_sw1_R[];
extern char BanimOam_044_pakm_sw1_L[];
extern char BanimOam_044_pakm_sw1_R[];
extern char BanimOam_045_pakm_sw1_L[];
extern char BanimOam_045_pakm_sw1_R[];
extern char BanimOam_046_pakm_sw1_L[];
extern char BanimOam_046_pakm_sw1_R[];
extern char BanimOam_047_pakm_sw1_L[];
extern char BanimOam_047_pakm_sw1_R[];
extern char BanimOam_048_pakm_sw1_L[];
extern char BanimOam_048_pakm_sw1_R[];
extern char BanimOam_049_pakm_sw1_L[];
extern char BanimOam_049_pakm_sw1_R[];
extern char BanimOam_04A_pakm_sw1_L[];
extern char BanimOam_04A_pakm_sw1_R[];
extern char BanimOam_04B_paif_sw1_L[];
extern char BanimOam_04B_paif_sw1_R[];
extern char BanimOam_04C_paif_sw1_L[];
extern char BanimOam_04C_paif_sw1_R[];
extern char BanimOam_04D_paif_sw1_L[];
extern char BanimOam_04D_paif_sw1_R[];
extern char BanimOam_04E_paif_sw1_L[];
extern char BanimOam_04E_paif_sw1_R[];
extern char BanimOam_04F_paif_sw1_L[];
extern char BanimOam_04F_paif_sw1_R[];
extern char BanimOam_050_solm_sp1_L[];
extern char BanimOam_050_solm_sp1_R[];
extern char BanimOam_051_solm_sp1_L[];
extern char BanimOam_051_solm_sp1_R[];
extern char BanimOam_052_armm_sp1_L[];
extern char BanimOam_052_armm_sp1_R[];
extern char BanimOam_053_armm_sp1_L[];
extern char BanimOam_053_armm_sp1_R[];
extern char BanimOam_054_genm_al1_L[];
extern char BanimOam_054_genm_al1_R[];
extern char BanimOam_055_genm_al1_L[];
extern char BanimOam_055_genm_al1_R[];
extern char BanimOam_056_genm_al1_L[];
extern char BanimOam_056_genm_al1_R[];
extern char BanimOam_057_genm_al1_L[];
extern char BanimOam_057_genm_al1_R[];
extern char BanimOam_058_magm_mg1_L[];
extern char BanimOam_058_magm_mg1_R[];
extern char BanimOam_059_magf_mg1_L[];
extern char BanimOam_059_magf_mg1_R[];
extern char BanimOam_05A_sagm_mg1_L[];
extern char BanimOam_05A_sagm_mg1_R[];
extern char BanimOam_05B_sagm_mg1_L[];
extern char BanimOam_05B_sagm_mg1_R[];
extern char BanimOam_05C_sagf_mg1_L[];
extern char BanimOam_05C_sagf_mg1_R[];
extern char BanimOam_05D_sagf_mg1_L[];
extern char BanimOam_05D_sagf_mg1_R[];
extern char BanimOam_05E_sagf_mg1_L[];
extern char BanimOam_05E_sagf_mg1_R[];
extern char BanimOam_05F_sagf_mg1_L[];
extern char BanimOam_05F_sagf_mg1_R[];
extern char BanimOam_060_prim_mg1_L[];
extern char BanimOam_060_prim_mg1_R[];
extern char BanimOam_061_prim_mg1_L[];
extern char BanimOam_061_prim_mg1_R[];
extern char BanimOam_062_prif_mg1_L[];
extern char BanimOam_062_prif_mg1_R[];
extern char BanimOam_063_prif_mg1_L[];
extern char BanimOam_063_prif_mg1_R[];
extern char BanimOam_064_monm_mg1_L[];
extern char BanimOam_064_monm_mg1_R[];
extern char BanimOam_065_bism_mg1_L[];
extern char BanimOam_065_bism_mg1_R[];
extern char BanimOam_066_bism_mg1_L[];
extern char BanimOam_066_bism_mg1_R[];
extern char BanimOam_067_bisf_mg1_L[];
extern char BanimOam_067_bisf_mg1_R[];
extern char BanimOam_068_bisf_mg1_L[];
extern char BanimOam_068_bisf_mg1_R[];
extern char BanimOam_069_sham_mg1_L[];
extern char BanimOam_069_sham_mg1_R[];
extern char BanimOam_06A_drum_mg1_L[];
extern char BanimOam_06A_drum_mg1_R[];
extern char BanimOam_06B_drum_mg1_L[];
extern char BanimOam_06B_drum_mg1_R[];
extern char BanimOam_06C_drsm_mg1_L[];
extern char BanimOam_06C_drsm_mg1_R[];
extern char BanimOam_06D_drsm_mg1_L[];
extern char BanimOam_06D_drsm_mg1_R[];
extern char BanimOam_06E_trof_ro1_L[];
extern char BanimOam_06E_trof_ro1_R[];
extern char BanimOam_06F_trof_ro1_L[];
extern char BanimOam_06F_trof_ro1_R[];
extern char BanimOam_070_valf_mg1_L[];
extern char BanimOam_070_valf_mg1_R[];
extern char BanimOam_071_valf_mg1_L[];
extern char BanimOam_071_valf_mg1_R[];
extern char BanimOam_072_ssam_mg1_L[];
extern char BanimOam_072_ssam_mg1_R[];
extern char BanimOam_073_ssam_mg1_L[];
extern char BanimOam_073_ssam_mg1_R[];
extern char BanimOam_074_nomm_ar1_L[];
extern char BanimOam_074_nomm_ar1_R[];
extern char BanimOam_075_nomm_ar1_L[];
extern char BanimOam_075_nomm_ar1_R[];
extern char BanimOam_076_notm_sw1_L[];
extern char BanimOam_076_notm_sw1_R[];
extern char BanimOam_077_notm_ar1_L[];
extern char BanimOam_077_notm_ar1_R[];
extern char BanimOam_078_notm_ar1_L[];
extern char BanimOam_078_notm_ar1_R[];
extern char BanimOam_079_thim_sw1_L[];
extern char BanimOam_079_thim_sw1_R[];
extern char BanimOam_07A_thim_sw1_L[];
extern char BanimOam_07A_thim_sw1_R[];
extern char BanimOam_07B_thim_sw1_L[];
extern char BanimOam_07B_thim_sw1_R[];
extern char BanimOam_07C_thim_sw1_L[];
extern char BanimOam_07C_thim_sw1_R[];
extern char BanimOam_07D_thif_sw1_L[];
extern char BanimOam_07D_thif_sw1_R[];
extern char BanimOam_07E_thif_sw1_L[];
extern char BanimOam_07E_thif_sw1_R[];
extern char BanimOam_07F_asnm_sw1_L[];
extern char BanimOam_07F_asnm_sw1_R[];
extern char BanimOam_080_asnm_sw1_L[];
extern char BanimOam_080_asnm_sw1_R[];
extern char BanimOam_081_pekf_sp1_L[];
extern char BanimOam_081_pekf_sp1_R[];
extern char BanimOam_082_pekf_sp1_L[];
extern char BanimOam_082_pekf_sp1_R[];
extern char BanimOam_083_fakf_sp1_L[];
extern char BanimOam_083_fakf_sp1_R[];
extern char BanimOam_084_fakf_sp1_L[];
extern char BanimOam_084_fakf_sp1_R[];
extern char BanimOam_085_fakf_sp1_L[];
extern char BanimOam_085_fakf_sp1_R[];
extern char BanimOam_086_drkm_sp1_L[];
extern char BanimOam_086_drkm_sp1_R[];
extern char BanimOam_087_drkm_sp1_L[];
extern char BanimOam_087_drkm_sp1_R[];
extern char BanimOam_088_drmm_sp1_L[];
extern char BanimOam_088_drmm_sp1_R[];
extern char BanimOam_089_drmm_sp1_L[];
extern char BanimOam_089_drmm_sp1_R[];
extern char BanimOam_08A_drmm_sp1_L[];
extern char BanimOam_08A_drmm_sp1_R[];
extern char BanimOam_08B_fnld_mg1_L[];
extern char BanimOam_08B_fnld_mg1_R[];
extern char BanimOam_08C_stam_ar1_L[];
extern char BanimOam_08C_stam_ar1_R[];
extern char BanimOam_08D_danf_no1_L[];
extern char BanimOam_08D_danf_no1_R[];
extern char BanimOam_08E_brdm_no1_L[];
extern char BanimOam_08E_brdm_no1_R[];
extern char BanimOam_08F_monm_mg1_L[];
extern char BanimOam_08F_monm_mg1_R[];
extern char BanimOam_090_brlm_sw1_L[];
extern char BanimOam_090_brlm_sw1_R[];
extern char BanimOam_091_brlm_sw1_L[];
extern char BanimOam_091_brlm_sw1_R[];
extern char BanimOam_092_brlm_sw1_L[];
extern char BanimOam_092_brlm_sw1_R[];
extern char BanimOam_093_brlm_sw1_L[];
extern char BanimOam_093_brlm_sw1_R[];
extern char BanimOam_094_bism_mg1_L[];
extern char BanimOam_094_bism_mg1_R[];
extern char BanimOam_095_bism_mg1_L[];
extern char BanimOam_095_bism_mg1_R[];
extern char BanimOam_096_bism_mg1_L[];
extern char BanimOam_096_bism_mg1_R[];
extern char BanimOam_097_bism_mg1_L[];
extern char BanimOam_097_bism_mg1_R[];
extern char BanimOam_098_bisf_mg1_L[];
extern char BanimOam_098_bisf_mg1_R[];
extern char BanimOam_099_mygm_sw1_L[];
extern char BanimOam_099_mygm_sw1_R[];
extern char BanimOam_09A_mygm_sw1_L[];
extern char BanimOam_09A_mygm_sw1_R[];
extern char BanimOam_09B_swgm_sw1_L[];
extern char BanimOam_09B_swgm_sw1_R[];
extern char BanimOam_09C_swgm_sw1_L[];
extern char BanimOam_09C_swgm_sw1_R[];
extern char BanimOam_09D_brsm_ax1_L[];
extern char BanimOam_09D_brsm_ax1_R[];
extern char BanimOam_09E_brsm_ax1_L[];
extern char BanimOam_09E_brsm_ax1_R[];
extern char BanimOam_09F_brsm_ax1_L[];
extern char BanimOam_09F_brsm_ax1_R[];
extern char BanimOam_0A0_silm_no1_L[];
extern char BanimOam_0A0_silm_no1_R[];
extern char BanimOam_0A1_yuso_no1_L[];
extern char BanimOam_0A1_yuso_no1_R[];
extern char BanimOam_0A2_yuso_no1_L[];
extern char BanimOam_0A2_yuso_no1_R[];
extern char BanimScr_001_erlm_sw1[];
extern char BanimScr_002_erlm_sw1[];
extern char BanimScr_003_lokm_sw1[];
extern char BanimScr_004_lokd_sw1[];
extern char BanimScr_005_lokm_sw1[];
extern char BanimScr_006_lokm_sw1[];
extern char BanimScr_007_helm_ax1[];
extern char BanimScr_008_helm_ax1[];
extern char BanimScr_009_helm_ax1[];
extern char BanimScr_00A_grlm_ax1[];
extern char BanimScr_00B_grlm_ax1[];
extern char BanimScr_00C_grlm_ax1[];
extern char BanimScr_00D_grlm_ax1[];
extern char BanimScr_00E_grlm_ax1[];
extern char BanimScr_00F_allf_sw1[];
extern char BanimScr_010_allf_sw1[];
extern char BanimScr_011_bllf_sw1[];
extern char BanimScr_012_blld_sw1[];
extern char BanimScr_013_bllf_sw1[];
extern char BanimScr_014_bllf_sw1[];
extern char BanimScr_015_banm_ax1[];
extern char BanimScr_016_banm_ax1[];
extern char BanimScr_017_banm_ax1[];
extern char BanimScr_018_pirm_ax1[];
extern char BanimScr_019_pirm_ax1[];
extern char BanimScr_01A_pirm_ax1[];
extern char BanimScr_01B_berm_ax1[];
extern char BanimScr_01C_berm_ax1[];
extern char BanimScr_01D_berm_ax1[];
extern char BanimScr_01E_figm_ax1[];
extern char BanimScr_01F_figm_ax1[];
extern char BanimScr_020_figm_ax1[];
extern char BanimScr_021_warm_ax1[];
extern char BanimScr_022_warm_ax1[];
extern char BanimScr_023_warm_ar1[];
extern char BanimScr_024_warm_ax1[];
extern char BanimScr_025_arcm_ar1[];
extern char BanimScr_026_arcm_ar1[];
extern char BanimScr_027_arcf_ar1[];
extern char BanimScr_028_arcf_ar1[];
extern char BanimScr_029_snim_ar1[];
extern char BanimScr_02A_snim_ar1[];
extern char BanimScr_02B_snif_ar1[];
extern char BanimScr_02C_snif_ar1[];
extern char BanimScr_02D_merm_sw1[];
extern char BanimScr_02E_merm_sw1[];
extern char BanimScr_02F_bram_sw1[];
extern char BanimScr_030_bram_sw1[];
extern char BanimScr_031_bram_sw1[];
extern char BanimScr_032_bram_sw1[];
extern char BanimScr_033_myrm_sw1[];
extern char BanimScr_034_myrm_sw1[];
extern char BanimScr_035_swmm_sw1[];
extern char BanimScr_036_swmm_sw1[];
extern char BanimScr_037_swlm_sw1[];
extern char BanimScr_038_swlm_sw1[];
extern char BanimScr_039_swmf_sw1[];
extern char BanimScr_03A_swmf_sw1[];
extern char BanimScr_03B_sokm_sp1[];
extern char BanimScr_03C_sokm_sp1[];
extern char BanimScr_03D_sokm_sp1[];
extern char BanimScr_03E_sokf_sp1[];
extern char BanimScr_03F_asnm_sw1[];
extern char BanimScr_040_asnm_sw1[];
extern char BanimScr_041_pakm_sw1[];
extern char BanimScr_042_pakm_sw1[];
extern char BanimScr_043_pakm_sw1[];
extern char BanimScr_044_pakm_sw1[];
extern char BanimScr_045_pakm_sw1[];
extern char BanimScr_046_pakm_sw1[];
extern char BanimScr_047_pakm_sw1[];
extern char BanimScr_048_pakm_sw1[];
extern char BanimScr_049_pakm_sw1[];
extern char BanimScr_04A_pakm_sw1[];
extern char BanimScr_04B_paif_sw1[];
extern char BanimScr_04C_paif_sw1[];
extern char BanimScr_04D_paif_sw1[];
extern char BanimScr_04E_paif_sw1[];
extern char BanimScr_04F_paif_sw1[];
extern char BanimScr_050_solm_sp1[];
extern char BanimScr_051_solm_sp1[];
extern char BanimScr_052_armm_sp1[];
extern char BanimScr_053_armm_sp1[];
extern char BanimScr_054_genm_al1[];
extern char BanimScr_055_genm_al1[];
extern char BanimScr_056_genm_al1[];
extern char BanimScr_057_genm_al1[];
extern char BanimScr_058_magm_mg1[];
extern char BanimScr_059_magf_mg1[];
extern char BanimScr_05A_sagm_mg1[];
extern char BanimScr_05B_sagm_mg1[];
extern char BanimScr_05C_sagf_mg1[];
extern char BanimScr_05D_sagf_mg1[];
extern char BanimScr_05E_sagf_mg1[];
extern char BanimScr_05F_sagf_mg1[];
extern char BanimScr_060_prim_mg1[];
extern char BanimScr_061_prim_mg1[];
extern char BanimScr_062_prif_mg1[];
extern char BanimScr_063_prif_mg1[];
extern char BanimScr_064_monm_mg1[];
extern char BanimScr_065_bism_mg1[];
extern char BanimScr_066_bism_mg1[];
extern char BanimScr_067_bisf_mg1[];
extern char BanimScr_068_bisf_mg1[];
extern char BanimScr_069_sham_mg1[];
extern char BanimScr_06A_drum_mg1[];
extern char BanimScr_06B_drum_mg1[];
extern char BanimScr_06C_drsm_mg1[];
extern char BanimScr_06D_drsm_mg1[];
extern char BanimScr_06E_trof_ro1[];
extern char BanimScr_06F_trof_ro1[];
extern char BanimScr_070_valf_mg1[];
extern char BanimScr_071_valf_mg1[];
extern char BanimScr_072_ssam_mg1[];
extern char BanimScr_073_ssam_mg1[];
extern char BanimScr_074_nomm_ar1[];
extern char BanimScr_075_nomm_ar1[];
extern char BanimScr_076_notm_sw1[];
extern char BanimScr_077_notm_ar1[];
extern char BanimScr_078_notm_ar1[];
extern char BanimScr_079_thim_sw1[];
extern char BanimScr_07A_thim_sw1[];
extern char BanimScr_07B_thim_sw1[];
extern char BanimScr_07C_thim_sw1[];
extern char BanimScr_07D_thif_sw1[];
extern char BanimScr_07E_thif_sw1[];
extern char BanimScr_07F_asnm_sw1[];
extern char BanimScr_080_asnm_sw1[];
extern char BanimScr_081_pekf_sp1[];
extern char BanimScr_082_pekf_sp1[];
extern char BanimScr_083_fakf_sp1[];
extern char BanimScr_084_fakf_sp1[];
extern char BanimScr_085_fakf_sp1[];
extern char BanimScr_086_drkm_sp1[];
extern char BanimScr_087_drkm_sp1[];
extern char BanimScr_088_drmm_sp1[];
extern char BanimScr_089_drmm_sp1[];
extern char BanimScr_08A_drmm_sp1[];
extern char BanimScr_08B_fnld_mg1[];
extern char BanimScr_08C_stam_ar1[];
extern char BanimScr_08D_danf_no1[];
extern char BanimScr_08E_brdm_no1[];
extern char BanimScr_08F_monm_mg1[];
extern char BanimScr_090_brlm_sw1[];
extern char BanimScr_091_brlm_sw1[];
extern char BanimScr_092_brlm_sw1[];
extern char BanimScr_093_brlm_sw1[];
extern char BanimScr_094_bism_mg1[];
extern char BanimScr_095_bism_mg1[];
extern char BanimScr_096_bism_mg1[];
extern char BanimScr_097_bism_mg1[];
extern char BanimScr_098_bisf_mg1[];
extern char BanimScr_099_mygm_sw1[];
extern char BanimScr_09A_mygm_sw1[];
extern char BanimScr_09B_swgm_sw1[];
extern char BanimScr_09C_swgm_sw1[];
extern char BanimScr_09D_brsm_ax1[];
extern char BanimScr_09E_brsm_ax1[];
extern char BanimScr_09F_brsm_ax1[];
extern char BanimScr_0A0_silm_no1[];
extern char BanimScr_0A1_yuso_no1[];
extern char BanimScr_0A2_yuso_no1[];
extern u16 Pal_Banim_001_erlm_sw1[], Pal_Banim_002_erlm_sw1[], Pal_Banim_003_lokm_sw1[],
    Pal_Banim_004_lokd_sw1[], Pal_Banim_005_lokm_sw1[], Pal_Banim_006_lokm_sw1[],
    Pal_Banim_007_helm_ax1[], Pal_Banim_008_helm_ax1[], Pal_Banim_009_helm_ax1[],
    Pal_Banim_00A_grlm_ax1[], Pal_Banim_00B_grlm_ax1[], Pal_Banim_00C_grlm_ax1[],
    Pal_Banim_00D_grlm_ax1[], Pal_Banim_00E_grlm_ax1[], Pal_Banim_00F_allf_sw1[],
    Pal_Banim_010_allf_sw1[], Pal_Banim_011_bllf_sw1[], Pal_Banim_012_blld_sw1[],
    Pal_Banim_013_bllf_sw1[], Pal_Banim_014_bllf_sw1[], Pal_Banim_015_banm_ax1[],
    Pal_Banim_016_banm_ax1[], Pal_Banim_017_banm_ax1[], Pal_Banim_018_pirm_ax1[],
    Pal_Banim_019_pirm_ax1[], Pal_Banim_01A_pirm_ax1[], Pal_Banim_01B_berm_ax1[],
    Pal_Banim_01C_berm_ax1[], Pal_Banim_01D_berm_ax1[], Pal_Banim_01E_figm_ax1[],
    Pal_Banim_01F_figm_ax1[], Pal_Banim_020_figm_ax1[], Pal_Banim_021_warm_ax1[],
    Pal_Banim_022_warm_ax1[], Pal_Banim_023_warm_ar1[], Pal_Banim_024_warm_ax1[],
    Pal_Banim_025_arcm_ar1[], Pal_Banim_026_arcm_ar1[], Pal_Banim_027_arcf_ar1[],
    Pal_Banim_028_arcf_ar1[], Pal_Banim_029_snim_ar1[], Pal_Banim_02A_snim_ar1[],
    Pal_Banim_02B_snif_ar1[], Pal_Banim_02C_snif_ar1[], Pal_Banim_02D_merm_sw1[],
    Pal_Banim_02E_merm_sw1[], Pal_Banim_02F_bram_sw1[], Pal_Banim_030_bram_sw1[],
    Pal_Banim_031_bram_sw1[], Pal_Banim_032_bram_sw1[], Pal_Banim_033_myrm_sw1[],
    Pal_Banim_034_myrm_sw1[], Pal_Banim_035_swmm_sw1[], Pal_Banim_036_swmm_sw1[],
    Pal_Banim_037_swlm_sw1[], Pal_Banim_038_swlm_sw1[], Pal_Banim_039_swmf_sw1[],
    Pal_Banim_03A_swmf_sw1[], Pal_Banim_03B_sokm_sp1[], Pal_Banim_03C_sokm_sp1[],
    Pal_Banim_03D_sokm_sp1[], Pal_Banim_03E_sokf_sp1[], Pal_Banim_03F_asnm_sw1[],
    Pal_Banim_040_asnm_sw1[], Pal_Banim_041_pakm_sw1[], Pal_Banim_042_pakm_sw1[],
    Pal_Banim_043_pakm_sw1[], Pal_Banim_044_pakm_sw1[], Pal_Banim_045_pakm_sw1[],
    Pal_Banim_046_pakm_sw1[], Pal_Banim_047_pakm_sw1[], Pal_Banim_048_pakm_sw1[],
    Pal_Banim_049_pakm_sw1[], Pal_Banim_04A_pakm_sw1[], Pal_Banim_04B_paif_sw1[],
    Pal_Banim_04C_paif_sw1[], Pal_Banim_04D_paif_sw1[], Pal_Banim_04E_paif_sw1[],
    Pal_Banim_04F_paif_sw1[], Pal_Banim_050_solm_sp1[], Pal_Banim_051_solm_sp1[],
    Pal_Banim_052_armm_sp1[], Pal_Banim_053_armm_sp1[], Pal_Banim_054_genm_al1[],
    Pal_Banim_055_genm_al1[], Pal_Banim_056_genm_al1[], Pal_Banim_057_genm_al1[],
    Pal_Banim_058_magm_mg1[], Pal_Banim_059_magf_mg1[], Pal_Banim_05A_sagm_mg1[],
    Pal_Banim_05B_sagm_mg1[], Pal_Banim_05C_sagf_mg1[], Pal_Banim_05D_sagf_mg1[],
    Pal_Banim_05E_sagf_mg1[], Pal_Banim_05F_sagf_mg1[], Pal_Banim_060_prim_mg1[],
    Pal_Banim_061_prim_mg1[], Pal_Banim_062_prif_mg1[], Pal_Banim_063_prif_mg1[],
    Pal_Banim_064_monm_mg1[], Pal_Banim_065_bism_mg1[], Pal_Banim_066_bism_mg1[],
    Pal_Banim_067_bisf_mg1[], Pal_Banim_068_bisf_mg1[], Pal_Banim_069_sham_mg1[],
    Pal_Banim_06A_drum_mg1[], Pal_Banim_06B_drum_mg1[], Pal_Banim_06C_drsm_mg1[],
    Pal_Banim_06D_drsm_mg1[], Pal_Banim_06E_trof_ro1[], Pal_Banim_06F_trof_ro1[],
    Pal_Banim_070_valf_mg1[], Pal_Banim_071_valf_mg1[], Pal_Banim_072_ssam_mg1[],
    Pal_Banim_073_ssam_mg1[], Pal_Banim_074_nomm_ar1[], Pal_Banim_075_nomm_ar1[],
    Pal_Banim_076_notm_sw1[], Pal_Banim_077_notm_ar1[], Pal_Banim_078_notm_ar1[],
    Pal_Banim_079_thim_sw1[], Pal_Banim_07A_thim_sw1[], Pal_Banim_07B_thim_sw1[],
    Pal_Banim_07C_thim_sw1[], Pal_Banim_07D_thif_sw1[], Pal_Banim_07E_thif_sw1[],
    Pal_Banim_07F_asnm_sw1[], Pal_Banim_080_asnm_sw1[], Pal_Banim_081_pekf_sp1[],
    Pal_Banim_082_pekf_sp1[], Pal_Banim_083_fakf_sp1[], Pal_Banim_084_fakf_sp1[],
    Pal_Banim_085_fakf_sp1[], Pal_Banim_086_drkm_sp1[], Pal_Banim_087_drkm_sp1[],
    Pal_Banim_088_drmm_sp1[], Pal_Banim_089_drmm_sp1[], Pal_Banim_08A_drmm_sp1[],
    Pal_Banim_08B_fnld_mg1[], Pal_Banim_08C_stam_ar1[], Pal_Banim_08D_danf_no1[],
    Pal_Banim_08E_brdm_no1[], Pal_Banim_08F_monm_mg1[], Pal_Banim_090_brlm_sw1[],
    Pal_Banim_091_brlm_sw1[], Pal_Banim_092_brlm_sw1[], Pal_Banim_093_brlm_sw1[],
    Pal_Banim_094_bism_mg1[], Pal_Banim_095_bism_mg1[], Pal_Banim_096_bism_mg1[],
    Pal_Banim_097_bism_mg1[], Pal_Banim_098_bisf_mg1[], Pal_Banim_099_mygm_sw1[],
    Pal_Banim_09A_mygm_sw1[], Pal_Banim_09B_swgm_sw1[], Pal_Banim_09C_swgm_sw1[],
    Pal_Banim_09D_brsm_ax1[], Pal_Banim_09E_brsm_ax1[], Pal_Banim_09F_brsm_ax1[],
    Pal_Banim_0A0_silm_no1[], Pal_Banim_0A1_yuso_no1[], Pal_Banim_0A2_yuso_no1[];

#if MOD_CLAUDE
extern int BanimModes_Flower[];
extern char BanimScr_Flower[], BanimOam_Flower_R[], BanimOam_Flower_L[];
extern u16 Pal_Banim_Flower[];
#endif

SECTION(".rodata.08E00008")
const struct BattleAnim banim_data[] = {
    {
        .abbr = "erlm_sw1",
        .modes = BanimModes_001_erlm_sw1,
        .script = BanimScr_001_erlm_sw1,
        .oam_r = BanimOam_001_erlm_sw1_R,
        .oam_l = BanimOam_001_erlm_sw1_L,
        .pal = Pal_Banim_001_erlm_sw1,
    },
    {
        .abbr = "erlm_sw1",
        .modes = BanimModes_002_erlm_sw1,
        .script = BanimScr_002_erlm_sw1,
        .oam_r = BanimOam_002_erlm_sw1_R,
        .oam_l = BanimOam_002_erlm_sw1_L,
        .pal = Pal_Banim_002_erlm_sw1,
    },
    {
        .abbr = "lokm_sw1",
        .modes = BanimModes_003_lokm_sw1,
        .script = BanimScr_003_lokm_sw1,
        .oam_r = BanimOam_003_lokm_sw1_R,
        .oam_l = BanimOam_003_lokm_sw1_L,
        .pal = Pal_Banim_003_lokm_sw1,
    },
    {
        .abbr = "lokd_sw1",
        .modes = BanimModes_004_lokd_sw1,
        .script = BanimScr_004_lokd_sw1,
        .oam_r = BanimOam_004_lokd_sw1_R,
        .oam_l = BanimOam_004_lokd_sw1_L,
        .pal = Pal_Banim_004_lokd_sw1,
    },
    {
        .abbr = "lokm_sw1",
        .modes = BanimModes_005_lokm_sw1,
        .script = BanimScr_005_lokm_sw1,
        .oam_r = BanimOam_005_lokm_sw1_R,
        .oam_l = BanimOam_005_lokm_sw1_L,
        .pal = Pal_Banim_005_lokm_sw1,
    },
    {
        .abbr = "lokm_sw1",
        .modes = BanimModes_006_lokm_sw1,
        .script = BanimScr_006_lokm_sw1,
        .oam_r = BanimOam_006_lokm_sw1_R,
        .oam_l = BanimOam_006_lokm_sw1_L,
        .pal = Pal_Banim_006_lokm_sw1,
    },
    {
        .abbr = "helm_ax1",
        .modes = BanimModes_007_helm_ax1,
        .script = BanimScr_007_helm_ax1,
        .oam_r = BanimOam_007_helm_ax1_R,
        .oam_l = BanimOam_007_helm_ax1_L,
        .pal = Pal_Banim_007_helm_ax1,
    },
    {
        .abbr = "helm_ax1",
        .modes = BanimModes_008_helm_ax1,
        .script = BanimScr_008_helm_ax1,
        .oam_r = BanimOam_008_helm_ax1_R,
        .oam_l = BanimOam_008_helm_ax1_L,
        .pal = Pal_Banim_008_helm_ax1,
    },
    {
        .abbr = "helm_ax1",
        .modes = BanimModes_009_helm_ax1,
        .script = BanimScr_009_helm_ax1,
        .oam_r = BanimOam_009_helm_ax1_R,
        .oam_l = BanimOam_009_helm_ax1_L,
        .pal = Pal_Banim_009_helm_ax1,
    },
    {
        .abbr = "grlm_ax1",
        .modes = BanimModes_00A_grlm_ax1,
        .script = BanimScr_00A_grlm_ax1,
        .oam_r = BanimOam_00A_grlm_ax1_R,
        .oam_l = BanimOam_00A_grlm_ax1_L,
        .pal = Pal_Banim_00A_grlm_ax1,
    },
    {
        .abbr = "grlm_ax1",
        .modes = BanimModes_00B_grlm_ax1,
        .script = BanimScr_00B_grlm_ax1,
        .oam_r = BanimOam_00B_grlm_ax1_R,
        .oam_l = BanimOam_00B_grlm_ax1_L,
        .pal = Pal_Banim_00B_grlm_ax1,
    },
    {
        .abbr = "grlm_ax1",
        .modes = BanimModes_00C_grlm_ax1,
        .script = BanimScr_00C_grlm_ax1,
        .oam_r = BanimOam_00C_grlm_ax1_R,
        .oam_l = BanimOam_00C_grlm_ax1_L,
        .pal = Pal_Banim_00C_grlm_ax1,
    },
    {
        .abbr = "grlm_ax1",
        .modes = BanimModes_00D_grlm_ax1,
        .script = BanimScr_00D_grlm_ax1,
        .oam_r = BanimOam_00D_grlm_ax1_R,
        .oam_l = BanimOam_00D_grlm_ax1_L,
        .pal = Pal_Banim_00D_grlm_ax1,
    },
    {
        .abbr = "grlm_ax1",
        .modes = BanimModes_00E_grlm_ax1,
        .script = BanimScr_00E_grlm_ax1,
        .oam_r = BanimOam_00E_grlm_ax1_R,
        .oam_l = BanimOam_00E_grlm_ax1_L,
        .pal = Pal_Banim_00E_grlm_ax1,
    },
    {
        .abbr = "allf_sw1",
        .modes = BanimModes_00F_allf_sw1,
        .script = BanimScr_00F_allf_sw1,
        .oam_r = BanimOam_00F_allf_sw1_R,
        .oam_l = BanimOam_00F_allf_sw1_L,
        .pal = Pal_Banim_00F_allf_sw1,
    },
    {
        .abbr = "allf_sw1",
        .modes = BanimModes_010_allf_sw1,
        .script = BanimScr_010_allf_sw1,
        .oam_r = BanimOam_010_allf_sw1_R,
        .oam_l = BanimOam_010_allf_sw1_L,
        .pal = Pal_Banim_010_allf_sw1,
    },
    {
        .abbr = "bllf_sw1",
        .modes = BanimModes_011_bllf_sw1,
        .script = BanimScr_011_bllf_sw1,
        .oam_r = BanimOam_011_bllf_sw1_R,
        .oam_l = BanimOam_011_bllf_sw1_L,
        .pal = Pal_Banim_011_bllf_sw1,
    },
    {
        .abbr = "blld_sw1",
        .modes = BanimModes_012_blld_sw1,
        .script = BanimScr_012_blld_sw1,
        .oam_r = BanimOam_012_blld_sw1_R,
        .oam_l = BanimOam_012_blld_sw1_L,
        .pal = Pal_Banim_012_blld_sw1,
    },
    {
        .abbr = "bllf_sw1",
        .modes = BanimModes_013_bllf_sw1,
        .script = BanimScr_013_bllf_sw1,
        .oam_r = BanimOam_013_bllf_sw1_R,
        .oam_l = BanimOam_013_bllf_sw1_L,
        .pal = Pal_Banim_013_bllf_sw1,
    },
    {
        .abbr = "bllf_sw1",
        .modes = BanimModes_014_bllf_sw1,
        .script = BanimScr_014_bllf_sw1,
        .oam_r = BanimOam_014_bllf_sw1_R,
        .oam_l = BanimOam_014_bllf_sw1_L,
        .pal = Pal_Banim_014_bllf_sw1,
    },
    {
        .abbr = "banm_ax1",
        .modes = BanimModes_015_banm_ax1,
        .script = BanimScr_015_banm_ax1,
        .oam_r = BanimOam_015_banm_ax1_R,
        .oam_l = BanimOam_015_banm_ax1_L,
        .pal = Pal_Banim_015_banm_ax1,
    },
    {
        .abbr = "banm_ax1",
        .modes = BanimModes_016_banm_ax1,
        .script = BanimScr_016_banm_ax1,
        .oam_r = BanimOam_016_banm_ax1_R,
        .oam_l = BanimOam_016_banm_ax1_L,
        .pal = Pal_Banim_016_banm_ax1,
    },
    {
        .abbr = "banm_ax1",
        .modes = BanimModes_017_banm_ax1,
        .script = BanimScr_017_banm_ax1,
        .oam_r = BanimOam_017_banm_ax1_R,
        .oam_l = BanimOam_017_banm_ax1_L,
        .pal = Pal_Banim_017_banm_ax1,
    },
    {
        .abbr = "pirm_ax1",
        .modes = BanimModes_018_pirm_ax1,
        .script = BanimScr_018_pirm_ax1,
        .oam_r = BanimOam_018_pirm_ax1_R,
        .oam_l = BanimOam_018_pirm_ax1_L,
        .pal = Pal_Banim_018_pirm_ax1,
    },
    {
        .abbr = "pirm_ax1",
        .modes = BanimModes_019_pirm_ax1,
        .script = BanimScr_019_pirm_ax1,
        .oam_r = BanimOam_019_pirm_ax1_R,
        .oam_l = BanimOam_019_pirm_ax1_L,
        .pal = Pal_Banim_019_pirm_ax1,
    },
    {
        .abbr = "pirm_ax1",
        .modes = BanimModes_01A_pirm_ax1,
        .script = BanimScr_01A_pirm_ax1,
        .oam_r = BanimOam_01A_pirm_ax1_R,
        .oam_l = BanimOam_01A_pirm_ax1_L,
        .pal = Pal_Banim_01A_pirm_ax1,
    },
    {
        .abbr = "berm_ax1",
        .modes = BanimModes_01B_berm_ax1,
        .script = BanimScr_01B_berm_ax1,
        .oam_r = BanimOam_01B_berm_ax1_R,
        .oam_l = BanimOam_01B_berm_ax1_L,
        .pal = Pal_Banim_01B_berm_ax1,
    },
    {
        .abbr = "berm_ax1",
        .modes = BanimModes_01C_berm_ax1,
        .script = BanimScr_01C_berm_ax1,
        .oam_r = BanimOam_01C_berm_ax1_R,
        .oam_l = BanimOam_01C_berm_ax1_L,
        .pal = Pal_Banim_01C_berm_ax1,
    },
    {
        .abbr = "berm_ax1",
        .modes = BanimModes_01D_berm_ax1,
        .script = BanimScr_01D_berm_ax1,
        .oam_r = BanimOam_01D_berm_ax1_R,
        .oam_l = BanimOam_01D_berm_ax1_L,
        .pal = Pal_Banim_01D_berm_ax1,
    },
    {
        .abbr = "figm_ax1",
        .modes = BanimModes_01E_figm_ax1,
        .script = BanimScr_01E_figm_ax1,
        .oam_r = BanimOam_01E_figm_ax1_R,
        .oam_l = BanimOam_01E_figm_ax1_L,
        .pal = Pal_Banim_01E_figm_ax1,
    },
    {
        .abbr = "figm_ax1",
        .modes = BanimModes_01F_figm_ax1,
        .script = BanimScr_01F_figm_ax1,
        .oam_r = BanimOam_01F_figm_ax1_R,
        .oam_l = BanimOam_01F_figm_ax1_L,
        .pal = Pal_Banim_01F_figm_ax1,
    },
    {
        .abbr = "figm_ax1",
        .modes = BanimModes_020_figm_ax1,
        .script = BanimScr_020_figm_ax1,
        .oam_r = BanimOam_020_figm_ax1_R,
        .oam_l = BanimOam_020_figm_ax1_L,
        .pal = Pal_Banim_020_figm_ax1,
    },
    {
        .abbr = "warm_ax1",
        .modes = BanimModes_021_warm_ax1,
        .script = BanimScr_021_warm_ax1,
        .oam_r = BanimOam_021_warm_ax1_R,
        .oam_l = BanimOam_021_warm_ax1_L,
        .pal = Pal_Banim_021_warm_ax1,
    },
    {
        .abbr = "warm_ax1",
        .modes = BanimModes_022_warm_ax1,
        .script = BanimScr_022_warm_ax1,
        .oam_r = BanimOam_022_warm_ax1_R,
        .oam_l = BanimOam_022_warm_ax1_L,
        .pal = Pal_Banim_022_warm_ax1,
    },
    {
        .abbr = "warm_ar1",
        .modes = BanimModes_023_warm_ar1,
        .script = BanimScr_023_warm_ar1,
        .oam_r = BanimOam_023_warm_ar1_R,
        .oam_l = BanimOam_023_warm_ar1_L,
        .pal = Pal_Banim_023_warm_ar1,
    },
    {
        .abbr = "warm_ax1",
        .modes = BanimModes_024_warm_ax1,
        .script = BanimScr_024_warm_ax1,
        .oam_r = BanimOam_024_warm_ax1_R,
        .oam_l = BanimOam_024_warm_ax1_L,
        .pal = Pal_Banim_024_warm_ax1,
    },
    {
        .abbr = "arcm_ar1",
        .modes = BanimModes_025_arcm_ar1,
        .script = BanimScr_025_arcm_ar1,
        .oam_r = BanimOam_025_arcm_ar1_R,
        .oam_l = BanimOam_025_arcm_ar1_L,
        .pal = Pal_Banim_025_arcm_ar1,
    },
    {
        .abbr = "arcm_ar1",
        .modes = BanimModes_026_arcm_ar1,
        .script = BanimScr_026_arcm_ar1,
        .oam_r = BanimOam_026_arcm_ar1_R,
        .oam_l = BanimOam_026_arcm_ar1_L,
        .pal = Pal_Banim_026_arcm_ar1,
    },
    {
        .abbr = "arcf_ar1",
        .modes = BanimModes_027_arcf_ar1,
        .script = BanimScr_027_arcf_ar1,
        .oam_r = BanimOam_027_arcf_ar1_R,
        .oam_l = BanimOam_027_arcf_ar1_L,
        .pal = Pal_Banim_027_arcf_ar1,
    },
    {
        .abbr = "arcf_ar1",
        .modes = BanimModes_028_arcf_ar1,
        .script = BanimScr_028_arcf_ar1,
        .oam_r = BanimOam_028_arcf_ar1_R,
        .oam_l = BanimOam_028_arcf_ar1_L,
        .pal = Pal_Banim_028_arcf_ar1,
    },
    {
        .abbr = "snim_ar1",
        .modes = BanimModes_029_snim_ar1,
        .script = BanimScr_029_snim_ar1,
        .oam_r = BanimOam_029_snim_ar1_R,
        .oam_l = BanimOam_029_snim_ar1_L,
        .pal = Pal_Banim_029_snim_ar1,
    },
    {
        .abbr = "snim_ar1",
        .modes = BanimModes_02A_snim_ar1,
        .script = BanimScr_02A_snim_ar1,
        .oam_r = BanimOam_02A_snim_ar1_R,
        .oam_l = BanimOam_02A_snim_ar1_L,
        .pal = Pal_Banim_02A_snim_ar1,
    },
    {
        .abbr = "snif_ar1",
        .modes = BanimModes_02B_snif_ar1,
        .script = BanimScr_02B_snif_ar1,
        .oam_r = BanimOam_02B_snif_ar1_R,
        .oam_l = BanimOam_02B_snif_ar1_L,
        .pal = Pal_Banim_02B_snif_ar1,
    },
    {
        .abbr = "snif_ar1",
        .modes = BanimModes_02C_snif_ar1,
        .script = BanimScr_02C_snif_ar1,
        .oam_r = BanimOam_02C_snif_ar1_R,
        .oam_l = BanimOam_02C_snif_ar1_L,
        .pal = Pal_Banim_02C_snif_ar1,
    },
    {
        .abbr = "merm_sw1",
        .modes = BanimModes_02D_merm_sw1,
        .script = BanimScr_02D_merm_sw1,
        .oam_r = BanimOam_02D_merm_sw1_R,
        .oam_l = BanimOam_02D_merm_sw1_L,
        .pal = Pal_Banim_02D_merm_sw1,
    },
    {
        .abbr = "merm_sw1",
        .modes = BanimModes_02E_merm_sw1,
        .script = BanimScr_02E_merm_sw1,
        .oam_r = BanimOam_02E_merm_sw1_R,
        .oam_l = BanimOam_02E_merm_sw1_L,
        .pal = Pal_Banim_02E_merm_sw1,
    },
    {
        .abbr = "bram_sw1",
        .modes = BanimModes_02F_bram_sw1,
        .script = BanimScr_02F_bram_sw1,
        .oam_r = BanimOam_02F_bram_sw1_R,
        .oam_l = BanimOam_02F_bram_sw1_L,
        .pal = Pal_Banim_02F_bram_sw1,
    },
    {
        .abbr = "bram_sw1",
        .modes = BanimModes_030_bram_sw1,
        .script = BanimScr_030_bram_sw1,
        .oam_r = BanimOam_030_bram_sw1_R,
        .oam_l = BanimOam_030_bram_sw1_L,
        .pal = Pal_Banim_030_bram_sw1,
    },
    {
        .abbr = "bram_sw1",
        .modes = BanimModes_031_bram_sw1,
        .script = BanimScr_031_bram_sw1,
        .oam_r = BanimOam_031_bram_sw1_R,
        .oam_l = BanimOam_031_bram_sw1_L,
        .pal = Pal_Banim_031_bram_sw1,
    },
    {
        .abbr = "bram_sw1",
        .modes = BanimModes_032_bram_sw1,
        .script = BanimScr_032_bram_sw1,
        .oam_r = BanimOam_032_bram_sw1_R,
        .oam_l = BanimOam_032_bram_sw1_L,
        .pal = Pal_Banim_032_bram_sw1,
    },
    {
        .abbr = "myrm_sw1",
        .modes = BanimModes_033_myrm_sw1,
        .script = BanimScr_033_myrm_sw1,
        .oam_r = BanimOam_033_myrm_sw1_R,
        .oam_l = BanimOam_033_myrm_sw1_L,
        .pal = Pal_Banim_033_myrm_sw1,
    },
    {
        .abbr = "myrm_sw1",
        .modes = BanimModes_034_myrm_sw1,
        .script = BanimScr_034_myrm_sw1,
        .oam_r = BanimOam_034_myrm_sw1_R,
        .oam_l = BanimOam_034_myrm_sw1_L,
        .pal = Pal_Banim_034_myrm_sw1,
    },
    {
        .abbr = "swmm_sw1",
        .modes = BanimModes_035_swmm_sw1,
        .script = BanimScr_035_swmm_sw1,
        .oam_r = BanimOam_035_swmm_sw1_R,
        .oam_l = BanimOam_035_swmm_sw1_L,
        .pal = Pal_Banim_035_swmm_sw1,
    },
    {
        .abbr = "swmm_sw1",
        .modes = BanimModes_036_swmm_sw1,
        .script = BanimScr_036_swmm_sw1,
        .oam_r = BanimOam_036_swmm_sw1_R,
        .oam_l = BanimOam_036_swmm_sw1_L,
        .pal = Pal_Banim_036_swmm_sw1,
    },
    {
        .abbr = "swlm_sw1",
        .modes = BanimModes_037_swlm_sw1,
        .script = BanimScr_037_swlm_sw1,
        .oam_r = BanimOam_037_swlm_sw1_R,
        .oam_l = BanimOam_037_swlm_sw1_L,
        .pal = Pal_Banim_037_swlm_sw1,
    },
    {
        .abbr = "swlm_sw1",
        .modes = BanimModes_038_swlm_sw1,
        .script = BanimScr_038_swlm_sw1,
        .oam_r = BanimOam_038_swlm_sw1_R,
        .oam_l = BanimOam_038_swlm_sw1_L,
        .pal = Pal_Banim_038_swlm_sw1,
    },
    {
        .abbr = "swmf_sw1",
        .modes = BanimModes_039_swmf_sw1,
        .script = BanimScr_039_swmf_sw1,
        .oam_r = BanimOam_039_swmf_sw1_R,
        .oam_l = BanimOam_039_swmf_sw1_L,
        .pal = Pal_Banim_039_swmf_sw1,
    },
    {
        .abbr = "swmf_sw1",
        .modes = BanimModes_03A_swmf_sw1,
        .script = BanimScr_03A_swmf_sw1,
        .oam_r = BanimOam_03A_swmf_sw1_R,
        .oam_l = BanimOam_03A_swmf_sw1_L,
        .pal = Pal_Banim_03A_swmf_sw1,
    },
    {
        .abbr = "sokm_sp1",
        .modes = BanimModes_03B_sokm_sp1,
        .script = BanimScr_03B_sokm_sp1,
        .oam_r = BanimOam_03B_sokm_sp1_R,
        .oam_l = BanimOam_03B_sokm_sp1_L,
        .pal = Pal_Banim_03B_sokm_sp1,
    },
    {
        .abbr = "sokm_sp1",
        .modes = BanimModes_03C_sokm_sp1,
        .script = BanimScr_03C_sokm_sp1,
        .oam_r = BanimOam_03C_sokm_sp1_R,
        .oam_l = BanimOam_03C_sokm_sp1_L,
        .pal = Pal_Banim_03C_sokm_sp1,
    },
    {
        .abbr = "sokm_sp1",
        .modes = BanimModes_03D_sokm_sp1,
        .script = BanimScr_03D_sokm_sp1,
        .oam_r = BanimOam_03D_sokm_sp1_R,
        .oam_l = BanimOam_03D_sokm_sp1_L,
        .pal = Pal_Banim_03D_sokm_sp1,
    },
    {
        .abbr = "sokf_sp1",
        .modes = BanimModes_03E_sokf_sp1,
        .script = BanimScr_03E_sokf_sp1,
        .oam_r = BanimOam_03E_sokf_sp1_R,
        .oam_l = BanimOam_03E_sokf_sp1_L,
        .pal = Pal_Banim_03E_sokf_sp1,
    },
    {
        .abbr = "asnm_sw1",
        .modes = BanimModes_03F_asnm_sw1,
        .script = BanimScr_03F_asnm_sw1,
        .oam_r = BanimOam_03F_asnm_sw1_R,
        .oam_l = BanimOam_03F_asnm_sw1_L,
        .pal = Pal_Banim_03F_asnm_sw1,
    },
    {
        .abbr = "asnm_sw1",
        .modes = BanimModes_040_asnm_sw1,
        .script = BanimScr_040_asnm_sw1,
        .oam_r = BanimOam_040_asnm_sw1_R,
        .oam_l = BanimOam_040_asnm_sw1_L,
        .pal = Pal_Banim_040_asnm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_041_pakm_sw1,
        .script = BanimScr_041_pakm_sw1,
        .oam_r = BanimOam_041_pakm_sw1_R,
        .oam_l = BanimOam_041_pakm_sw1_L,
        .pal = Pal_Banim_041_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_042_pakm_sw1,
        .script = BanimScr_042_pakm_sw1,
        .oam_r = BanimOam_042_pakm_sw1_R,
        .oam_l = BanimOam_042_pakm_sw1_L,
        .pal = Pal_Banim_042_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_043_pakm_sw1,
        .script = BanimScr_043_pakm_sw1,
        .oam_r = BanimOam_043_pakm_sw1_R,
        .oam_l = BanimOam_043_pakm_sw1_L,
        .pal = Pal_Banim_043_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_044_pakm_sw1,
        .script = BanimScr_044_pakm_sw1,
        .oam_r = BanimOam_044_pakm_sw1_R,
        .oam_l = BanimOam_044_pakm_sw1_L,
        .pal = Pal_Banim_044_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_045_pakm_sw1,
        .script = BanimScr_045_pakm_sw1,
        .oam_r = BanimOam_045_pakm_sw1_R,
        .oam_l = BanimOam_045_pakm_sw1_L,
        .pal = Pal_Banim_045_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_046_pakm_sw1,
        .script = BanimScr_046_pakm_sw1,
        .oam_r = BanimOam_046_pakm_sw1_R,
        .oam_l = BanimOam_046_pakm_sw1_L,
        .pal = Pal_Banim_046_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_047_pakm_sw1,
        .script = BanimScr_047_pakm_sw1,
        .oam_r = BanimOam_047_pakm_sw1_R,
        .oam_l = BanimOam_047_pakm_sw1_L,
        .pal = Pal_Banim_047_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_048_pakm_sw1,
        .script = BanimScr_048_pakm_sw1,
        .oam_r = BanimOam_048_pakm_sw1_R,
        .oam_l = BanimOam_048_pakm_sw1_L,
        .pal = Pal_Banim_048_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_049_pakm_sw1,
        .script = BanimScr_049_pakm_sw1,
        .oam_r = BanimOam_049_pakm_sw1_R,
        .oam_l = BanimOam_049_pakm_sw1_L,
        .pal = Pal_Banim_049_pakm_sw1,
    },
    {
        .abbr = "pakm_sw1",
        .modes = BanimModes_04A_pakm_sw1,
        .script = BanimScr_04A_pakm_sw1,
        .oam_r = BanimOam_04A_pakm_sw1_R,
        .oam_l = BanimOam_04A_pakm_sw1_L,
        .pal = Pal_Banim_04A_pakm_sw1,
    },
    {
        .abbr = "paif_sw1",
        .modes = BanimModes_04B_paif_sw1,
        .script = BanimScr_04B_paif_sw1,
        .oam_r = BanimOam_04B_paif_sw1_R,
        .oam_l = BanimOam_04B_paif_sw1_L,
        .pal = Pal_Banim_04B_paif_sw1,
    },
    {
        .abbr = "paif_sw1",
        .modes = BanimModes_04C_paif_sw1,
        .script = BanimScr_04C_paif_sw1,
        .oam_r = BanimOam_04C_paif_sw1_R,
        .oam_l = BanimOam_04C_paif_sw1_L,
        .pal = Pal_Banim_04C_paif_sw1,
    },
    {
        .abbr = "paif_sw1",
        .modes = BanimModes_04D_paif_sw1,
        .script = BanimScr_04D_paif_sw1,
        .oam_r = BanimOam_04D_paif_sw1_R,
        .oam_l = BanimOam_04D_paif_sw1_L,
        .pal = Pal_Banim_04D_paif_sw1,
    },
    {
        .abbr = "paif_sw1",
        .modes = BanimModes_04E_paif_sw1,
        .script = BanimScr_04E_paif_sw1,
        .oam_r = BanimOam_04E_paif_sw1_R,
        .oam_l = BanimOam_04E_paif_sw1_L,
        .pal = Pal_Banim_04E_paif_sw1,
    },
    {
        .abbr = "paif_sw1",
        .modes = BanimModes_04F_paif_sw1,
        .script = BanimScr_04F_paif_sw1,
        .oam_r = BanimOam_04F_paif_sw1_R,
        .oam_l = BanimOam_04F_paif_sw1_L,
        .pal = Pal_Banim_04F_paif_sw1,
    },
    {
        .abbr = "solm_sp1",
        .modes = BanimModes_050_solm_sp1,
        .script = BanimScr_050_solm_sp1,
        .oam_r = BanimOam_050_solm_sp1_R,
        .oam_l = BanimOam_050_solm_sp1_L,
        .pal = Pal_Banim_050_solm_sp1,
    },
    {
        .abbr = "solm_sp1",
        .modes = BanimModes_051_solm_sp1,
        .script = BanimScr_051_solm_sp1,
        .oam_r = BanimOam_051_solm_sp1_R,
        .oam_l = BanimOam_051_solm_sp1_L,
        .pal = Pal_Banim_051_solm_sp1,
    },
    {
        .abbr = "armm_sp1",
        .modes = BanimModes_052_armm_sp1,
        .script = BanimScr_052_armm_sp1,
        .oam_r = BanimOam_052_armm_sp1_R,
        .oam_l = BanimOam_052_armm_sp1_L,
        .pal = Pal_Banim_052_armm_sp1,
    },
    {
        .abbr = "armm_sp1",
        .modes = BanimModes_053_armm_sp1,
        .script = BanimScr_053_armm_sp1,
        .oam_r = BanimOam_053_armm_sp1_R,
        .oam_l = BanimOam_053_armm_sp1_L,
        .pal = Pal_Banim_053_armm_sp1,
    },
    {
        .abbr = "genm_al1",
        .modes = BanimModes_054_genm_al1,
        .script = BanimScr_054_genm_al1,
        .oam_r = BanimOam_054_genm_al1_R,
        .oam_l = BanimOam_054_genm_al1_L,
        .pal = Pal_Banim_054_genm_al1,
    },
    {
        .abbr = "genm_al1",
        .modes = BanimModes_055_genm_al1,
        .script = BanimScr_055_genm_al1,
        .oam_r = BanimOam_055_genm_al1_R,
        .oam_l = BanimOam_055_genm_al1_L,
        .pal = Pal_Banim_055_genm_al1,
    },
    {
        .abbr = "genm_al1",
        .modes = BanimModes_056_genm_al1,
        .script = BanimScr_056_genm_al1,
        .oam_r = BanimOam_056_genm_al1_R,
        .oam_l = BanimOam_056_genm_al1_L,
        .pal = Pal_Banim_056_genm_al1,
    },
    {
        .abbr = "genm_al1",
        .modes = BanimModes_057_genm_al1,
        .script = BanimScr_057_genm_al1,
        .oam_r = BanimOam_057_genm_al1_R,
        .oam_l = BanimOam_057_genm_al1_L,
        .pal = Pal_Banim_057_genm_al1,
    },
    {
        .abbr = "magm_mg1",
        .modes = BanimModes_058_magm_mg1,
        .script = BanimScr_058_magm_mg1,
        .oam_r = BanimOam_058_magm_mg1_R,
        .oam_l = BanimOam_058_magm_mg1_L,
        .pal = Pal_Banim_058_magm_mg1,
    },
    {
        .abbr = "magf_mg1",
        .modes = BanimModes_059_magf_mg1,
        .script = BanimScr_059_magf_mg1,
        .oam_r = BanimOam_059_magf_mg1_R,
        .oam_l = BanimOam_059_magf_mg1_L,
        .pal = Pal_Banim_059_magf_mg1,
    },
    {
        .abbr = "sagm_mg1",
        .modes = BanimModes_05A_sagm_mg1,
        .script = BanimScr_05A_sagm_mg1,
        .oam_r = BanimOam_05A_sagm_mg1_R,
        .oam_l = BanimOam_05A_sagm_mg1_L,
        .pal = Pal_Banim_05A_sagm_mg1,
    },
    {
        .abbr = "sagm_mg1",
        .modes = BanimModes_05B_sagm_mg1,
        .script = BanimScr_05B_sagm_mg1,
        .oam_r = BanimOam_05B_sagm_mg1_R,
        .oam_l = BanimOam_05B_sagm_mg1_L,
        .pal = Pal_Banim_05B_sagm_mg1,
    },
    {
        .abbr = "sagf_mg1",
        .modes = BanimModes_05C_sagf_mg1,
        .script = BanimScr_05C_sagf_mg1,
        .oam_r = BanimOam_05C_sagf_mg1_R,
        .oam_l = BanimOam_05C_sagf_mg1_L,
        .pal = Pal_Banim_05C_sagf_mg1,
    },
    {
        .abbr = "sagf_mg1",
        .modes = BanimModes_05D_sagf_mg1,
        .script = BanimScr_05D_sagf_mg1,
        .oam_r = BanimOam_05D_sagf_mg1_R,
        .oam_l = BanimOam_05D_sagf_mg1_L,
        .pal = Pal_Banim_05D_sagf_mg1,
    },
    {
        .abbr = "sagf_mg1",
        .modes = BanimModes_05E_sagf_mg1,
        .script = BanimScr_05E_sagf_mg1,
        .oam_r = BanimOam_05E_sagf_mg1_R,
        .oam_l = BanimOam_05E_sagf_mg1_L,
        .pal = Pal_Banim_05E_sagf_mg1,
    },
    {
        .abbr = "sagf_mg1",
        .modes = BanimModes_05F_sagf_mg1,
        .script = BanimScr_05F_sagf_mg1,
        .oam_r = BanimOam_05F_sagf_mg1_R,
        .oam_l = BanimOam_05F_sagf_mg1_L,
        .pal = Pal_Banim_05F_sagf_mg1,
    },
    {
        .abbr = "prim_mg1",
        .modes = BanimModes_060_prim_mg1,
        .script = BanimScr_060_prim_mg1,
        .oam_r = BanimOam_060_prim_mg1_R,
        .oam_l = BanimOam_060_prim_mg1_L,
        .pal = Pal_Banim_060_prim_mg1,
    },
    {
        .abbr = "prim_mg1",
        .modes = BanimModes_061_prim_mg1,
        .script = BanimScr_061_prim_mg1,
        .oam_r = BanimOam_061_prim_mg1_R,
        .oam_l = BanimOam_061_prim_mg1_L,
        .pal = Pal_Banim_061_prim_mg1,
    },
    {
        .abbr = "prif_mg1",
        .modes = BanimModes_062_prif_mg1,
        .script = BanimScr_062_prif_mg1,
        .oam_r = BanimOam_062_prif_mg1_R,
        .oam_l = BanimOam_062_prif_mg1_L,
        .pal = Pal_Banim_062_prif_mg1,
    },
    {
        .abbr = "prif_mg1",
        .modes = BanimModes_063_prif_mg1,
        .script = BanimScr_063_prif_mg1,
        .oam_r = BanimOam_063_prif_mg1_R,
        .oam_l = BanimOam_063_prif_mg1_L,
        .pal = Pal_Banim_063_prif_mg1,
    },
    {
        .abbr = "monm_mg1",
        .modes = BanimModes_064_monm_mg1,
        .script = BanimScr_064_monm_mg1,
        .oam_r = BanimOam_064_monm_mg1_R,
        .oam_l = BanimOam_064_monm_mg1_L,
        .pal = Pal_Banim_064_monm_mg1,
    },
    {
        .abbr = "bism_mg1",
        .modes = BanimModes_065_bism_mg1,
        .script = BanimScr_065_bism_mg1,
        .oam_r = BanimOam_065_bism_mg1_R,
        .oam_l = BanimOam_065_bism_mg1_L,
        .pal = Pal_Banim_065_bism_mg1,
    },
    {
        .abbr = "bism_mg1",
        .modes = BanimModes_066_bism_mg1,
        .script = BanimScr_066_bism_mg1,
        .oam_r = BanimOam_066_bism_mg1_R,
        .oam_l = BanimOam_066_bism_mg1_L,
        .pal = Pal_Banim_066_bism_mg1,
    },
    {
        .abbr = "bisf_mg1",
        .modes = BanimModes_067_bisf_mg1,
        .script = BanimScr_067_bisf_mg1,
        .oam_r = BanimOam_067_bisf_mg1_R,
        .oam_l = BanimOam_067_bisf_mg1_L,
        .pal = Pal_Banim_067_bisf_mg1,
    },
    {
        .abbr = "bisf_mg1",
        .modes = BanimModes_068_bisf_mg1,
        .script = BanimScr_068_bisf_mg1,
        .oam_r = BanimOam_068_bisf_mg1_R,
        .oam_l = BanimOam_068_bisf_mg1_L,
        .pal = Pal_Banim_068_bisf_mg1,
    },
    {
        .abbr = "sham_mg1",
        .modes = BanimModes_069_sham_mg1,
        .script = BanimScr_069_sham_mg1,
        .oam_r = BanimOam_069_sham_mg1_R,
        .oam_l = BanimOam_069_sham_mg1_L,
        .pal = Pal_Banim_069_sham_mg1,
    },
    {
        .abbr = "drum_mg1",
        .modes = BanimModes_06A_drum_mg1,
        .script = BanimScr_06A_drum_mg1,
        .oam_r = BanimOam_06A_drum_mg1_R,
        .oam_l = BanimOam_06A_drum_mg1_L,
        .pal = Pal_Banim_06A_drum_mg1,
    },
    {
        .abbr = "drum_mg1",
        .modes = BanimModes_06B_drum_mg1,
        .script = BanimScr_06B_drum_mg1,
        .oam_r = BanimOam_06B_drum_mg1_R,
        .oam_l = BanimOam_06B_drum_mg1_L,
        .pal = Pal_Banim_06B_drum_mg1,
    },
    {
        .abbr = "drsm_mg1",
        .modes = BanimModes_06C_drsm_mg1,
        .script = BanimScr_06C_drsm_mg1,
        .oam_r = BanimOam_06C_drsm_mg1_R,
        .oam_l = BanimOam_06C_drsm_mg1_L,
        .pal = Pal_Banim_06C_drsm_mg1,
    },
    {
        .abbr = "drsm_mg1",
        .modes = BanimModes_06D_drsm_mg1,
        .script = BanimScr_06D_drsm_mg1,
        .oam_r = BanimOam_06D_drsm_mg1_R,
        .oam_l = BanimOam_06D_drsm_mg1_L,
        .pal = Pal_Banim_06D_drsm_mg1,
    },
    {
        .abbr = "trof_ro1",
        .modes = BanimModes_06E_trof_ro1,
        .script = BanimScr_06E_trof_ro1,
        .oam_r = BanimOam_06E_trof_ro1_R,
        .oam_l = BanimOam_06E_trof_ro1_L,
        .pal = Pal_Banim_06E_trof_ro1,
    },
    {
        .abbr = "trof_ro1",
        .modes = BanimModes_06F_trof_ro1,
        .script = BanimScr_06F_trof_ro1,
        .oam_r = BanimOam_06F_trof_ro1_R,
        .oam_l = BanimOam_06F_trof_ro1_L,
        .pal = Pal_Banim_06F_trof_ro1,
    },
    {
        .abbr = "valf_mg1",
        .modes = BanimModes_070_valf_mg1,
        .script = BanimScr_070_valf_mg1,
        .oam_r = BanimOam_070_valf_mg1_R,
        .oam_l = BanimOam_070_valf_mg1_L,
        .pal = Pal_Banim_070_valf_mg1,
    },
    {
        .abbr = "valf_mg1",
        .modes = BanimModes_071_valf_mg1,
        .script = BanimScr_071_valf_mg1,
        .oam_r = BanimOam_071_valf_mg1_R,
        .oam_l = BanimOam_071_valf_mg1_L,
        .pal = Pal_Banim_071_valf_mg1,
    },
    {
        .abbr = "ssam_mg1",
        .modes = BanimModes_072_ssam_mg1,
        .script = BanimScr_072_ssam_mg1,
        .oam_r = BanimOam_072_ssam_mg1_R,
        .oam_l = BanimOam_072_ssam_mg1_L,
        .pal = Pal_Banim_072_ssam_mg1,
    },
    {
        .abbr = "ssam_mg1",
        .modes = BanimModes_073_ssam_mg1,
        .script = BanimScr_073_ssam_mg1,
        .oam_r = BanimOam_073_ssam_mg1_R,
        .oam_l = BanimOam_073_ssam_mg1_L,
        .pal = Pal_Banim_073_ssam_mg1,
    },
    {
        .abbr = "nomm_ar1",
        .modes = BanimModes_074_nomm_ar1,
        .script = BanimScr_074_nomm_ar1,
        .oam_r = BanimOam_074_nomm_ar1_R,
        .oam_l = BanimOam_074_nomm_ar1_L,
        .pal = Pal_Banim_074_nomm_ar1,
    },
    {
        .abbr = "nomm_ar1",
        .modes = BanimModes_075_nomm_ar1,
        .script = BanimScr_075_nomm_ar1,
        .oam_r = BanimOam_075_nomm_ar1_R,
        .oam_l = BanimOam_075_nomm_ar1_L,
        .pal = Pal_Banim_075_nomm_ar1,
    },
    {
        .abbr = "notm_sw1",
        .modes = BanimModes_076_notm_sw1,
        .script = BanimScr_076_notm_sw1,
        .oam_r = BanimOam_076_notm_sw1_R,
        .oam_l = BanimOam_076_notm_sw1_L,
        .pal = Pal_Banim_076_notm_sw1,
    },
    {
        .abbr = "notm_ar1",
        .modes = BanimModes_077_notm_ar1,
        .script = BanimScr_077_notm_ar1,
        .oam_r = BanimOam_077_notm_ar1_R,
        .oam_l = BanimOam_077_notm_ar1_L,
        .pal = Pal_Banim_077_notm_ar1,
    },
    {
        .abbr = "notm_ar1",
        .modes = BanimModes_078_notm_ar1,
        .script = BanimScr_078_notm_ar1,
        .oam_r = BanimOam_078_notm_ar1_R,
        .oam_l = BanimOam_078_notm_ar1_L,
        .pal = Pal_Banim_078_notm_ar1,
    },
    {
        .abbr = "thim_sw1",
        .modes = BanimModes_079_thim_sw1,
        .script = BanimScr_079_thim_sw1,
        .oam_r = BanimOam_079_thim_sw1_R,
        .oam_l = BanimOam_079_thim_sw1_L,
        .pal = Pal_Banim_079_thim_sw1,
    },
    {
        .abbr = "thim_sw1",
        .modes = BanimModes_07A_thim_sw1,
        .script = BanimScr_07A_thim_sw1,
        .oam_r = BanimOam_07A_thim_sw1_R,
        .oam_l = BanimOam_07A_thim_sw1_L,
        .pal = Pal_Banim_07A_thim_sw1,
    },
    {
        .abbr = "thim_sw1",
        .modes = BanimModes_07B_thim_sw1,
        .script = BanimScr_07B_thim_sw1,
        .oam_r = BanimOam_07B_thim_sw1_R,
        .oam_l = BanimOam_07B_thim_sw1_L,
        .pal = Pal_Banim_07B_thim_sw1,
    },
    {
        .abbr = "thim_sw1",
        .modes = BanimModes_07C_thim_sw1,
        .script = BanimScr_07C_thim_sw1,
        .oam_r = BanimOam_07C_thim_sw1_R,
        .oam_l = BanimOam_07C_thim_sw1_L,
        .pal = Pal_Banim_07C_thim_sw1,
    },
    {
        .abbr = "thif_sw1",
        .modes = BanimModes_07D_thif_sw1,
        .script = BanimScr_07D_thif_sw1,
        .oam_r = BanimOam_07D_thif_sw1_R,
        .oam_l = BanimOam_07D_thif_sw1_L,
        .pal = Pal_Banim_07D_thif_sw1,
    },
    {
        .abbr = "thif_sw1",
        .modes = BanimModes_07E_thif_sw1,
        .script = BanimScr_07E_thif_sw1,
        .oam_r = BanimOam_07E_thif_sw1_R,
        .oam_l = BanimOam_07E_thif_sw1_L,
        .pal = Pal_Banim_07E_thif_sw1,
    },
    {
        .abbr = "asnm_sw1",
        .modes = BanimModes_07F_asnm_sw1,
        .script = BanimScr_07F_asnm_sw1,
        .oam_r = BanimOam_07F_asnm_sw1_R,
        .oam_l = BanimOam_07F_asnm_sw1_L,
        .pal = Pal_Banim_07F_asnm_sw1,
    },
    {
        .abbr = "asnm_sw1",
        .modes = BanimModes_080_asnm_sw1,
        .script = BanimScr_080_asnm_sw1,
        .oam_r = BanimOam_080_asnm_sw1_R,
        .oam_l = BanimOam_080_asnm_sw1_L,
        .pal = Pal_Banim_080_asnm_sw1,
    },
    {
        .abbr = "pekf_sp1",
        .modes = BanimModes_081_pekf_sp1,
        .script = BanimScr_081_pekf_sp1,
        .oam_r = BanimOam_081_pekf_sp1_R,
        .oam_l = BanimOam_081_pekf_sp1_L,
        .pal = Pal_Banim_081_pekf_sp1,
    },
    {
        .abbr = "pekf_sp1",
        .modes = BanimModes_082_pekf_sp1,
        .script = BanimScr_082_pekf_sp1,
        .oam_r = BanimOam_082_pekf_sp1_R,
        .oam_l = BanimOam_082_pekf_sp1_L,
        .pal = Pal_Banim_082_pekf_sp1,
    },
    {
        .abbr = "fakf_sp1",
        .modes = BanimModes_083_fakf_sp1,
        .script = BanimScr_083_fakf_sp1,
        .oam_r = BanimOam_083_fakf_sp1_R,
        .oam_l = BanimOam_083_fakf_sp1_L,
        .pal = Pal_Banim_083_fakf_sp1,
    },
    {
        .abbr = "fakf_sp1",
        .modes = BanimModes_084_fakf_sp1,
        .script = BanimScr_084_fakf_sp1,
        .oam_r = BanimOam_084_fakf_sp1_R,
        .oam_l = BanimOam_084_fakf_sp1_L,
        .pal = Pal_Banim_084_fakf_sp1,
    },
    {
        .abbr = "fakf_sp1",
        .modes = BanimModes_085_fakf_sp1,
        .script = BanimScr_085_fakf_sp1,
        .oam_r = BanimOam_085_fakf_sp1_R,
        .oam_l = BanimOam_085_fakf_sp1_L,
        .pal = Pal_Banim_085_fakf_sp1,
    },
    {
        .abbr = "drkm_sp1",
        .modes = BanimModes_086_drkm_sp1,
        .script = BanimScr_086_drkm_sp1,
        .oam_r = BanimOam_086_drkm_sp1_R,
        .oam_l = BanimOam_086_drkm_sp1_L,
        .pal = Pal_Banim_086_drkm_sp1,
    },
    {
        .abbr = "drkm_sp1",
        .modes = BanimModes_087_drkm_sp1,
        .script = BanimScr_087_drkm_sp1,
        .oam_r = BanimOam_087_drkm_sp1_R,
        .oam_l = BanimOam_087_drkm_sp1_L,
        .pal = Pal_Banim_087_drkm_sp1,
    },
    {
        .abbr = "drmm_sp1",
        .modes = BanimModes_088_drmm_sp1,
        .script = BanimScr_088_drmm_sp1,
        .oam_r = BanimOam_088_drmm_sp1_R,
        .oam_l = BanimOam_088_drmm_sp1_L,
        .pal = Pal_Banim_088_drmm_sp1,
    },
    {
        .abbr = "drmm_sp1",
        .modes = BanimModes_089_drmm_sp1,
        .script = BanimScr_089_drmm_sp1,
        .oam_r = BanimOam_089_drmm_sp1_R,
        .oam_l = BanimOam_089_drmm_sp1_L,
        .pal = Pal_Banim_089_drmm_sp1,
    },
    {
        .abbr = "drmm_sp1",
        .modes = BanimModes_08A_drmm_sp1,
        .script = BanimScr_08A_drmm_sp1,
        .oam_r = BanimOam_08A_drmm_sp1_R,
        .oam_l = BanimOam_08A_drmm_sp1_L,
        .pal = Pal_Banim_08A_drmm_sp1,
    },
    {
        .abbr = "fnld_mg1",
        .modes = BanimModes_08B_fnld_mg1,
        .script = BanimScr_08B_fnld_mg1,
        .oam_r = BanimOam_08B_fnld_mg1_R,
        .oam_l = BanimOam_08B_fnld_mg1_L,
        .pal = Pal_Banim_08B_fnld_mg1,
    },
    {
        .abbr = "stam_ar1",
        .modes = BanimModes_08C_stam_ar1,
        .script = BanimScr_08C_stam_ar1,
        .oam_r = BanimOam_08C_stam_ar1_R,
        .oam_l = BanimOam_08C_stam_ar1_L,
        .pal = Pal_Banim_08C_stam_ar1,
    },
    {
        .abbr = "danf_no1",
        .modes = BanimModes_08D_danf_no1,
        .script = BanimScr_08D_danf_no1,
        .oam_r = BanimOam_08D_danf_no1_R,
        .oam_l = BanimOam_08D_danf_no1_L,
        .pal = Pal_Banim_08D_danf_no1,
    },
    {
        .abbr = "brdm_no1",
        .modes = BanimModes_08E_brdm_no1,
        .script = BanimScr_08E_brdm_no1,
        .oam_r = BanimOam_08E_brdm_no1_R,
        .oam_l = BanimOam_08E_brdm_no1_L,
        .pal = Pal_Banim_08E_brdm_no1,
    },
    {
        .abbr = "monm_mg1",
        .modes = BanimModes_08F_monm_mg1,
        .script = BanimScr_08F_monm_mg1,
        .oam_r = BanimOam_08F_monm_mg1_R,
        .oam_l = BanimOam_08F_monm_mg1_L,
        .pal = Pal_Banim_08F_monm_mg1,
    },
    {
        .abbr = "brlm_sw1",
        .modes = BanimModes_090_brlm_sw1,
        .script = BanimScr_090_brlm_sw1,
        .oam_r = BanimOam_090_brlm_sw1_R,
        .oam_l = BanimOam_090_brlm_sw1_L,
        .pal = Pal_Banim_090_brlm_sw1,
    },
    {
        .abbr = "brlm_sw1",
        .modes = BanimModes_091_brlm_sw1,
        .script = BanimScr_091_brlm_sw1,
        .oam_r = BanimOam_091_brlm_sw1_R,
        .oam_l = BanimOam_091_brlm_sw1_L,
        .pal = Pal_Banim_091_brlm_sw1,
    },
    {
        .abbr = "brlm_sw1",
        .modes = BanimModes_092_brlm_sw1,
        .script = BanimScr_092_brlm_sw1,
        .oam_r = BanimOam_092_brlm_sw1_R,
        .oam_l = BanimOam_092_brlm_sw1_L,
        .pal = Pal_Banim_092_brlm_sw1,
    },
    {
        .abbr = "brlm_sw1",
        .modes = BanimModes_093_brlm_sw1,
        .script = BanimScr_093_brlm_sw1,
        .oam_r = BanimOam_093_brlm_sw1_R,
        .oam_l = BanimOam_093_brlm_sw1_L,
        .pal = Pal_Banim_093_brlm_sw1,
    },
    {
        .abbr = "bism_mg1",
        .modes = BanimModes_094_bism_mg1,
        .script = BanimScr_094_bism_mg1,
        .oam_r = BanimOam_094_bism_mg1_R,
        .oam_l = BanimOam_094_bism_mg1_L,
        .pal = Pal_Banim_094_bism_mg1,
    },
    {
        .abbr = "bism_mg1",
        .modes = BanimModes_095_bism_mg1,
        .script = BanimScr_095_bism_mg1,
        .oam_r = BanimOam_095_bism_mg1_R,
        .oam_l = BanimOam_095_bism_mg1_L,
        .pal = Pal_Banim_095_bism_mg1,
    },
    {
        .abbr = "bism_mg1",
        .modes = BanimModes_096_bism_mg1,
        .script = BanimScr_096_bism_mg1,
        .oam_r = BanimOam_096_bism_mg1_R,
        .oam_l = BanimOam_096_bism_mg1_L,
        .pal = Pal_Banim_096_bism_mg1,
    },
    {
        .abbr = "bism_mg1",
        .modes = BanimModes_097_bism_mg1,
        .script = BanimScr_097_bism_mg1,
        .oam_r = BanimOam_097_bism_mg1_R,
        .oam_l = BanimOam_097_bism_mg1_L,
        .pal = Pal_Banim_097_bism_mg1,
    },
    {
        .abbr = "bisf_mg1",
        .modes = BanimModes_098_bisf_mg1,
        .script = BanimScr_098_bisf_mg1,
        .oam_r = BanimOam_098_bisf_mg1_R,
        .oam_l = BanimOam_098_bisf_mg1_L,
        .pal = Pal_Banim_098_bisf_mg1,
    },
    {
        .abbr = "mygm_sw1",
        .modes = BanimModes_099_mygm_sw1,
        .script = BanimScr_099_mygm_sw1,
        .oam_r = BanimOam_099_mygm_sw1_R,
        .oam_l = BanimOam_099_mygm_sw1_L,
        .pal = Pal_Banim_099_mygm_sw1,
    },
    {
        .abbr = "mygm_sw1",
        .modes = BanimModes_09A_mygm_sw1,
        .script = BanimScr_09A_mygm_sw1,
        .oam_r = BanimOam_09A_mygm_sw1_R,
        .oam_l = BanimOam_09A_mygm_sw1_L,
        .pal = Pal_Banim_09A_mygm_sw1,
    },
    {
        .abbr = "swgm_sw1",
        .modes = BanimModes_09B_swgm_sw1,
        .script = BanimScr_09B_swgm_sw1,
        .oam_r = BanimOam_09B_swgm_sw1_R,
        .oam_l = BanimOam_09B_swgm_sw1_L,
        .pal = Pal_Banim_09B_swgm_sw1,
    },
    {
        .abbr = "swgm_sw1",
        .modes = BanimModes_09C_swgm_sw1,
        .script = BanimScr_09C_swgm_sw1,
        .oam_r = BanimOam_09C_swgm_sw1_R,
        .oam_l = BanimOam_09C_swgm_sw1_L,
        .pal = Pal_Banim_09C_swgm_sw1,
    },
    {
        .abbr = "brsm_ax1",
        .modes = BanimModes_09D_brsm_ax1,
        .script = BanimScr_09D_brsm_ax1,
        .oam_r = BanimOam_09D_brsm_ax1_R,
        .oam_l = BanimOam_09D_brsm_ax1_L,
        .pal = Pal_Banim_09D_brsm_ax1,
    },
    {
        .abbr = "brsm_ax1",
        .modes = BanimModes_09E_brsm_ax1,
        .script = BanimScr_09E_brsm_ax1,
        .oam_r = BanimOam_09E_brsm_ax1_R,
        .oam_l = BanimOam_09E_brsm_ax1_L,
        .pal = Pal_Banim_09E_brsm_ax1,
    },
    {
        .abbr = "brsm_ax1",
        .modes = BanimModes_09F_brsm_ax1,
        .script = BanimScr_09F_brsm_ax1,
        .oam_r = BanimOam_09F_brsm_ax1_R,
        .oam_l = BanimOam_09F_brsm_ax1_L,
        .pal = Pal_Banim_09F_brsm_ax1,
    },
    {
        .abbr = "silm_no1",
        .modes = BanimModes_0A0_silm_no1,
        .script = BanimScr_0A0_silm_no1,
        .oam_r = BanimOam_0A0_silm_no1_R,
        .oam_l = BanimOam_0A0_silm_no1_L,
        .pal = Pal_Banim_0A0_silm_no1,
    },
    {
        .abbr = "yuso_no1",
        .modes = BanimModes_0A1_yuso_no1,
        .script = BanimScr_0A1_yuso_no1,
        .oam_r = BanimOam_0A1_yuso_no1_R,
        .oam_l = BanimOam_0A1_yuso_no1_L,
        .pal = Pal_Banim_0A1_yuso_no1,
    },
    {
        .abbr = "yuso_no1",
        .modes = BanimModes_0A2_yuso_no1,
        .script = BanimScr_0A2_yuso_no1,
        .oam_r = BanimOam_0A2_yuso_no1_R,
        .oam_l = BanimOam_0A2_yuso_no1_L,
        .pal = Pal_Banim_0A2_yuso_no1,
    },
#if MOD_CLAUDE
    // 0xA3: the flower character (mod/claude, src/mod/claude_banim.c)
    {
        .abbr = "flower",
        .modes = BanimModes_Flower,
        .script = BanimScr_Flower,
        .oam_r = BanimOam_Flower_R,
        .oam_l = BanimOam_Flower_L,
        .pal = Pal_Banim_Flower,
    },
#endif
};

SECTION(".rodata.08FC0008")
const struct BattleAnimTerrain battle_terrain_table[] = {
    {
        .abbr = "heichi1",
        .tileset = Img_BattleTerrain_00_Heichi1,
        .palette = Pal_BattleTerrain_00_Heichi1,
    },
    {
        .abbr = "arechi1",
        .tileset = Img_BattleTerrain_01_Arechi1,
        .palette = Pal_BattleTerrain_01_Arechi1,
    },
    {
        .abbr = "jyoumon1",
        .tileset = Img_BattleTerrain_02_Jyoumon1,
        .palette = Pal_BattleTerrain_02_Jyoumon1,
    },
    {
        .abbr = "bukiya1",
        .tileset = Img_BattleTerrain_03_Bukiya1,
        .palette = Pal_BattleTerrain_03_Bukiya1,
    },
    {
        .abbr = "gake1",
        .tileset = Img_BattleTerrain_04_Gake1,
        .palette = Pal_BattleTerrain_04_Gake1,
    },
    {
        .abbr = "gyokuza1",
        .tileset = Img_BattleTerrain_05_Gyokuza1,
        .palette = Pal_BattleTerrain_05_Gyokuza1,
    },
    {
        .abbr = "haikyo1",
        .tileset = Img_BattleTerrain_06_Haikyo1,
        .palette = Pal_BattleTerrain_06_Haikyo1,
    },
    {
        .abbr = "hanebashi1",
        .tileset = Img_BattleTerrain_07_Hanebashi1,
        .palette = Pal_BattleTerrain_07_Hanebashi1,
    },
    {
        .abbr = "hasi1",
        .tileset = Img_BattleTerrain_08_Hasi1,
        .palette = Pal_BattleTerrain_08_Hasi1,
    },
    {
        .abbr = "sabaku1",
        .tileset = Img_BattleTerrain_09_Sabaku1,
        .palette = Pal_BattleTerrain_09_Sabaku1,
    },
    {
        .abbr = "kawa1",
        .tileset = Img_BattleTerrain_0A_Kawa1,
        .palette = Pal_BattleTerrain_0A_Kawa1,
    },
    {
        .abbr = "mura1",
        .tileset = Img_BattleTerrain_0B_Mura1,
        .palette = Pal_BattleTerrain_0B_Mura1,
    },
    {
        .abbr = "umi1",
        .tileset = Img_BattleTerrain_0C_Umi1,
        .palette = Pal_BattleTerrain_0C_Umi1,
    },
    {
        .abbr = "mizuiumi1",
        .tileset = Img_BattleTerrain_0D_Mizuiumi1,
        .palette = Pal_BattleTerrain_0D_Mizuiumi1,
    },
    {
        .abbr = "azukarijo1",
        .tileset = Img_BattleTerrain_0E_Azukarijo1,
        .palette = Pal_BattleTerrain_0E_Azukarijo1,
    },
    {
        .abbr = "douguya1",
        .tileset = Img_BattleTerrain_0F_Douguya1,
        .palette = Pal_BattleTerrain_0F_Douguya1,
    },
    {
        .abbr = "fukaimori1",
        .tileset = Img_BattleTerrain_10_Fukaimori1,
        .palette = Pal_BattleTerrain_10_Fukaimori1,
    },
    {
        .abbr = "michi1",
        .tileset = Img_BattleTerrain_11_Michi1,
        .palette = Pal_BattleTerrain_11_Michi1,
    },
    {
        .abbr = "minka1",
        .tileset = Img_BattleTerrain_12_Minka1,
        .palette = Pal_BattleTerrain_12_Minka1,
    },
    {
        .abbr = "mori1",
        .tileset = Img_BattleTerrain_13_Mori1,
        .palette = Pal_BattleTerrain_13_Mori1,
    },
    {
        .abbr = "siroyuka1",
        .tileset = Img_BattleTerrain_14_Siroyuka1,
        .palette = Pal_BattleTerrain_14_Siroyuka1,
    },
    {
        .abbr = "sunachi1",
        .tileset = Img_BattleTerrain_15_Sunachi1,
        .palette = Pal_BattleTerrain_15_Sunachi1,
    },
    {
        .abbr = "takaiyama1",
        .tileset = Img_BattleTerrain_16_Takaiyama1,
        .palette = Pal_BattleTerrain_16_Takaiyama1,
    },
    {
        .abbr = "toride1",
        .tileset = Img_BattleTerrain_17_Toride1,
        .palette = Pal_BattleTerrain_17_Toride1,
    },
    {
        .abbr = "tougijou1",
        .tileset = Img_BattleTerrain_18_Tougijou1,
        .palette = Pal_BattleTerrain_18_Tougijou1,
    },
    {
        .abbr = "yama1",
        .tileset = Img_BattleTerrain_19_Yama1,
        .palette = Pal_BattleTerrain_19_Yama1,
    },
    {
        .abbr = "mahouyuka1",
        .tileset = Img_BattleTerrain_1A_Mahouyuka1,
        .palette = Pal_BattleTerrain_1A_Mahouyuka1,
    },
    {
        .abbr = "kabe1",
        .tileset = Img_BattleTerrain_1B_Kabe1,
        .palette = Pal_BattleTerrain_1B_Kabe1,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1C_Kowaretakabe,
        .palette = Pal_BattleTerrain_1C_Kowaretakabe,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = Pal_BattleTerrain_1D_Kowaretakabe,
    },
    {
        .abbr = "hasira1",
        .tileset = Img_BattleTerrain_1E_Hasira1,
        .palette = Pal_BattleTerrain_1E_Hasira1,
    },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = Pal_BattleTerrain_1F_Takarabako1,
    },
    {
        .abbr = { 0x6B, 0x69, 0x6C, 0x6C, 0x65, 0x72, 0x61, 0x72, 0x65, 0x63, 0x68, 0x69 },
        .tileset = Img_BattleTerrain_20_Killerarechi,
        .palette = Pal_BattleTerrain_20_Killerarechi,
    },
    {
        .abbr = "mon1",
        .tileset = Img_BattleTerrain_21_Mon1,
        .palette = Pal_BattleTerrain_21_Mon1,
    },
    {
        .abbr = { 0x74, 0x75, 0x75, 0x73, 0x69, 0x6E, 0x74, 0x6F, 0x75, 0x67, 0x69, 0x31 },
        .tileset = Img_BattleTerrain_22_Tuusintougi1,
        .palette = Pal_BattleTerrain_22_Tuusintougi1,
    },
    { .abbr = "mura1", .tileset = Img_BattleTerrain_0B_Mura1, .palette = gUnk_08FD1618 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1638 },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD1658 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1638 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1638 },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD1658 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1638 },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = gUnk_08FD1678,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = gUnk_08FD1698,
    },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD1658 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1638 },
    { .abbr = "heichi1", .tileset = Img_BattleTerrain_00_Heichi1, .palette = gUnk_08FD16B8 },
    { .abbr = "jyoumon1", .tileset = Img_BattleTerrain_02_Jyoumon1, .palette = gUnk_08FD16D8 },
    { .abbr = "bukiya1", .tileset = Img_BattleTerrain_03_Bukiya1, .palette = gUnk_08FD16F8 },
    { .abbr = "gake1", .tileset = Img_BattleTerrain_04_Gake1, .palette = gUnk_08FD1718 },
    { .abbr = "haikyo1", .tileset = Img_BattleTerrain_06_Haikyo1, .palette = gUnk_08FD1738 },
    { .abbr = "hasi1", .tileset = Img_BattleTerrain_08_Hasi1, .palette = gUnk_08FD1758 },
    { .abbr = "kawa1", .tileset = Img_BattleTerrain_0A_Kawa1, .palette = gUnk_08FD1778 },
    { .abbr = "mura1", .tileset = Img_BattleTerrain_0B_Mura1, .palette = gUnk_08FD1798 },
    { .abbr = "mizuiumi1", .tileset = Img_BattleTerrain_0D_Mizuiumi1, .palette = gUnk_08FD17B8 },
    { .abbr = "douguya1", .tileset = Img_BattleTerrain_0F_Douguya1, .palette = gUnk_08FD17D8 },
    {
        .abbr = "fukaimori1",
        .tileset = Img_BattleTerrain_10_Fukaimori1,
        .palette = gUnk_08FD17F8,
    },
    { .abbr = "michi1", .tileset = Img_BattleTerrain_11_Michi1, .palette = gUnk_08FD1818 },
    { .abbr = "minka1", .tileset = Img_BattleTerrain_12_Minka1, .palette = gUnk_08FD1838 },
    { .abbr = "mori1", .tileset = Img_BattleTerrain_13_Mori1, .palette = gUnk_08FD1858 },
    {
        .abbr = "takaiyama1",
        .tileset = Img_BattleTerrain_16_Takaiyama1,
        .palette = gUnk_08FD1878,
    },
    { .abbr = "tougijou1", .tileset = Img_BattleTerrain_18_Tougijou1, .palette = gUnk_08FD1898 },
    { .abbr = "yama1", .tileset = Img_BattleTerrain_19_Yama1, .palette = gUnk_08FD18B8 },
    {
        .abbr = { 0x6B, 0x69, 0x6C, 0x6C, 0x65, 0x72, 0x61, 0x72, 0x65, 0x63, 0x68, 0x69 },
        .tileset = Img_BattleTerrain_20_Killerarechi,
        .palette = gUnk_08FD18D8,
    },
    { .abbr = "toride1", .tileset = Img_BattleTerrain_17_Toride1, .palette = gUnk_08FD18F8 },
    { .abbr = "kawa1", .tileset = Img_BattleTerrain_0A_Kawa1, .palette = gUnk_08FD1918 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1938 },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = gUnk_08FD1958,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = gUnk_08FD1978,
    },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD1998 },
    { .abbr = "hasira1", .tileset = Img_BattleTerrain_1E_Hasira1, .palette = gUnk_08FD19B8 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1638 },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = gUnk_08FD1678,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = gUnk_08FD1698,
    },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD1658 },
    { .abbr = "hasira1", .tileset = Img_BattleTerrain_1E_Hasira1, .palette = gUnk_08FD19D8 },
    { .abbr = "heichi1", .tileset = Img_BattleTerrain_00_Heichi1, .palette = gUnk_08FD19F8 },
    { .abbr = "kawa1", .tileset = Img_BattleTerrain_0A_Kawa1, .palette = gUnk_08FD1A18 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD1A38 },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = gUnk_08FD1A58,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = gUnk_08FD1A78,
    },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD1A98 },
    { .abbr = "hasira1", .tileset = Img_BattleTerrain_1E_Hasira1, .palette = gUnk_08FD1AB8 },
    { .abbr = "heichi1", .tileset = Img_BattleTerrain_00_Heichi1, .palette = gUnk_08FD1AD8 },
    { .abbr = "kawa1", .tileset = Img_BattleTerrain_0A_Kawa1, .palette = gUnk_08FD1AF8 },
    {
        .abbr = "maruta1",
        .tileset = Img_BattleTerrain_55_Maruta1,
        .palette = Pal_BattleTerrain_55_Maruta1,
    },
    { .abbr = "hasi1", .tileset = Img_BattleTerrain_08_Hasi1, .palette = gUnk_08FD2280 },
    { .abbr = "mura1", .tileset = Img_BattleTerrain_0B_Mura1, .palette = gUnk_08FD22A0 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD22C0 },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = gUnk_08FD22E0,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = gUnk_08FD2300,
    },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD2320 },
    { .abbr = "hasira1", .tileset = Img_BattleTerrain_1E_Hasira1, .palette = gUnk_08FD2340 },
    { .abbr = "heichi1", .tileset = Img_BattleTerrain_00_Heichi1, .palette = gUnk_08FD2360 },
    { .abbr = "kawa1", .tileset = Img_BattleTerrain_0A_Kawa1, .palette = gUnk_08FD2380 },
    { .abbr = "gake1", .tileset = Img_BattleTerrain_04_Gake1, .palette = gUnk_08FD23A0 },
    { .abbr = "siroyuka1", .tileset = Img_BattleTerrain_14_Siroyuka1, .palette = gUnk_08FD23C0 },
    {
        .abbr = "takarabako1",
        .tileset = Img_BattleTerrain_1F_Takarabako1,
        .palette = gUnk_08FD23E0,
    },
    {
        .abbr = { 0x6B, 0x6F, 0x77, 0x61, 0x72, 0x65, 0x74, 0x61, 0x6B, 0x61, 0x62, 0x65 },
        .tileset = Img_BattleTerrain_1D_Kowaretakabe,
        .palette = gUnk_08FD2400,
    },
    { .abbr = "gyokuza1", .tileset = Img_BattleTerrain_05_Gyokuza1, .palette = gUnk_08FD2420 },
    { .abbr = "hasira1", .tileset = Img_BattleTerrain_1E_Hasira1, .palette = gUnk_08FD2440 },
    { .abbr = "heichi1", .tileset = Img_BattleTerrain_00_Heichi1, .palette = gUnk_08FD2460 },
    { .abbr = "mori1", .tileset = Img_BattleTerrain_13_Mori1, .palette = gUnk_08FD2480 },
    { .abbr = "maruta1", .tileset = Img_BattleTerrain_55_Maruta1, .palette = gUnk_08FD24A0 },
    {
        .abbr = "fune1",
        .tileset = Img_BattleTerrain_68_Fune1,
        .palette = Pal_BattleTerrain_68_Fune1,
    },
    { .abbr = "mori1", .tileset = Img_BattleTerrain_13_Mori1, .palette = gUnk_08FD2DD8 },
};

SECTION(".rodata.08FD8008")
const struct BattleAnimCharaPal character_battle_animation_palette_table[] = {
    { .abbr = "lin", .pal = Pal_BanimChara_01_Lin },
    { .abbr = "rebacca", .pal = Pal_BanimChara_02_Rebacca },
    { .abbr = "will", .pal = Pal_BanimChara_03_Will },
    { .abbr = "boies", .pal = Pal_BanimChara_Boies },
    { .abbr = "bool", .pal = Pal_BanimChara_Bool },
    { .abbr = "bowker", .pal = Pal_BanimChara_Bowker },
    { .abbr = "eagler", .pal = Pal_BanimChara_Eagler },
    { .abbr = "osin", .pal = Pal_BanimChara_08_Osin },
    { .abbr = "wallace", .pal = Pal_BanimChara_09_Wallace },
    { .abbr = "wire", .pal = Pal_BanimChara_Wire },
    { .abbr = "yog", .pal = Pal_BanimChara_Yog },
    { .abbr = "jaffar", .pal = Pal_BanimChara_Jaffar },
    { .abbr = "jerme", .pal = Pal_BanimChara_Jerme },
    { .abbr = "lagarto", .pal = Pal_BanimChara_0E_Lagarto },
    { .abbr = "matthew", .pal = Pal_BanimChara_0F_Matthew },
    { .abbr = "batta", .pal = Pal_BanimChara_Batta },
    { .abbr = "bug", .pal = Pal_BanimChara_Bug },
    { .abbr = "carjiga", .pal = Pal_BanimChara_Carjiga },
    { .abbr = "migal", .pal = Pal_BanimChara_Migal },
    { .abbr = "zagan", .pal = Pal_BanimChara_Zagan },
    { .abbr = "zugu", .pal = Pal_BanimChara_Zugu },
    { .abbr = "hawkeye", .pal = Pal_BanimChara_Hawkeye },
    { .abbr = "serra", .pal = Pal_BanimChara_17_Serra },
    { .abbr = "kenneth", .pal = Pal_BanimChara_Kenneth },
    { .abbr = "renato", .pal = Pal_BanimChara_Renato },
    { .abbr = "ruthea", .pal = Pal_BanimChara_1A_Ruthea },
    { .abbr = "lin", .pal = Pal_BanimChara_1B_Lin },
    { .abbr = "haken", .pal = Pal_BanimChara_Haken },
    { .abbr = "kaim", .pal = Pal_BanimChara_Kaim },
    { .abbr = "leyvan", .pal = Pal_BanimChara_1E_Leyvan },
    { .abbr = "linus", .pal = Pal_BanimChara_Linus },
    { .abbr = "nils", .pal = Pal_BanimChara_Nils },
    { .abbr = "darts", .pal = Pal_BanimChara_21_Darts },
    { .abbr = "fergus", .pal = Pal_BanimChara_Fergus },
    { .abbr = "georg", .pal = Pal_BanimChara_Georg },
    { .abbr = "ninian", .pal = Pal_BanimChara_Ninian },
    { .abbr = "heath", .pal = Pal_BanimChara_25_Heath },
    { .abbr = "heath", .pal = Pal_BanimChara_26_Heath },
    { .abbr = "vaida", .pal = Pal_BanimChara_Vaida },
    { .abbr = "nergal", .pal = Pal_BanimChara_Nergal },
    { .abbr = "canas", .pal = Pal_BanimChara_29_Canas },
    { .abbr = "teodor", .pal = Pal_BanimChara_Teodor },
    { .abbr = "eliwod", .pal = Pal_BanimChara_2B_Eliwod },
    { .abbr = "farina", .pal = Pal_BanimChara_2C_Farina },
    { .abbr = "fiora", .pal = Pal_BanimChara_2D_Fiora },
    { .abbr = "flolina", .pal = Pal_BanimChara_2E_Flolina },
    { .abbr = "bartr", .pal = Pal_BanimChara_Bartr },
    { .abbr = "dorcas", .pal = Pal_BanimChara_30_Dorcas },
    { .abbr = "belnald", .pal = Pal_BanimChara_Belnald },
    { .abbr = "darren", .pal = Pal_BanimChara_Darren },
    { .abbr = "osin", .pal = Pal_BanimChara_33_Osin },
    { .abbr = "wallace", .pal = Pal_BanimChara_34_Wallace },
    { .abbr = "wranglen", .pal = Pal_BanimChara_Wranglen },
    { .abbr = "hector", .pal = Pal_BanimChara_36_Hector },
    { .abbr = "hector", .pal = Pal_BanimChara_37_Hector },
    { .abbr = "eliwod", .pal = Pal_BanimChara_38_Eliwod },
    { .abbr = "nino", .pal = Pal_BanimChara_39_Nino },
    { .abbr = "erk", .pal = Pal_BanimChara_3A_Erk },
    { .abbr = "beard", .pal = Pal_BanimChara_Beard },
    { .abbr = "glass", .pal = Pal_BanimChara_Glass },
    { .abbr = "leyvan", .pal = Pal_BanimChara_3D_Leyvan },
    { .abbr = "pson", .pal = Pal_BanimChara_Pson },
    { .abbr = "ruthea", .pal = Pal_BanimChara_3F_Ruthea },
    { .abbr = "guy", .pal = Pal_BanimChara_40_Guy },
    { .abbr = "ruth", .pal = Pal_BanimChara_41_Ruth },
    { .abbr = "siren", .pal = Pal_BanimChara_Siren },
    { .abbr = "ruth", .pal = Pal_BanimChara_43_Ruth },
    { .abbr = "uhai", .pal = Pal_BanimChara_Uhai },
    { .abbr = "isadora", .pal = Pal_BanimChara_Isadora },
    { .abbr = "camlann", .pal = Pal_BanimChara_Camlann },
    { .abbr = "damian", .pal = Pal_BanimChara_Damian },
    { .abbr = "ubands", .pal = Pal_BanimChara_Ubands },
    { .abbr = "kent", .pal = Pal_BanimChara_49_Kent },
    { .abbr = "lowen", .pal = Pal_BanimChara_4A_Lowen },
    { .abbr = "marcus", .pal = Pal_BanimChara_Marcus },
    { .abbr = "maxime", .pal = Pal_BanimChara_Maxime },
    { .abbr = "pascal", .pal = Pal_BanimChara_Pascal },
    { .abbr = "sain", .pal = Pal_BanimChara_4E_Sain },
    { .abbr = "farina", .pal = Pal_BanimChara_4F_Farina },
    { .abbr = "fiora", .pal = Pal_BanimChara_50_Fiora },
    { .abbr = "flolina", .pal = Pal_BanimChara_51_Flolina },
    { .abbr = "darts", .pal = Pal_BanimChara_52_Darts },
    { .abbr = "serra", .pal = Pal_BanimChara_53_Serra },
    { .abbr = "limstella", .pal = Pal_BanimChara_Limstella },
    { .abbr = "nino", .pal = Pal_BanimChara_55_Nino },
    { .abbr = "sonia", .pal = Pal_BanimChara_Sonia },
    { .abbr = "aion", .pal = Pal_BanimChara_Aion },
    { .abbr = "erk", .pal = Pal_BanimChara_58_Erk },
    { .abbr = "pant", .pal = Pal_BanimChara_Pant },
    { .abbr = "canas", .pal = Pal_BanimChara_5A_Canas },
    { .abbr = "hintz", .pal = Pal_BanimChara_Hintz },
    { .abbr = "zoldam", .pal = Pal_BanimChara_Zoldam },
    { .abbr = "luise", .pal = Pal_BanimChara_Luise },
    { .abbr = "rebacca", .pal = Pal_BanimChara_5E_Rebacca },
    { .abbr = "denning", .pal = Pal_BanimChara_Denning },
    { .abbr = "will", .pal = Pal_BanimChara_60_Will },
    { .abbr = "elic", .pal = Pal_BanimChara_Elic },
    { .abbr = "kent", .pal = Pal_BanimChara_62_Kent },
    { .abbr = "lowen", .pal = Pal_BanimChara_63_Lowen },
    { .abbr = "sain", .pal = Pal_BanimChara_64_Sain },
    { .abbr = "athos", .pal = Pal_BanimChara_Athos },
    { .abbr = "karla", .pal = Pal_BanimChara_Karla },
    { .abbr = "guy", .pal = Pal_BanimChara_67_Guy },
    { .abbr = "karel", .pal = Pal_BanimChara_Karel },
    { .abbr = "lloyd", .pal = Pal_BanimChara_Lloyd },
    { .abbr = "laila", .pal = Pal_BanimChara_Laila },
    { .abbr = "lagarto", .pal = Pal_BanimChara_6B_Lagarto },
    { .abbr = "matthew", .pal = Pal_BanimChara_6C_Matthew },
    { .abbr = "priscilla", .pal = Pal_BanimChara_6D_Priscilla },
    { .abbr = "priscilla", .pal = Pal_BanimChara_6E_Priscilla },
    { .abbr = "ursula", .pal = Pal_BanimChara_Ursula },
    { .abbr = "baltr", .pal = Pal_BanimChara_Baltr },
    { .abbr = "brendan", .pal = Pal_BanimChara_Brendan },
    { .abbr = "dorcas", .pal = Pal_BanimChara_72_Dorcas },
    { .abbr = "gaitz", .pal = Pal_BanimChara_Gaitz },
    { .abbr = "jasmine", .pal = Pal_BanimChara_Jasmine },
    { .abbr = "olg", .pal = Pal_BanimChara_Olg },
    { .abbr = "paul", .pal = Pal_BanimChara_Paul },
    { .abbr = "kishuna", .pal = Pal_BanimChara_Kishuna },
    { .abbr = "groznyi", .pal = Pal_BanimChara_Groznyi },
};
