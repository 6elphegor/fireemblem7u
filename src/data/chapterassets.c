#include "gbafe.h"

extern const u16 gUnk_08CE1D0C[], gUnk_08CE1D10[], gUnk_08CE1D14[], gUnk_08CE1D50[],
    gUnk_08CE1D5C[], gUnk_08CE1D68[], gUnk_08CE1DA8[], gUnk_08CE1DD0[], gUnk_08CE1E20[],
    gUnk_08CE1E40[], gUnk_08CE1E44[], gUnk_08CE1E60[], gUnk_08CE1E80[], gUnk_08CE1E84[],
    gUnk_08CE1EAC[], gUnk_08CE1EB0[], gUnk_08CE1EB4[], gUnk_08CE1F68[], gUnk_08CE1F78[],
    gUnk_08CE1F84[], gUnk_08CE1FB8[], gUnk_08CE1FBC[], gUnk_08CE1FC0[], gUnk_08CE1FCC[],
    gUnk_08CE1FD4[], gUnk_08CE1FDC[], gUnk_08CE2044[], gUnk_08CE2054[], gUnk_08CE207C[],
    gUnk_08CE208C[], gUnk_08CE20B4[], gUnk_08CE20C4[], gUnk_08CE20CC[], gUnk_08CE20D0[],
    gUnk_08CE2110[], gUnk_08CE212C[], gUnk_08CE2130[], gUnk_08CE2138[], gUnk_08CE213C[],
    gUnk_08CE2140[], gUnk_08CE2148[], gUnk_08CE214C[], gUnk_08CE2150[], gUnk_08CE21D0[],
    gUnk_08CE21E0[], gUnk_08CE2208[], gUnk_08CE2218[], gUnk_08CE222C[], gUnk_08CE2238[],
    gUnk_08CE2240[], gUnk_08CE2298[], gUnk_08CE229C[], gUnk_08CE22A4[], gUnk_08CE22B0[],
    gUnk_08CE22BC[], gUnk_08CE22C4[], gUnk_08CE22C8[], gUnk_08CE22D4[], gUnk_08CE22E8[],
    gUnk_08CE2364[], gUnk_08CE2374[], gUnk_08CE2388[], gUnk_08CE23C8[], gUnk_08CE23D0[],
    gUnk_08CE23D4[], gUnk_08CE23D8[], gUnk_08CE23DC[], gUnk_08CE2434[], gUnk_08CE2444[],
    gUnk_08CE2458[], gUnk_08CE2498[], gUnk_08CE249C[], gUnk_08CE24A0[], gUnk_08CE24A8[],
    gUnk_08CE24AC[], gUnk_08CE24B0[], gUnk_08CE24B4[], gUnk_08CE2540[], gUnk_08CE2544[],
    gUnk_08CE2548[], gUnk_08CE2594[], gUnk_08CE2684[], gUnk_08CE2780[], gUnk_08CE2820[],
    gUnk_08CE2824[], gUnk_08CE282C[], gUnk_08CE2864[], gUnk_08CE2870[], gUnk_08CE2898[],
    gUnk_08CE289C[], gUnk_08CE28A0[], gUnk_08CE28A4[], gUnk_08CE28A8[], gUnk_08CE290C[],
    gUnk_08CE2910[], gUnk_08CE291C[], gUnk_08CE2920[], gUnk_08CE292C[], gUnk_08CE2938[],
    gUnk_08CE293C[], gUnk_08CE2948[], gUnk_08CE2954[], gUnk_08CE2958[], gUnk_08CE295C[],
    gUnk_08CE2960[], gUnk_08CE2964[], gUnk_08CE2A34[], gUnk_08CE2A40[], gUnk_08CE2A4C[],
    gUnk_08CE2A58[], gUnk_08CE2A64[], gUnk_08CE2A68[], gUnk_08CE2A6C[], gUnk_08CE2AE8[],
    gUnk_08CE2AEC[], gUnk_08CE2AF0[], gUnk_08CE2AF4[], gUnk_08CE2AF8[], gUnk_08CE2AFC[],
    gUnk_08CE2B64[], gUnk_08CE2B68[], gUnk_08CE2B80[], gUnk_08CE2B84[], gUnk_08CE2B88[],
    gUnk_08CE2B8C[], gUnk_08CE2B90[], gUnk_08CE2B94[], gUnk_08CE2B9C[], gUnk_08CE2BA4[],
    gUnk_08CE2BAC[], gUnk_08CE2BB4[], gUnk_08CE2BBC[], gUnk_08CE2BC4[], gUnk_08CE2BCC[],
    gUnk_08CE2BD4[], gUnk_08CE2BDC[], gUnk_08CE2BE4[], gUnk_08CE2BF0[], gUnk_08CE2CFC[],
    gUnk_08CE2D0C[], gUnk_08CE2D20[], gUnk_08CE2D24[], gUnk_08CE2D78[], gUnk_08CE2D84[],
    gUnk_08CE2D90[], gUnk_08CE2D9C[], gUnk_08CE2DA0[], gUnk_08CE2DF8[], gUnk_08CE2E08[],
    gUnk_08CE2E30[], gUnk_08CE2E40[], gUnk_08CE2E68[], gUnk_08CE2E6C[], gUnk_08CE2E70[],
    gUnk_08CE2E74[], gUnk_08CE2ECC[], gUnk_08CE2F9C[], gUnk_08CE2FF0[], gUnk_08CE302C[],
    gUnk_08CE3074[], gUnk_08CE30B0[], gUnk_08CE3170[], gUnk_08CE3174[], gUnk_08CE31FC[],
    gUnk_08CE3200[], gUnk_08CE3204[], gUnk_08CE3208[], gUnk_08CE320C[], gUnk_08CE328C[],
    gUnk_08CE3290[], gUnk_08CE3294[], gUnk_08CE3298[], gUnk_08CE32A0[], gUnk_08CE32A4[],
    gUnk_08CE32AC[], gUnk_08CE32B4[], gUnk_08CE32C0[], gUnk_08CE32D0[], gUnk_08CE32E4[],
    gUnk_08CE32E8[], gUnk_08CE32F0[], gUnk_08CE32F4[], gUnk_08CE32FC[], gUnk_08CE3304[],
    gUnk_08CE3308[], gUnk_08CE330C[], gUnk_08CE3318[], gUnk_08CE3324[], gUnk_08CE3328[],
    gUnk_08CE3330[], gUnk_08CE3334[], gUnk_08CE3338[], gUnk_08CE333C[], gUnk_08CE3340[],
    gUnk_08CE3344[], gUnk_08CE3360[], gUnk_08CE3380[], gUnk_08CE3398[], gUnk_08CE33B0[],
    gUnk_08CE33BC[], gUnk_08CE33C8[], gUnk_08CE33D0[], gUnk_08CE33D8[], gUnk_08CE33F4[],
    gUnk_08CE3414[], gUnk_08CE3418[], gUnk_08CE3620[], gUnk_08CE3630[], gUnk_08CE3658[],
    gUnk_08CE365C[], gUnk_08CE3660[], gUnk_08CE36AC[], gUnk_08CE36B0[], gUnk_08CE36E4[],
    gUnk_08CE36E8[], gUnk_08CE36F0[], gUnk_08CE36F4[], gUnk_08CE36F8[], gUnk_08CE3760[],
    gUnk_08CE376C[], gUnk_08CE3778[], gUnk_08CE3784[], gUnk_08CE3788[], gUnk_08CE378C[],
    gUnk_08CE3808[], gUnk_08CE380C[], gUnk_08CE3840[], gUnk_08CE3900[], gUnk_08CE391C[],
    gUnk_08CE393C[], gUnk_08CE3958[], gUnk_08CE3978[], gUnk_08CE3994[], gUnk_08CE3A14[],
    gUnk_08CE3A24[], gUnk_08CE3A5C[], gUnk_08CE3A78[];

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 ChapterEvents_Ch00[];
extern const u8 ChapterEvents_Ch01[];
extern const u8 ChapterEvents_Ch02[];
extern const u8 ChapterEvents_Ch03[];
extern const u8 ChapterEvents_Ch04[];
extern const u8 ChapterEvents_Ch05[];
extern const u8 ChapterEvents_Ch06[];
extern const u8 ChapterEvents_Ch07[];
extern const u8 ChapterEvents_Ch08[];
extern const u8 ChapterEvents_Ch09[];
extern const u8 ChapterEvents_Ch0A[];
extern const u8 ChapterEvents_Ch0B[];
extern const u8 ChapterEvents_Ch0C[];
extern const u8 ChapterEvents_Ch0D[];
extern const u8 ChapterEvents_Ch0E[];
extern const u8 ChapterEvents_Ch0F[];
extern const u8 ChapterEvents_Ch10[];
extern const u8 ChapterEvents_Ch11[];
extern const u8 ChapterEvents_Ch12[];
extern const u8 ChapterEvents_Ch13[];
extern const u8 ChapterEvents_Ch14[];
extern const u8 ChapterEvents_Ch15[];
extern const u8 ChapterEvents_Ch16[];
extern const u8 ChapterEvents_Ch17[];
extern const u8 ChapterEvents_Ch18[];
extern const u8 ChapterEvents_Ch19[];
extern const u8 ChapterEvents_Ch1A[];
extern const u8 ChapterEvents_Ch1B[];
extern const u8 ChapterEvents_Ch1C[];
extern const u8 ChapterEvents_Ch1D[];
extern const u8 ChapterEvents_Ch1E[];
extern const u8 ChapterEvents_Ch1F[];
extern const u8 ChapterEvents_Ch20[];
extern const u8 ChapterEvents_Ch21[];
extern const u8 ChapterEvents_Ch22[];
extern const u8 ChapterEvents_Ch23[];
extern const u8 ChapterEvents_Ch24[];
extern const u8 ChapterEvents_Ch25[];
extern const u8 ChapterEvents_Ch26[];
extern const u8 ChapterEvents_Ch27[];
extern const u8 ChapterEvents_Ch28[];
extern const u8 ChapterEvents_Ch29[];
extern const u8 ChapterEvents_Ch2A[];
extern const u8 ChapterEvents_Ch2B[];
extern const u8 ChapterEvents_Ch2C[];
extern const u8 ChapterEvents_Ch2D[];
extern const u8 ChapterEvents_Ch2E[];
extern const u8 ChapterEvents_Ch2F[];
extern const u8 ChapterEvents_Ch30[];
extern const u8 ChapterEvents_Ch31[];
extern const u8 ChapterEvents_Ch32[];
extern const u8 ChapterEvents_Ch33[];
extern const u8 ChapterEvents_Ch34[];
extern const u8 ChapterEvents_Ch35[];
extern const u8 ChapterEvents_Ch36[];
extern const u8 ChapterEvents_Ch37[];
extern const u8 ChapterEvents_Ch38[];
extern const u8 ChapterEvents_Ch39[];
extern const u8 ChapterEvents_Ch3A[];
extern const u8 ChapterEvents_Ch3B[];
extern const u8 ChapterEvents_Ch3C[];
extern const u8 ChapterEvents_Ch3D[];
extern const u8 ChapterEvents_Ch3E[];
extern const u8 ChapterEvents_Ch3F[];
extern const u8 ChapterEvents_Ch40[];
extern const u8 ChapterEvents_Ch42[];
extern const u8 Img_MapObj_C1[];
extern const u8 Img_MapObj_AE[];
extern const u8 Img_MapObj_A7[];
extern const u8 Img_MapObj_91[];
extern const u8 Img_MapObj_7B[];
extern const u8 Img_MapObj_6A[];
extern const u8 Img_MapObj_5B[];
extern const u8 Img_MapObj_16[];
extern const u8 Img_MapObj_10[];
extern const u8 Img_MapObj_0A[];
extern const u8 Img_MapObj_01[];
extern const u8 TileConfig_C3[];
extern const u8 TileConfig_B0[];
extern const u8 TileConfig_A9[];
extern const u8 TileConfig_93[];
extern const u8 TileConfig_7D[];
extern const u8 TileConfig_6C[];
extern const u8 TileConfig_5D[];
extern const u8 TileConfig_1F[];
extern const u8 TileConfig_18[];
extern const u8 TileConfig_12[];
extern const u8 TileConfig_0C[];
extern const u8 TileConfig_03[];
extern const u8 Pal_Map_Ch3D[];
extern const u8 Pal_Map_Ch3A[];
extern const u8 Pal_Map_Ch37[];
extern const u8 Pal_Map_Ch35[];
extern const u8 Pal_Map_Ch30[];
extern const u8 Pal_Map_Ch2E[];
extern const u8 Pal_Map_Ch2D[];
extern const u8 Pal_Map_Ch2B[];
extern const u8 Pal_Map_Ch29[];
extern const u8 Pal_Map_Ch28[];
extern const u8 Pal_Map_Ch26[];
extern const u8 Pal_Map_Ch25[];
extern const u8 Pal_Map_Ch23[];
extern const u8 Pal_Map_Ch21[];
extern const u8 Pal_Map_Ch1E[];
extern const u8 Pal_Map_Ch1D[];
extern const u8 Pal_Map_Ch1C[];
extern const u8 Pal_Map_Ch1B[];
extern const u8 Pal_Map_Ch19[];
extern const u8 Pal_Map_Ch18[];
extern const u8 Pal_Map_Ch17[];
extern const u8 Pal_Map_Ch16[];
extern const u8 Pal_Map_Ch15[];
extern const u8 Pal_Map_Ch14[];
extern const u8 Pal_Map_Ch11[];
extern const u8 Pal_Map_Ch10[];
extern const u8 Pal_Map_Ch0D[];
extern const u8 Pal_Map_Ch0B[];
extern const u8 Pal_Map_Ch08[];
extern const u8 Pal_Map_Ch06[];
extern const u8 Pal_Map_Ch05[];
extern const u8 Pal_Map_Ch04[];
extern const u8 Pal_Map_Ch03[];
extern const u8 Pal_Map_Ch02[];
extern const u8 Pal_Map_Ch01[];
extern const u8 Pal_Map_Ch00[];
extern const u8 MapLayout_Ch42[];
extern const u8 MapLayout_Ch41[];
extern const u8 MapLayout_Ch40[];
extern const u8 MapLayout_Ch3F[];
extern const u8 MapLayout_Ch3E[];
extern const u8 MapLayout_Ch3D[];
extern const u8 MapLayout_Ch3C[];
extern const u8 MapLayout_Ch3B[];
extern const u8 MapLayout_Ch3A[];
extern const u8 MapLayout_Ch39[];
extern const u8 MapLayout_Ch38[];
extern const u8 MapLayout_Ch37[];
extern const u8 MapLayout_Ch36[];
extern const u8 MapLayout_Ch35[];
extern const u8 MapLayout_Ch34[];
extern const u8 MapLayout_Ch33[];
extern const u8 MapLayout_Ch32[];
extern const u8 MapLayout_Ch31[];
extern const u8 MapLayout_Ch30[];
extern const u8 MapLayout_Ch2F[];
extern const u8 MapLayout_Ch2E[];
extern const u8 MapLayout_Ch2D[];
extern const u8 MapLayout_Ch2C[];
extern const u8 MapLayout_Ch2B[];
extern const u8 MapLayout_Ch2A[];
extern const u8 MapLayout_Ch29[];
extern const u8 MapLayout_Ch28[];
extern const u8 MapLayout_Ch27[];
extern const u8 MapLayout_Ch26[];
extern const u8 MapLayout_Ch25[];
extern const u8 MapLayout_Ch24[];
extern const u8 MapLayout_Ch23[];
extern const u8 MapLayout_Ch22[];
extern const u8 MapLayout_Ch21[];
extern const u8 MapLayout_Ch20[];
extern const u8 MapLayout_Ch1F[];
extern const u8 MapLayout_Ch1E[];
extern const u8 MapLayout_Ch1D[];
extern const u8 MapLayout_Ch1C[];
extern const u8 MapLayout_Ch1B[];
extern const u8 MapLayout_Ch1A[];
extern const u8 MapLayout_Ch19[];
extern const u8 MapLayout_Ch18[];
extern const u8 MapLayout_Ch17[];
extern const u8 MapLayout_Ch16[];
extern const u8 MapLayout_Ch15[];
extern const u8 MapLayout_Ch14[];
extern const u8 MapLayout_Ch13[];
extern const u8 MapLayout_Ch12[];
extern const u8 MapLayout_Ch11[];
extern const u8 MapLayout_Ch10[];
extern const u8 MapLayout_Ch0F[];
extern const u8 MapLayout_Ch0E[];
extern const u8 MapLayout_Ch0D[];
extern const u8 MapLayout_Ch0C[];
extern const u8 MapLayout_Ch0B[];
extern const u8 MapLayout_Ch0A[];
extern const u8 MapLayout_Ch09[];
extern const u8 MapLayout_Ch08[];
extern const u8 MapLayout_Ch07[];
extern const u8 MapLayout_Ch06[];
extern const u8 MapLayout_Ch05[];
extern const u8 MapLayout_Ch04[];
extern const u8 MapLayout_Ch03[];
extern const u8 MapLayout_Ch02[];
extern const u8 MapLayout_Ch01[];
extern const u8 MapLayout_Ch00[];
extern const u8 Img_MapObj_1C[];
extern const u8 Img_MapObj_1D_B[];
extern const struct TileGfxAnim TileGfxAnim_08B95D38[];
extern const struct TileGfxAnim TileGfxAnim_08B95DC0[];
extern const struct TileGfxAnim TileGfxAnim_08B95E08[];
extern const struct TileGfxAnim TileGfxAnim_08B95F50[];
extern const struct TileGfxAnim TileGfxAnim_08B95F98[];
extern const struct TilePalAnim TilePalAnim_08B95FE0[];
extern const struct TilePalAnim TilePalAnim_08B960A0[];
extern const struct MapChange MapChanges_Ch02[];
extern const struct MapChange MapChanges_Ch03[];
extern const struct MapChange MapChanges_Ch04[];
extern const struct MapChange MapChanges_Ch06[];
extern const struct MapChange MapChanges_Ch07[];
extern const struct MapChange MapChanges_Ch08[];
extern const struct MapChange MapChanges_Ch09[];
extern const struct MapChange MapChanges_Ch0A[];
extern const struct MapChange MapChanges_Ch0B[];
extern const struct MapChange MapChanges_Ch0C[];
extern const struct MapChange MapChanges_Ch0D[];
extern const struct MapChange MapChanges_Ch0E[];
extern const struct MapChange MapChanges_Ch0F[];
extern const struct MapChange MapChanges_Ch10[];
extern const struct MapChange MapChanges_Ch11[];
extern const struct MapChange MapChanges_Ch12[];
extern const struct MapChange MapChanges_Ch13[];
extern const struct MapChange MapChanges_Ch14[];
extern const struct MapChange MapChanges_Ch15[];
extern const struct MapChange MapChanges_Ch16[];
extern const struct MapChange MapChanges_Ch17[];
extern const struct MapChange MapChanges_Ch18[];
extern const struct MapChange MapChanges_Ch19[];
extern const struct MapChange MapChanges_Ch1A[];
extern const struct MapChange MapChanges_Ch1B[];
extern const struct MapChange MapChanges_Ch1C[];
extern const struct MapChange MapChanges_Ch1E[];
extern const struct MapChange MapChanges_Ch1F[];
extern const struct MapChange MapChanges_Ch20[];
extern const struct MapChange MapChanges_Ch21[];
extern const struct MapChange MapChanges_Ch22[];
extern const struct MapChange MapChanges_Ch23[];
extern const struct MapChange MapChanges_Ch24[];
extern const struct MapChange MapChanges_Ch25[];
extern const struct MapChange MapChanges_Ch26[];
extern const struct MapChange MapChanges_Ch27[];
extern const struct MapChange MapChanges_Ch28[];
extern const struct MapChange MapChanges_Ch29[];
extern const struct MapChange MapChanges_Ch2A[];
extern const struct MapChange MapChanges_Ch2C[];
extern const struct MapChange MapChanges_Ch2D[];
extern const struct MapChange MapChanges_Ch2E[];
extern const struct MapChange MapChanges_Ch2F[];
extern const struct MapChange MapChanges_Ch31[];
extern const struct MapChange MapChanges_Ch40[];
extern const u8 gUnk_08CE791C[];
extern const u8 gUnk_08CE7920[];
extern const u8 gUnk_08CE7AC0[];
extern const u8 gUnk_08CE7BB4[];
extern const u8 gUnk_08CE7E1C[];
extern const u8 gUnk_08CE7F30[];
extern const u8 gUnk_08CE8078[];
extern const u8 gUnk_08CE821C[];
extern const u8 gUnk_08CE833C[];
extern const u8 gUnk_08CE84C8[];
extern const u8 gUnk_08CE8618[];
extern const u8 gUnk_08CE8894[];
extern const u8 gUnk_08CE89EC[];
extern const u8 gUnk_08CE8D50[];
extern const u8 gUnk_08CE8FAC[];
extern const u8 gUnk_08CE9200[];
extern const u8 gUnk_08CE9408[];
extern const u8 gUnk_08CE9BF8[];
extern const u8 gUnk_08CE9DD4[];
extern const u8 gUnk_08CE9F88[];
extern const u8 gUnk_08CEA10C[];
extern const u8 gUnk_08CEA754[];
extern const u8 gUnk_08CEA8C8[];
extern const u8 gUnk_08CEAA5C[];
extern const u8 gUnk_08CEAC48[];
extern const u8 gUnk_08CEAEA0[];
extern const u8 gUnk_08CEB0E8[];
extern const u8 gUnk_08CEB3AC[];
extern const u8 gUnk_08CEB67C[];
extern const u8 gUnk_08CEB94C[];
extern const u8 gUnk_08CEBD20[];
extern const u8 gUnk_08CEBF5C[];
extern const u8 gUnk_08CEC198[];
extern const u8 gUnk_08CEC3F8[];
extern const u8 gUnk_08CEC5B4[];
extern const u8 gUnk_08CEC96C[];
extern const u8 gUnk_08CECA24[];
extern const u8 gUnk_08CECBB0[];
extern const u8 gUnk_08CECDD8[];
extern const u8 gUnk_08CECF0C[];
extern const u8 gUnk_08CED038[];
extern const u8 gUnk_08CED188[];
extern const u8 gUnk_08CED478[];
extern const u8 gUnk_08CED554[];

// Generated by tools/gen_data_tables.py

// Map graphics, palettes, tilesets, layouts, tile/palette animations,
// map changes and event data, indexed by ChapterInfo::asset_* and
// ChapterInfo::mapEventDataId.
CONST_DATA void const * gChapterDataAssetTable[] = {
    [0x00] = NULL,
    [0x01] = (void const *) Img_MapObj_01, // img_a: CHAPTER_00, CHAPTER_01
    [0x02] = (void const *) Pal_Map_Ch00, // pal: CHAPTER_00
    [0x03] = (void const *) TileConfig_03, // tileset: CHAPTER_00, CHAPTER_01
    [0x04] = (void const *) MapLayout_Ch00, // map: CHAPTER_00
    [0x05] = (void const *) TileGfxAnim_08B95D38, // img_anims: CHAPTER_00, CHAPTER_01, CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_27, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x06] = (void const *) ChapterEvents_Ch00, // events: CHAPTER_00
    [0x07] = (void const *) Pal_Map_Ch01, // pal: CHAPTER_01
    [0x08] = (void const *) MapLayout_Ch01, // map: CHAPTER_01
    [0x09] = (void const *) ChapterEvents_Ch01, // events: CHAPTER_01
    [0x0A] = (void const *) Img_MapObj_0A, // img_a: CHAPTER_02, CHAPTER_08, CHAPTER_0D, CHAPTER_12, CHAPTER_14, CHAPTER_1E, CHAPTER_25, CHAPTER_26, CHAPTER_2A, 0x31, 0x32, 0x37, 0x38, 0x3F
    [0x0B] = (void const *) Pal_Map_Ch02, // pal: CHAPTER_02
    [0x0C] = (void const *) TileConfig_0C, // tileset: CHAPTER_02, CHAPTER_08, CHAPTER_0D, CHAPTER_12, CHAPTER_14, CHAPTER_1E, CHAPTER_25, CHAPTER_26, CHAPTER_2A, 0x31, 0x32, 0x37, 0x38, 0x3F
    [0x0D] = (void const *) MapLayout_Ch02, // map: CHAPTER_02
    [0x0E] = (void const *) MapChanges_Ch02, // map_changes: CHAPTER_02
    [0x0F] = (void const *) ChapterEvents_Ch02, // events: CHAPTER_02
    [0x10] = (void const *) Img_MapObj_10, // img_a: CHAPTER_03, CHAPTER_06, CHAPTER_15, CHAPTER_1B, CHAPTER_20, CHAPTER_2B, 0x30, 0x39, 0x3D
    [0x11] = (void const *) Pal_Map_Ch03, // pal: CHAPTER_03
    [0x12] = (void const *) TileConfig_12, // tileset: CHAPTER_03, CHAPTER_06, CHAPTER_15, CHAPTER_1B, CHAPTER_20, CHAPTER_2B, 0x30, 0x39, 0x3D
    [0x13] = (void const *) MapLayout_Ch03, // map: CHAPTER_03
    [0x14] = (void const *) MapChanges_Ch03, // map_changes: CHAPTER_03
    [0x15] = (void const *) ChapterEvents_Ch03, // events: CHAPTER_03
    [0x16] = (void const *) Img_MapObj_16, // img_a: CHAPTER_04, CHAPTER_1C, 0x36, 0x41
    [0x17] = (void const *) Pal_Map_Ch04, // pal: CHAPTER_04
    [0x18] = (void const *) TileConfig_18, // tileset: CHAPTER_04, CHAPTER_1C, 0x36, 0x41
    [0x19] = (void const *) MapLayout_Ch04, // map: CHAPTER_04
    [0x1A] = (void const *) MapChanges_Ch04, // map_changes: CHAPTER_04
    [0x1B] = (void const *) ChapterEvents_Ch04, // events: CHAPTER_04
    [0x1C] = (void const *) Img_MapObj_1C, // img_a: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x1D] = (void const *) Img_MapObj_1D_B, // img_b: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x1E] = (void const *) Pal_Map_Ch05, // pal: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_13, CHAPTER_1F, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3C, 0x3E, 0x42
    [0x1F] = (void const *) TileConfig_1F, // tileset: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x20] = (void const *) MapLayout_Ch05, // map: CHAPTER_05
    [0x21] = (void const *) ChapterEvents_Ch05, // events: CHAPTER_05
    [0x22] = (void const *) Pal_Map_Ch06, // pal: CHAPTER_06
    [0x23] = (void const *) MapLayout_Ch06, // map: CHAPTER_06
    [0x24] = (void const *) MapChanges_Ch06, // map_changes: CHAPTER_06
    [0x25] = (void const *) ChapterEvents_Ch06, // events: CHAPTER_06
    [0x26] = (void const *) MapLayout_Ch07, // map: CHAPTER_07
    [0x27] = (void const *) MapChanges_Ch07, // map_changes: CHAPTER_07
    [0x28] = (void const *) ChapterEvents_Ch07, // events: CHAPTER_07
    [0x29] = (void const *) Pal_Map_Ch08, // pal: CHAPTER_08, 0x31
    [0x2A] = (void const *) MapLayout_Ch08, // map: CHAPTER_08
    [0x2B] = (void const *) MapChanges_Ch08, // map_changes: CHAPTER_08
    [0x2C] = (void const *) ChapterEvents_Ch08, // events: CHAPTER_08
    [0x2D] = (void const *) MapLayout_Ch09, // map: CHAPTER_09
    [0x2E] = (void const *) MapChanges_Ch09, // map_changes: CHAPTER_09
    [0x2F] = (void const *) ChapterEvents_Ch09, // events: CHAPTER_09
    [0x30] = (void const *) MapLayout_Ch0A, // map: CHAPTER_0A
    [0x31] = (void const *) MapChanges_Ch0A, // map_changes: CHAPTER_0A
    [0x32] = (void const *) ChapterEvents_Ch0A, // events: CHAPTER_0A
    [0x33] = (void const *) Pal_Map_Ch0B, // pal: CHAPTER_0B
    [0x34] = (void const *) MapLayout_Ch0B, // map: CHAPTER_0B
    [0x35] = (void const *) MapChanges_Ch0B, // map_changes: CHAPTER_0B
    [0x36] = (void const *) ChapterEvents_Ch0B, // events: CHAPTER_0B
    [0x37] = (void const *) MapLayout_Ch0C, // map: CHAPTER_0C
    [0x38] = (void const *) MapChanges_Ch0C, // map_changes: CHAPTER_0C
    [0x39] = (void const *) ChapterEvents_Ch0C, // events: CHAPTER_0C
    [0x3A] = (void const *) Pal_Map_Ch0D, // pal: CHAPTER_0D, CHAPTER_12, CHAPTER_2A, 0x32, 0x38, 0x3F
    [0x3B] = (void const *) MapLayout_Ch0D, // map: CHAPTER_0D
    [0x3C] = (void const *) MapChanges_Ch0D, // map_changes: CHAPTER_0D
    [0x3D] = (void const *) ChapterEvents_Ch0D, // events: CHAPTER_0D
    [0x3E] = (void const *) MapLayout_Ch0E, // map: CHAPTER_0E
    [0x3F] = (void const *) MapChanges_Ch0E, // map_changes: CHAPTER_0E
    [0x40] = (void const *) ChapterEvents_Ch0E, // events: CHAPTER_0E
    [0x41] = (void const *) MapLayout_Ch0F, // map: CHAPTER_0F
    [0x42] = (void const *) MapChanges_Ch0F, // map_changes: CHAPTER_0F
    [0x43] = (void const *) ChapterEvents_Ch0F, // events: CHAPTER_0F
    [0x44] = (void const *) Pal_Map_Ch10, // pal: CHAPTER_10
    [0x45] = (void const *) MapLayout_Ch10, // map: CHAPTER_10
    [0x46] = (void const *) MapChanges_Ch10, // map_changes: CHAPTER_10
    [0x47] = (void const *) ChapterEvents_Ch10, // events: CHAPTER_10
    [0x48] = (void const *) Pal_Map_Ch11, // pal: CHAPTER_11
    [0x49] = (void const *) MapLayout_Ch11, // map: CHAPTER_11
    [0x4A] = (void const *) MapChanges_Ch11, // map_changes: CHAPTER_11
    [0x4B] = (void const *) ChapterEvents_Ch11, // events: CHAPTER_11
    [0x4C] = (void const *) MapLayout_Ch12, // map: CHAPTER_12
    [0x4D] = (void const *) MapChanges_Ch12, // map_changes: CHAPTER_12
    [0x4E] = (void const *) ChapterEvents_Ch12, // events: CHAPTER_12
    [0x4F] = (void const *) MapLayout_Ch13, // map: CHAPTER_13
    [0x50] = (void const *) MapChanges_Ch13, // map_changes: CHAPTER_13
    [0x51] = (void const *) ChapterEvents_Ch13, // events: CHAPTER_13
    [0x52] = (void const *) Pal_Map_Ch14, // pal: CHAPTER_14
    [0x53] = (void const *) MapLayout_Ch14, // map: CHAPTER_14
    [0x54] = (void const *) MapChanges_Ch14, // map_changes: CHAPTER_14
    [0x55] = (void const *) ChapterEvents_Ch14, // events: CHAPTER_14
    [0x56] = (void const *) Pal_Map_Ch15, // pal: CHAPTER_15, CHAPTER_20
    [0x57] = (void const *) MapLayout_Ch15, // map: CHAPTER_15
    [0x58] = (void const *) TileGfxAnim_08B95E08, // img_anims: CHAPTER_15, CHAPTER_1B, CHAPTER_20, CHAPTER_2B, 0x39, 0x3D
    [0x59] = (void const *) MapChanges_Ch15, // map_changes: CHAPTER_15
    [0x5A] = (void const *) ChapterEvents_Ch15, // events: CHAPTER_15
    [0x5B] = (void const *) Img_MapObj_5B, // img_a: CHAPTER_16
    [0x5C] = (void const *) Pal_Map_Ch16, // pal: CHAPTER_16
    [0x5D] = (void const *) TileConfig_5D, // tileset: CHAPTER_16
    [0x5E] = (void const *) MapLayout_Ch16, // map: CHAPTER_16
    [0x5F] = (void const *) TileGfxAnim_08B95DC0, // img_anims: CHAPTER_16
    [0x60] = (void const *) MapChanges_Ch16, // map_changes: CHAPTER_16
    [0x61] = (void const *) ChapterEvents_Ch16, // events: CHAPTER_16
    [0x62] = (void const *) Pal_Map_Ch17, // pal: CHAPTER_17
    [0x63] = (void const *) MapLayout_Ch17, // map: CHAPTER_17
    [0x64] = (void const *) MapChanges_Ch17, // map_changes: CHAPTER_17
    [0x65] = (void const *) ChapterEvents_Ch17, // events: CHAPTER_17
    [0x66] = (void const *) Pal_Map_Ch18, // pal: CHAPTER_18
    [0x67] = (void const *) MapLayout_Ch18, // map: CHAPTER_18
    [0x68] = (void const *) MapChanges_Ch18, // map_changes: CHAPTER_18
    [0x69] = (void const *) ChapterEvents_Ch18, // events: CHAPTER_18
    [0x6A] = (void const *) Img_MapObj_6A, // img_a: CHAPTER_19, CHAPTER_1A, CHAPTER_27, CHAPTER_2D, 0x35
    [0x6B] = (void const *) Pal_Map_Ch19, // pal: CHAPTER_19, CHAPTER_1A, CHAPTER_27
    [0x6C] = (void const *) TileConfig_6C, // tileset: CHAPTER_19, CHAPTER_1A, CHAPTER_27, CHAPTER_2D, 0x35
    [0x6D] = (void const *) MapLayout_Ch19, // map: CHAPTER_19
    [0x6E] = (void const *) MapChanges_Ch19, // map_changes: CHAPTER_19
    [0x6F] = (void const *) ChapterEvents_Ch19, // events: CHAPTER_19
    [0x70] = (void const *) MapLayout_Ch1A, // map: CHAPTER_1A
    [0x71] = (void const *) MapChanges_Ch1A, // map_changes: CHAPTER_1A
    [0x72] = (void const *) ChapterEvents_Ch1A, // events: CHAPTER_1A
    [0x73] = (void const *) Pal_Map_Ch1B, // pal: CHAPTER_1B
    [0x74] = (void const *) MapLayout_Ch1B, // map: CHAPTER_1B
    [0x75] = (void const *) MapChanges_Ch1B, // map_changes: CHAPTER_1B
    [0x76] = (void const *) ChapterEvents_Ch1B, // events: CHAPTER_1B
    [0x77] = (void const *) Pal_Map_Ch1C, // pal: CHAPTER_1C, 0x36, 0x41
    [0x78] = (void const *) MapLayout_Ch1C, // map: CHAPTER_1C
    [0x79] = (void const *) MapChanges_Ch1C, // map_changes: CHAPTER_1C
    [0x7A] = (void const *) ChapterEvents_Ch1C, // events: CHAPTER_1C
    [0x7B] = (void const *) Img_MapObj_7B, // img_a: CHAPTER_1D
    [0x7C] = (void const *) Pal_Map_Ch1D, // pal: CHAPTER_1D
    [0x7D] = (void const *) TileConfig_7D, // tileset: CHAPTER_1D
    [0x7E] = (void const *) MapLayout_Ch1D, // map: CHAPTER_1D
    [0x7F] = (void const *) ChapterEvents_Ch1D, // events: CHAPTER_1D
    [0x80] = (void const *) Pal_Map_Ch1E, // pal: CHAPTER_1E
    [0x81] = (void const *) MapLayout_Ch1E, // map: CHAPTER_1E
    [0x82] = (void const *) MapChanges_Ch1E, // map_changes: CHAPTER_1E
    [0x83] = (void const *) ChapterEvents_Ch1E, // events: CHAPTER_1E
    [0x84] = (void const *) MapLayout_Ch1F, // map: CHAPTER_1F
    [0x85] = (void const *) MapChanges_Ch1F, // map_changes: CHAPTER_1F
    [0x86] = (void const *) ChapterEvents_Ch1F, // events: CHAPTER_1F
    [0x87] = (void const *) MapLayout_Ch20, // map: CHAPTER_20
    [0x88] = (void const *) MapChanges_Ch20, // map_changes: CHAPTER_20
    [0x89] = (void const *) ChapterEvents_Ch20, // events: CHAPTER_20
    [0x8A] = (void const *) Pal_Map_Ch21, // pal: CHAPTER_21
    [0x8B] = (void const *) MapLayout_Ch21, // map: CHAPTER_21
    [0x8C] = (void const *) MapChanges_Ch21, // map_changes: CHAPTER_21
    [0x8D] = (void const *) ChapterEvents_Ch21, // events: CHAPTER_21
    [0x8E] = (void const *) MapLayout_Ch22, // map: CHAPTER_22
    [0x8F] = (void const *) MapChanges_Ch22, // map_changes: CHAPTER_22
    [0x90] = (void const *) ChapterEvents_Ch22, // events: CHAPTER_22
    [0x91] = (void const *) Img_MapObj_91, // img_a: CHAPTER_23, CHAPTER_24, 0x3B
    [0x92] = (void const *) Pal_Map_Ch23, // pal: CHAPTER_23, CHAPTER_24, 0x3B
    [0x93] = (void const *) TileConfig_93, // tileset: CHAPTER_23, CHAPTER_24, 0x3B
    [0x94] = (void const *) MapLayout_Ch23, // map: CHAPTER_23
    [0x95] = (void const *) MapChanges_Ch23, // map_changes: CHAPTER_23
    [0x96] = (void const *) ChapterEvents_Ch23, // events: CHAPTER_23
    [0x97] = (void const *) MapLayout_Ch24, // map: CHAPTER_24
    [0x98] = (void const *) TilePalAnim_08B95FE0, // pal_anims: CHAPTER_24
    [0x99] = (void const *) MapChanges_Ch24, // map_changes: CHAPTER_24
    [0x9A] = (void const *) ChapterEvents_Ch24, // events: CHAPTER_24
    [0x9B] = (void const *) Pal_Map_Ch25, // pal: CHAPTER_25
    [0x9C] = (void const *) MapLayout_Ch25, // map: CHAPTER_25
    [0x9D] = (void const *) MapChanges_Ch25, // map_changes: CHAPTER_25
    [0x9E] = (void const *) ChapterEvents_Ch25, // events: CHAPTER_25
    [0x9F] = (void const *) Pal_Map_Ch26, // pal: CHAPTER_26
    [0xA0] = (void const *) MapLayout_Ch26, // map: CHAPTER_26
    [0xA1] = (void const *) TileGfxAnim_08B95F98, // img_anims: CHAPTER_26, 0x37
    [0xA2] = (void const *) MapChanges_Ch26, // map_changes: CHAPTER_26
    [0xA3] = (void const *) ChapterEvents_Ch26, // events: CHAPTER_26
    [0xA4] = (void const *) MapLayout_Ch27, // map: CHAPTER_27
    [0xA5] = (void const *) MapChanges_Ch27, // map_changes: CHAPTER_27
    [0xA6] = (void const *) ChapterEvents_Ch27, // events: CHAPTER_27
    [0xA7] = (void const *) Img_MapObj_A7, // img_a: CHAPTER_28
    [0xA8] = (void const *) Pal_Map_Ch28, // pal: CHAPTER_28
    [0xA9] = (void const *) TileConfig_A9, // tileset: CHAPTER_28
    [0xAA] = (void const *) MapLayout_Ch28, // map: CHAPTER_28
    [0xAB] = (void const *) TilePalAnim_08B960A0, // pal_anims: CHAPTER_28
    [0xAC] = (void const *) MapChanges_Ch28, // map_changes: CHAPTER_28
    [0xAD] = (void const *) ChapterEvents_Ch28, // events: CHAPTER_28
    [0xAE] = (void const *) Img_MapObj_AE, // img_a: CHAPTER_29
    [0xAF] = (void const *) Pal_Map_Ch29, // pal: CHAPTER_29
    [0xB0] = (void const *) TileConfig_B0, // tileset: CHAPTER_29
    [0xB1] = (void const *) MapLayout_Ch29, // map: CHAPTER_29
    [0xB2] = (void const *) MapChanges_Ch29, // map_changes: CHAPTER_29
    [0xB3] = (void const *) ChapterEvents_Ch29, // events: CHAPTER_29
    [0xB4] = (void const *) MapLayout_Ch2A, // map: CHAPTER_2A
    [0xB5] = (void const *) MapChanges_Ch2A, // map_changes: CHAPTER_2A
    [0xB6] = (void const *) ChapterEvents_Ch2A, // events: CHAPTER_2A
    [0xB7] = (void const *) Pal_Map_Ch2B, // pal: CHAPTER_2B, 0x39
    [0xB8] = (void const *) MapLayout_Ch2B, // map: CHAPTER_2B
    [0xB9] = (void const *) ChapterEvents_Ch2B, // events: CHAPTER_2B
    [0xBA] = (void const *) MapLayout_Ch2C, // map: CHAPTER_2C
    [0xBB] = (void const *) MapChanges_Ch2C, // map_changes: CHAPTER_2C
    [0xBC] = (void const *) ChapterEvents_Ch2C, // events: CHAPTER_2C
    [0xBD] = (void const *) Pal_Map_Ch2D, // pal: CHAPTER_2D
    [0xBE] = (void const *) MapLayout_Ch2D, // map: CHAPTER_2D
    [0xBF] = (void const *) MapChanges_Ch2D, // map_changes: CHAPTER_2D
    [0xC0] = (void const *) ChapterEvents_Ch2D, // events: CHAPTER_2D
    [0xC1] = (void const *) Img_MapObj_C1, // img_a: CHAPTER_2E, CHAPTER_2F, 0x40
    [0xC2] = (void const *) Pal_Map_Ch2E, // pal: CHAPTER_2E, CHAPTER_2F, 0x40
    [0xC3] = (void const *) TileConfig_C3, // tileset: CHAPTER_2E, CHAPTER_2F, 0x40
    [0xC4] = (void const *) MapLayout_Ch2E, // map: CHAPTER_2E
    [0xC5] = (void const *) TileGfxAnim_08B95F50, // img_anims: CHAPTER_2E, CHAPTER_2F
    [0xC6] = (void const *) MapChanges_Ch2E, // map_changes: CHAPTER_2E
    [0xC7] = (void const *) ChapterEvents_Ch2E, // events: CHAPTER_2E
    [0xC8] = (void const *) MapLayout_Ch2F, // map: CHAPTER_2F
    [0xC9] = (void const *) MapChanges_Ch2F, // map_changes: CHAPTER_2F
    [0xCA] = (void const *) ChapterEvents_Ch2F, // events: CHAPTER_2F
    [0xCB] = (void const *) Pal_Map_Ch30, // pal: 0x30
    [0xCC] = (void const *) MapLayout_Ch30, // map: 0x30
    [0xCD] = (void const *) ChapterEvents_Ch30, // events: 0x30
    [0xCE] = (void const *) MapLayout_Ch31, // map: 0x31
    [0xCF] = (void const *) MapChanges_Ch31, // map_changes: 0x31
    [0xD0] = (void const *) ChapterEvents_Ch31, // events: 0x31
    [0xD1] = (void const *) MapLayout_Ch32, // map: 0x32
    [0xD2] = (void const *) ChapterEvents_Ch32, // events: 0x32
    [0xD3] = (void const *) MapLayout_Ch33, // map: 0x33
    [0xD4] = (void const *) ChapterEvents_Ch33, // events: 0x33
    [0xD5] = (void const *) MapLayout_Ch34, // map: 0x34
    [0xD6] = (void const *) ChapterEvents_Ch34, // events: 0x34
    [0xD7] = (void const *) Pal_Map_Ch35, // pal: 0x35
    [0xD8] = (void const *) MapLayout_Ch35, // map: 0x35
    [0xD9] = (void const *) ChapterEvents_Ch35, // events: 0x35
    [0xDA] = (void const *) MapLayout_Ch36, // map: 0x36
    [0xDB] = (void const *) ChapterEvents_Ch36, // events: 0x36
    [0xDC] = (void const *) Pal_Map_Ch37, // pal: 0x37
    [0xDD] = (void const *) MapLayout_Ch37, // map: 0x37
    [0xDE] = (void const *) ChapterEvents_Ch37, // events: 0x37
    [0xDF] = (void const *) MapLayout_Ch38, // map: 0x38
    [0xE0] = (void const *) ChapterEvents_Ch38, // events: 0x38
    [0xE1] = (void const *) MapLayout_Ch39, // map: 0x39
    [0xE2] = (void const *) ChapterEvents_Ch39, // events: 0x39
    [0xE3] = (void const *) Pal_Map_Ch3A, // pal: 0x3A
    [0xE4] = (void const *) MapLayout_Ch3A, // map: 0x3A
    [0xE5] = (void const *) ChapterEvents_Ch3A, // events: 0x3A
    [0xE6] = (void const *) MapLayout_Ch3B, // map: 0x3B
    [0xE7] = (void const *) ChapterEvents_Ch3B, // events: 0x3B
    [0xE8] = (void const *) MapLayout_Ch3C, // map: 0x3C
    [0xE9] = (void const *) ChapterEvents_Ch3C, // events: 0x3C
    [0xEA] = (void const *) Pal_Map_Ch3D, // pal: 0x3D
    [0xEB] = (void const *) MapLayout_Ch3D, // map: 0x3D
    [0xEC] = (void const *) ChapterEvents_Ch3D, // events: 0x3D
    [0xED] = (void const *) MapLayout_Ch3E, // map: 0x3E
    [0xEE] = (void const *) ChapterEvents_Ch3E, // events: 0x3E
    [0xEF] = (void const *) MapLayout_Ch3F, // map: 0x3F
    [0xF0] = (void const *) ChapterEvents_Ch3F, // events: 0x3F
    [0xF1] = (void const *) MapLayout_Ch40, // map: 0x40
    [0xF2] = (void const *) MapChanges_Ch40, // map_changes: 0x40
    [0xF3] = (void const *) ChapterEvents_Ch40, // events: 0x40
    [0xF4] = (void const *) MapLayout_Ch41, // map: 0x41
    [0xF5] = (void const *) MapLayout_Ch42, // map: 0x42
    [0xF6] = (void const *) ChapterEvents_Ch42, // events: 0x42
};

// World map event scripts, indexed by ChapterInfo::gmapEventId
CONST_DATA EventScr const * gWmEventScripts[] = {
    [0x00] = NULL,
    [0x01] = (EventScr const *) gUnk_08CE791C, // CHAPTER_00
    [0x02] = (EventScr const *) gUnk_08CE7920, // CHAPTER_01
    [0x03] = (EventScr const *) gUnk_08CE7AC0, // CHAPTER_02
    [0x04] = (EventScr const *) gUnk_08CE7BB4, // CHAPTER_03
    [0x05] = (EventScr const *) gUnk_08CE7E1C, // CHAPTER_04
    [0x06] = (EventScr const *) gUnk_08CE7F30, // CHAPTER_05
    [0x07] = (EventScr const *) gUnk_08CE8078, // CHAPTER_06
    [0x08] = (EventScr const *) gUnk_08CE821C, // CHAPTER_07
    [0x09] = (EventScr const *) gUnk_08CE833C, // CHAPTER_08
    [0x0A] = (EventScr const *) gUnk_08CE84C8, // CHAPTER_09
    [0x0B] = (EventScr const *) gUnk_08CE8618, // CHAPTER_0A
    [0x0C] = (EventScr const *) gUnk_08CE8894, // CHAPTER_0B
    [0x0D] = (EventScr const *) gUnk_08CE89EC, // CHAPTER_0C
    [0x0E] = (EventScr const *) gUnk_08CECDD8, // CHAPTER_0D
    [0x0F] = (EventScr const *) gUnk_08CE8D50, // CHAPTER_0E
    [0x10] = (EventScr const *) gUnk_08CE8FAC, // CHAPTER_0F
    [0x11] = (EventScr const *) gUnk_08CE9200, // CHAPTER_10
    [0x12] = (EventScr const *) gUnk_08CE9408, // CHAPTER_11
    [0x13] = (EventScr const *) gUnk_08CECF0C, // CHAPTER_12
    [0x14] = (EventScr const *) gUnk_08CE9BF8, // CHAPTER_13
    [0x15] = (EventScr const *) gUnk_08CE9DD4, // CHAPTER_14
    [0x16] = (EventScr const *) gUnk_08CE9F88, // CHAPTER_15
    [0x17] = (EventScr const *) gUnk_08CEA10C, // CHAPTER_16
    [0x18] = (EventScr const *) gUnk_08CEA754, // CHAPTER_17
    [0x19] = (EventScr const *) gUnk_08CEA8C8, // CHAPTER_18
    [0x1A] = (EventScr const *) gUnk_08CED038, // CHAPTER_19
    [0x1B] = (EventScr const *) gUnk_08CEAA5C, // CHAPTER_1A
    [0x1C] = (EventScr const *) gUnk_08CEAC48, // CHAPTER_1B
    [0x1D] = (EventScr const *) gUnk_08CEAEA0, // CHAPTER_1C
    [0x1E] = (EventScr const *) gUnk_08CEB0E8, // CHAPTER_1D
    [0x1F] = (EventScr const *) gUnk_08CEB3AC, // CHAPTER_1F
    [0x20] = (EventScr const *) gUnk_08CEB67C, // CHAPTER_20
    [0x21] = (EventScr const *) gUnk_08CED188, // CHAPTER_21
    [0x22] = (EventScr const *) gUnk_08CEB94C, // CHAPTER_22
    [0x23] = (EventScr const *) gUnk_08CEBD20, // CHAPTER_23
    [0x24] = (EventScr const *) gUnk_08CEBF5C, // CHAPTER_24
    [0x25] = (EventScr const *) gUnk_08CEC198, // CHAPTER_25
    [0x26] = (EventScr const *) gUnk_08CEC3F8, // CHAPTER_26
    [0x27] = (EventScr const *) gUnk_08CEC5B4, // CHAPTER_27
    [0x28] = (EventScr const *) gUnk_08CEC96C, // CHAPTER_28
    [0x29] = (EventScr const *) gUnk_08CED478, // CHAPTER_29
    [0x2A] = (EventScr const *) gUnk_08CECA24, // CHAPTER_2A
    [0x2B] = (EventScr const *) gUnk_08CECBB0, // CHAPTER_2C
    [0x2C] = (EventScr const *) gUnk_08CED554, // CHAPTER_2D
};

SECTION(".rodata.08CE1D20")
const struct MapChange MapChanges_Ch02[] = {
    { .xOrigin = 0xD, .xSize = 1, .ySize = 2, .data = gUnk_08CE1D0C },
    { .id = 1, .xOrigin = 0xD, .xSize = 1, .ySize = 2, .data = gUnk_08CE1D10 },
    { .id = 2, .xOrigin = 8, .yOrigin = 1, .xSize = 2, .ySize = 3, .data = gUnk_08CE1D14 },
    { .id = -1 },
};

SECTION(".rodata.08CE1D6C")
const struct MapChange MapChanges_Ch03[] = {
    { .xOrigin = 2, .yOrigin = 5, .xSize = 3, .ySize = 2, .data = gUnk_08CE1D50 },
    { .id = 1, .xOrigin = 1, .yOrigin = 1, .xSize = 3, .ySize = 2, .data = gUnk_08CE1D5C },
    { .id = 2, .xOrigin = 3, .yOrigin = 6, .xSize = 1, .ySize = 1, .data = gUnk_08CE1D68 },
    { .id = 3, .xOrigin = 2, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = &gUnk_08CE1D68[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE1DB8")
const struct MapChange MapChanges_Ch04[] = {
    { .xOrigin = 3, .yOrigin = 2, .xSize = 2, .ySize = 4, .data = gUnk_08CE1DA8 },
    { .id = -1 },
};

SECTION(".rodata.08CE1EC0")
const struct MapChange MapChanges_Ch06[] = {
    { .xOrigin = 0xA, .yOrigin = 3, .xSize = 8, .ySize = 5, .data = gUnk_08CE1DD0 },
    { .id = 1, .xOrigin = 6, .xSize = 4, .ySize = 4, .data = gUnk_08CE1E20 },
    { .id = 2, .xOrigin = 4, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE1E40 },
    { .id = 3, .xOrigin = 7, .yOrigin = 8, .xSize = 1, .ySize = 1, .data = &gUnk_08CE1E40[1] },
    { .id = 4, .xOrigin = 0xF, .xSize = 3, .ySize = 5, .data = gUnk_08CE1E44 },
    { .id = 5, .xOrigin = 0xE, .yOrigin = 6, .xSize = 4, .ySize = 4, .data = &gUnk_08CE1E60[1] },
    { .id = 6, .xOrigin = 0xC, .yOrigin = 6, .xSize = 1, .ySize = 1, .data = &gUnk_08CE1E80[1] },
    { .id = 7, .xOrigin = 0x10, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = gUnk_08CE1E84 },
    { .id = 8, .xOrigin = 0xA, .xSize = 4, .ySize = 5, .data = &gUnk_08CE1E84[1] },
    { .id = 9, .xOrigin = 2, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = &gUnk_08CE1EAC[1] },
    { .id = 0xA, .xOrigin = 1, .yOrigin = 7, .xSize = 1, .ySize = 1, .data = gUnk_08CE1EB0 },
    {
        .id = 0xB,
        .xOrigin = 4,
        .yOrigin = 0xC,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE1EB0[1],
    },
    { .id = 0xC, .xOrigin = 0xA, .xSize = 5, .ySize = 1, .data = gUnk_08CE1EB4 },
    { .id = -1 },
};

SECTION(".rodata.08CE1F88")
const struct MapChange MapChanges_Ch07[] = {
    { .xOrigin = 0x10, .xSize = 3, .ySize = 3, .data = gUnk_08CE1F68 },
    { .id = 1, .xOrigin = 2, .yOrigin = 9, .xSize = 3, .ySize = 2, .data = &gUnk_08CE1F78[1] },
    {
        .id = 2,
        .xOrigin = 0x11,
        .yOrigin = 2,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE1F84[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE1FE4")
const struct MapChange MapChanges_Ch08[] = {
    { .xOrigin = 2, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE1FB8 },
    { .id = 1, .xOrigin = 2, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE1FBC },
    { .id = 2, .xOrigin = 3, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = gUnk_08CE1FC0 },
    { .id = 3, .xOrigin = 2, .yOrigin = 0xB, .xSize = 3, .ySize = 2, .data = &gUnk_08CE1FC0[1] },
    { .id = 4, .xOrigin = 0xD, .yOrigin = 7, .xSize = 2, .ySize = 2, .data = &gUnk_08CE1FCC[1] },
    { .id = 5, .xOrigin = 8, .yOrigin = 7, .xSize = 2, .ySize = 2, .data = &gUnk_08CE1FD4[1] },
    { .id = 6, .xOrigin = 3, .yOrigin = 5, .xSize = 1, .ySize = 2, .data = &gUnk_08CE1FDC[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE2058")
const struct MapChange MapChanges_Ch09[] = {
    { .xOrigin = 0xC, .yOrigin = 1, .xSize = 3, .ySize = 3, .data = gUnk_08CE2044 },
    { .id = 1, .xOrigin = 0xD, .yOrigin = 3, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2054[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE2090")
const struct MapChange MapChanges_Ch0A[] = {
    { .yOrigin = 3, .xSize = 3, .ySize = 3, .data = gUnk_08CE207C },
    { .id = 1, .xOrigin = 1, .yOrigin = 5, .xSize = 1, .ySize = 1, .data = &gUnk_08CE208C[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE20D4")
const struct MapChange MapChanges_Ch0B[] = {
    { .xOrigin = 0xE, .yOrigin = 0xA, .xSize = 3, .ySize = 3, .data = gUnk_08CE20B4 },
    {
        .id = 1,
        .xOrigin = 0x10,
        .yOrigin = 0xE,
        .xSize = 1,
        .ySize = 4,
        .data = &gUnk_08CE20C4[1],
    },
    {
        .id = 2,
        .xOrigin = 6,
        .yOrigin = 0x10,
        .xSize = 2,
        .ySize = 1,
        .data = &gUnk_08CE20CC[1],
    },
    {
        .id = 3,
        .xOrigin = 0xF,
        .yOrigin = 0xC,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE20D0[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE2114")
const struct MapChange MapChanges_Ch0C[] = {
    { .xOrigin = 0x10, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE2110 },
    { .id = -1 },
};

SECTION(".rodata.08CE2158")
const struct MapChange MapChanges_Ch0D[] = {
    { .xOrigin = 1, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE212C },
    { .id = 1, .xOrigin = 3, .xSize = 2, .ySize = 2, .data = gUnk_08CE2130 },
    { .id = 2, .xOrigin = 6, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE2138 },
    { .id = 3, .xOrigin = 0xB, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE213C },
    { .id = 4, .xOrigin = 0xD, .xSize = 2, .ySize = 2, .data = gUnk_08CE2140 },
    { .id = 5, .xOrigin = 0xF, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE2148 },
    { .id = 6, .xOrigin = 0xB, .yOrigin = 5, .xSize = 1, .ySize = 1, .data = gUnk_08CE214C },
    { .id = 7, .xOrigin = 0xB, .yOrigin = 7, .xSize = 1, .ySize = 1, .data = &gUnk_08CE214C[1] },
    { .id = 8, .xOrigin = 0xD, .yOrigin = 4, .xSize = 2, .ySize = 2, .data = gUnk_08CE2150 },
    { .id = -1 },
};

SECTION(".rodata.08CE21E4")
const struct MapChange MapChanges_Ch0E[] = {
    { .yOrigin = 6, .xSize = 3, .ySize = 3, .data = gUnk_08CE21D0 },
    { .id = 1, .xOrigin = 1, .yOrigin = 8, .xSize = 1, .ySize = 1, .data = &gUnk_08CE21E0[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE2244")
const struct MapChange MapChanges_Ch0F[] = {
    { .xSize = 3, .ySize = 3, .data = gUnk_08CE2208 },
    { .id = 1, .xOrigin = 0xB, .yOrigin = 7, .xSize = 3, .ySize = 3, .data = &gUnk_08CE2218[1] },
    { .id = 2, .xOrigin = 6, .yOrigin = 1, .xSize = 3, .ySize = 2, .data = gUnk_08CE222C },
    { .id = 3, .xOrigin = 2, .yOrigin = 3, .xSize = 1, .ySize = 4, .data = gUnk_08CE2238 },
    { .id = 4, .xOrigin = 1, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE2240 },
    { .id = 5, .xOrigin = 0xC, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2240[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE22EC")
const struct MapChange MapChanges_Ch10[] = {
    { .xOrigin = 4, .yOrigin = 1, .xSize = 3, .ySize = 1, .data = gUnk_08CE2298 },
    { .id = 1, .xOrigin = 4, .yOrigin = 2, .xSize = 3, .ySize = 1, .data = &gUnk_08CE229C[1] },
    { .id = 2, .xOrigin = 3, .yOrigin = 9, .xSize = 3, .ySize = 2, .data = gUnk_08CE22A4 },
    { .id = 3, .xOrigin = 0xA, .yOrigin = 3, .xSize = 3, .ySize = 2, .data = gUnk_08CE22B0 },
    { .id = 4, .xOrigin = 1, .yOrigin = 4, .xSize = 1, .ySize = 4, .data = gUnk_08CE22BC },
    { .id = 5, .xOrigin = 0xF, .yOrigin = 9, .xSize = 1, .ySize = 3, .data = gUnk_08CE22C4 },
    {
        .id = 6,
        .xOrigin = 0xD,
        .yOrigin = 0xC,
        .xSize = 3,
        .ySize = 2,
        .data = &gUnk_08CE22C8[1],
    },
    { .id = 7, .xOrigin = 0xD, .yOrigin = 1, .xSize = 3, .ySize = 3, .data = &gUnk_08CE22D4[1] },
    { .id = 8, .xOrigin = 0xE, .yOrigin = 3, .xSize = 1, .ySize = 1, .data = gUnk_08CE22E8 },
    { .id = -1 },
};

SECTION(".rodata.08CE238C")
const struct MapChange MapChanges_Ch11[] = {
    { .xOrigin = 8, .xSize = 3, .ySize = 3, .data = gUnk_08CE2364 },
    { .id = 1, .xOrigin = 5, .yOrigin = 0xC, .xSize = 3, .ySize = 3, .data = &gUnk_08CE2374[1] },
    { .id = 2, .xOrigin = 9, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE2388 },
    { .id = 3, .xOrigin = 6, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2388[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE23E0")
const struct MapChange MapChanges_Ch12[] = {
    { .xOrigin = 2, .yOrigin = 2, .xSize = 2, .ySize = 2, .data = gUnk_08CE23C8 },
    { .id = 1, .xOrigin = 9, .yOrigin = 1, .xSize = 1, .ySize = 2, .data = gUnk_08CE23D0 },
    { .id = 2, .xOrigin = 9, .yOrigin = 4, .xSize = 1, .ySize = 2, .data = gUnk_08CE23D4 },
    { .id = 3, .xOrigin = 1, .yOrigin = 0xB, .xSize = 1, .ySize = 1, .data = gUnk_08CE23D8 },
    { .id = 4, .xOrigin = 2, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = &gUnk_08CE23D8[1] },
    { .id = 5, .xOrigin = 4, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = gUnk_08CE23DC },
    { .id = -1 },
};

SECTION(".rodata.08CE245C")
const struct MapChange MapChanges_Ch13[] = {
    { .xOrigin = 0xB, .yOrigin = 0xC, .xSize = 3, .ySize = 3, .data = gUnk_08CE2434 },
    { .id = 1, .yOrigin = 9, .xSize = 3, .ySize = 3, .data = &gUnk_08CE2444[1] },
    { .id = 2, .xOrigin = 0xC, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = gUnk_08CE2458 },
    { .id = 3, .xOrigin = 1, .yOrigin = 0xB, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2458[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE24BC")
const struct MapChange MapChanges_Ch14[] = {
    { .xOrigin = 0xE, .yOrigin = 0xA, .xSize = 1, .ySize = 2, .data = gUnk_08CE2498 },
    { .id = 1, .xOrigin = 0xE, .yOrigin = 0xA, .xSize = 1, .ySize = 2, .data = gUnk_08CE249C },
    { .id = 2, .xOrigin = 6, .xSize = 2, .ySize = 2, .data = gUnk_08CE24A0 },
    { .id = 3, .xOrigin = 1, .yOrigin = 0x15, .xSize = 1, .ySize = 1, .data = gUnk_08CE24A8 },
    { .id = 4, .xOrigin = 2, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = &gUnk_08CE24A8[1] },
    { .id = 5, .xOrigin = 4, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = gUnk_08CE24AC },
    {
        .id = 6,
        .xOrigin = 1,
        .yOrigin = 0x13,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE24AC[1],
    },
    { .id = 7, .xOrigin = 2, .yOrigin = 0x13, .xSize = 1, .ySize = 1, .data = gUnk_08CE24B0 },
    { .id = 8, .xOrigin = 3, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = &gUnk_08CE24B0[1] },
    { .id = 9, .xOrigin = 5, .yOrigin = 6, .xSize = 1, .ySize = 2, .data = &gUnk_08CE24B4[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE254C")
const struct MapChange MapChanges_Ch15[] = {
    { .xOrigin = 3, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = gUnk_08CE2540 },
    { .id = 1, .xOrigin = 8, .yOrigin = 5, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2540[1] },
    { .id = 2, .xOrigin = 0xC, .yOrigin = 4, .xSize = 1, .ySize = 1, .data = gUnk_08CE2544 },
    {
        .id = 3,
        .xOrigin = 0x11,
        .yOrigin = 6,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2544[1],
    },
    { .id = 4, .xOrigin = 0xF, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = gUnk_08CE2548 },
    { .id = -1 },
};

SECTION(".rodata.08CE27F0")
const struct MapChange MapChanges_Ch16[] = {
    { .xOrigin = 0xD, .yOrigin = 1, .xSize = 6, .ySize = 0x14, .data = gUnk_08CE2594 },
    { .id = 1, .yOrigin = 3, .xSize = 7, .ySize = 0x12, .data = gUnk_08CE2684 },
    { .id = 2, .xOrigin = 6, .yOrigin = 0xE, .xSize = 8, .ySize = 7, .data = gUnk_08CE2780 },
    { .id = -1 },
};

SECTION(".rodata.08CE2834")
const struct MapChange MapChanges_Ch17[] = {
    { .xOrigin = 7, .yOrigin = 0xA, .xSize = 3, .ySize = 1, .data = gUnk_08CE2820 },
    { .id = 1, .xOrigin = 7, .yOrigin = 0xB, .xSize = 3, .ySize = 1, .data = &gUnk_08CE2824[1] },
    { .id = 2, .xOrigin = 9, .yOrigin = 0xD, .xSize = 1, .ySize = 3, .data = gUnk_08CE282C },
    { .id = -1 },
};

SECTION(".rodata.08CE2874")
const struct MapChange MapChanges_Ch18[] = {
    { .xOrigin = 0x11, .yOrigin = 0xD, .xSize = 3, .ySize = 2, .data = gUnk_08CE2864 },
    { .id = 1, .xOrigin = 0x12, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = gUnk_08CE2870 },
    { .id = -1 },
};

SECTION(".rodata.08CE28AC")
const struct MapChange MapChanges_Ch19[] = {
    { .xOrigin = 3, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE2898 },
    { .id = 1, .xOrigin = 0xA, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2898[1] },
    { .id = 2, .xOrigin = 3, .yOrigin = 9, .xSize = 2, .ySize = 1, .data = gUnk_08CE289C },
    { .id = 3, .xOrigin = 0x13, .yOrigin = 0xC, .xSize = 1, .ySize = 2, .data = gUnk_08CE28A0 },
    { .id = 4, .xOrigin = 3, .xSize = 1, .ySize = 1, .data = gUnk_08CE28A4 },
    {
        .id = 5,
        .xOrigin = 0x13,
        .yOrigin = 0xF,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE28A4[1],
    },
    { .id = 6, .xOrigin = 0x14, .yOrigin = 0xF, .xSize = 1, .ySize = 1, .data = gUnk_08CE28A8 },
    { .id = -1 },
};

SECTION(".rodata.08CE2968")
const struct MapChange MapChanges_Ch1A[] = {
    { .xOrigin = 3, .yOrigin = 4, .xSize = 3, .ySize = 1, .data = gUnk_08CE290C },
    { .id = 1, .xOrigin = 1, .yOrigin = 6, .xSize = 3, .ySize = 2, .data = &gUnk_08CE2910[1] },
    { .id = 2, .xOrigin = 1, .yOrigin = 8, .xSize = 1, .ySize = 1, .data = &gUnk_08CE291C[1] },
    { .id = 3, .xOrigin = 3, .yOrigin = 0xB, .xSize = 3, .ySize = 2, .data = gUnk_08CE2920 },
    { .id = 4, .xOrigin = 2, .yOrigin = 0x11, .xSize = 1, .ySize = 1, .data = gUnk_08CE292C },
    {
        .id = 5,
        .xOrigin = 0x10,
        .yOrigin = 0xA,
        .xSize = 2,
        .ySize = 3,
        .data = &gUnk_08CE292C[1],
    },
    {
        .id = 6,
        .xOrigin = 9,
        .yOrigin = 0x10,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2938[1],
    },
    { .id = 7, .xOrigin = 0x13, .yOrigin = 0xD, .xSize = 2, .ySize = 3, .data = gUnk_08CE293C },
    { .id = 8, .xOrigin = 0xF, .yOrigin = 0x11, .xSize = 3, .ySize = 2, .data = gUnk_08CE2948 },
    { .id = 9, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = gUnk_08CE2954 },
    {
        .id = 0xA,
        .xOrigin = 0x14,
        .yOrigin = 0x11,
        .xSize = 2,
        .ySize = 1,
        .data = &gUnk_08CE2954[1],
    },
    {
        .id = 0xB,
        .xOrigin = 0x15,
        .yOrigin = 7,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2958[1],
    },
    { .id = 0xC, .xOrigin = 0xC, .yOrigin = 5, .xSize = 1, .ySize = 2, .data = gUnk_08CE295C },
    { .id = 0xD, .xOrigin = 0x15, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = gUnk_08CE2960 },
    { .id = 0xF, .xOrigin = 6, .yOrigin = 8, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2960[1] },
    { .id = 0x10, .xOrigin = 2, .yOrigin = 0x13, .xSize = 1, .ySize = 1, .data = gUnk_08CE2964 },
    { .id = -1 },
};

SECTION(".rodata.08CE2A70")
const struct MapChange MapChanges_Ch1B[] = {
    { .xOrigin = 3, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = gUnk_08CE2A34 },
    { .id = 1, .xOrigin = 2, .yOrigin = 5, .xSize = 3, .ySize = 2, .data = &gUnk_08CE2A34[1] },
    { .id = 2, .yOrigin = 8, .xSize = 3, .ySize = 2, .data = &gUnk_08CE2A40[1] },
    { .id = 3, .xOrigin = 0x12, .xSize = 3, .ySize = 2, .data = &gUnk_08CE2A4C[1] },
    {
        .id = 4,
        .xOrigin = 0x10,
        .yOrigin = 0xA,
        .xSize = 3,
        .ySize = 2,
        .data = &gUnk_08CE2A58[1],
    },
    { .id = 5, .xOrigin = 3, .yOrigin = 6, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2A64[1] },
    { .id = 6, .xOrigin = 1, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = gUnk_08CE2A68 },
    {
        .id = 7,
        .xOrigin = 0x13,
        .yOrigin = 1,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2A68[1],
    },
    { .id = 8, .xOrigin = 0x11, .yOrigin = 0xB, .xSize = 1, .ySize = 1, .data = gUnk_08CE2A6C },
    { .id = -1 },
};

SECTION(".rodata.08CE2B04")
const struct MapChange MapChanges_Ch1C[] = {
    { .xOrigin = 0xA, .yOrigin = 4, .xSize = 2, .ySize = 1, .data = gUnk_08CE2AE8 },
    { .id = 1, .xOrigin = 4, .yOrigin = 9, .xSize = 1, .ySize = 2, .data = gUnk_08CE2AEC },
    { .id = 2, .xOrigin = 0x11, .yOrigin = 9, .xSize = 1, .ySize = 2, .data = gUnk_08CE2AF0 },
    { .id = 3, .xOrigin = 4, .yOrigin = 0xF, .xSize = 1, .ySize = 2, .data = gUnk_08CE2AF4 },
    { .id = 4, .xOrigin = 4, .yOrigin = 0x11, .xSize = 1, .ySize = 1, .data = gUnk_08CE2AF8 },
    {
        .id = 5,
        .xOrigin = 5,
        .yOrigin = 0x12,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2AF8[1],
    },
    { .id = 6, .xOrigin = 0xF, .yOrigin = 0xA, .xSize = 2, .ySize = 2, .data = gUnk_08CE2AFC },
    { .id = -1 },
};

SECTION(".rodata.08CE2BF4")
const struct MapChange MapChanges_Ch1E[] = {
    { .xOrigin = 0xA, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = gUnk_08CE2B64 },
    {
        .id = 1,
        .xOrigin = 2,
        .yOrigin = 0x12,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2B64[1],
    },
    { .id = 2, .xOrigin = 0x12, .yOrigin = 0x12, .xSize = 1, .ySize = 1, .data = gUnk_08CE2B68 },
    { .id = 3, .xOrigin = 0xF, .xSize = 3, .ySize = 4, .data = &gUnk_08CE2B68[1] },
    {
        .id = 4,
        .xOrigin = 0x12,
        .yOrigin = 8,
        .xSize = 1,
        .ySize = 2,
        .data = &gUnk_08CE2B80[1],
    },
    {
        .id = 5,
        .xOrigin = 0x12,
        .yOrigin = 0xC,
        .xSize = 1,
        .ySize = 2,
        .data = &gUnk_08CE2B84[1],
    },
    { .id = 6, .xOrigin = 2, .yOrigin = 0xC, .xSize = 1, .ySize = 2, .data = &gUnk_08CE2B88[1] },
    {
        .id = 7,
        .xOrigin = 2,
        .yOrigin = 0x10,
        .xSize = 1,
        .ySize = 2,
        .data = &gUnk_08CE2B8C[1],
    },
    { .id = 8, .xOrigin = 6, .yOrigin = 4, .xSize = 1, .ySize = 2, .data = &gUnk_08CE2B90[1] },
    { .id = 9, .xOrigin = 8, .yOrigin = 0xD, .xSize = 2, .ySize = 2, .data = &gUnk_08CE2B94[1] },
    {
        .id = 0xA,
        .xOrigin = 0x10,
        .yOrigin = 0xD,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2B9C[1],
    },
    {
        .id = 0xB,
        .xOrigin = 0x10,
        .yOrigin = 5,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2BA4[1],
    },
    {
        .id = 0xC,
        .xOrigin = 0xC,
        .yOrigin = 5,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2BAC[1],
    },
    { .id = 0xD, .xOrigin = 8, .yOrigin = 5, .xSize = 2, .ySize = 2, .data = &gUnk_08CE2BB4[1] },
    { .id = 0xE, .xOrigin = 4, .yOrigin = 5, .xSize = 2, .ySize = 2, .data = &gUnk_08CE2BBC[1] },
    {
        .id = 0xF,
        .xOrigin = 8,
        .yOrigin = 0x11,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2BC4[1],
    },
    {
        .id = 0x10,
        .xOrigin = 0xC,
        .yOrigin = 0x11,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2BCC[1],
    },
    {
        .id = 0x11,
        .xOrigin = 0x10,
        .yOrigin = 0x11,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2BD4[1],
    },
    {
        .id = 0x12,
        .xOrigin = 8,
        .yOrigin = 1,
        .xSize = 2,
        .ySize = 2,
        .data = &gUnk_08CE2BDC[1],
    },
    {
        .id = 0x13,
        .xOrigin = 4,
        .yOrigin = 1,
        .xSize = 2,
        .ySize = 3,
        .data = &gUnk_08CE2BE4[1],
    },
    {
        .id = 0x14,
        .xOrigin = 0xA,
        .yOrigin = 0xC,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2BF0[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE2D30")
const struct MapChange MapChanges_Ch1F[] = {
    { .xOrigin = 0x10, .xSize = 3, .ySize = 3, .data = gUnk_08CE2CFC },
    {
        .id = 1,
        .xOrigin = 0xC,
        .yOrigin = 0xD,
        .xSize = 3,
        .ySize = 3,
        .data = &gUnk_08CE2D0C[1],
    },
    { .id = 2, .xOrigin = 0x11, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE2D20 },
    {
        .id = 3,
        .xOrigin = 0xD,
        .yOrigin = 0xF,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2D20[1],
    },
    { .id = 4, .xOrigin = 9, .yOrigin = 0x16, .xSize = 3, .ySize = 2, .data = gUnk_08CE2D24 },
    { .id = -1 },
};

SECTION(".rodata.08CE2DA4")
const struct MapChange MapChanges_Ch20[] = {
    { .xSize = 3, .ySize = 2, .data = gUnk_08CE2D78 },
    { .id = 1, .xOrigin = 2, .yOrigin = 3, .xSize = 3, .ySize = 2, .data = gUnk_08CE2D84 },
    { .id = 2, .xOrigin = 0x17, .yOrigin = 0xE, .xSize = 3, .ySize = 2, .data = gUnk_08CE2D90 },
    { .id = 3, .xOrigin = 1, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = gUnk_08CE2D9C },
    { .id = 4, .xOrigin = 3, .yOrigin = 4, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2D9C[1] },
    { .id = 5, .xOrigin = 0x18, .yOrigin = 0xF, .xSize = 1, .ySize = 1, .data = gUnk_08CE2DA0 },
    { .id = -1 },
};

SECTION(".rodata.08CE2E0C")
const struct MapChange MapChanges_Ch21[] = {
    { .xOrigin = 0x15, .yOrigin = 7, .xSize = 3, .ySize = 3, .data = gUnk_08CE2DF8 },
    {
        .id = 1,
        .xOrigin = 0x16,
        .yOrigin = 9,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2E08[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE2E44")
const struct MapChange MapChanges_Ch22[] = {
    { .yOrigin = 0x15, .xSize = 3, .ySize = 3, .data = gUnk_08CE2E30 },
    {
        .id = 1,
        .xOrigin = 1,
        .yOrigin = 0x17,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE2E40[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE2E78")
const struct MapChange MapChanges_Ch23[] = {
    { .xOrigin = 0xE, .yOrigin = 3, .xSize = 1, .ySize = 1, .data = gUnk_08CE2E68 },
    { .id = 1, .xOrigin = 0xF, .yOrigin = 4, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2E68[1] },
    { .id = 2, .xOrigin = 0x10, .yOrigin = 5, .xSize = 1, .ySize = 1, .data = gUnk_08CE2E6C },
    { .id = 3, .xOrigin = 0xF, .yOrigin = 6, .xSize = 1, .ySize = 1, .data = &gUnk_08CE2E6C[1] },
    { .id = 4, .xOrigin = 0xD, .yOrigin = 0xB, .xSize = 1, .ySize = 2, .data = gUnk_08CE2E70 },
    { .id = 5, .xOrigin = 0xF, .yOrigin = 0x15, .xSize = 2, .ySize = 1, .data = gUnk_08CE2E74 },
    { .id = -1 },
};

SECTION(".rodata.08CE3178")
const struct MapChange MapChanges_Ch24[] = {
    { .xOrigin = 2, .xSize = 0xF, .ySize = 7, .data = gUnk_08CE2ECC },
    { .id = 1, .xOrigin = 0x12, .xSize = 7, .ySize = 6, .data = &gUnk_08CE2F9C[1] },
    { .id = 2, .xOrigin = 0xD, .yOrigin = 8, .xSize = 6, .ySize = 5, .data = &gUnk_08CE2FF0[1] },
    { .id = 3, .xOrigin = 2, .yOrigin = 0xA, .xSize = 7, .ySize = 5, .data = &gUnk_08CE302C[1] },
    { .id = 4, .xOrigin = 0x14, .yOrigin = 0xC, .xSize = 5, .ySize = 6, .data = gUnk_08CE3074 },
    { .id = 5, .xOrigin = 7, .yOrigin = 0x11, .xSize = 0xC, .ySize = 8, .data = gUnk_08CE30B0 },
    { .id = 6, .xOrigin = 0xE, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = gUnk_08CE3170 },
    {
        .id = 7,
        .xOrigin = 0xF,
        .yOrigin = 0xA,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3170[1],
    },
    { .id = 8, .xOrigin = 0x10, .yOrigin = 0xA, .xSize = 1, .ySize = 1, .data = gUnk_08CE3174 },
    {
        .id = 9,
        .xOrigin = 9,
        .yOrigin = 0x17,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3174[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE3214")
const struct MapChange MapChanges_Ch25[] = {
    { .xOrigin = 6, .yOrigin = 3, .xSize = 1, .ySize = 1, .data = gUnk_08CE31FC },
    {
        .id = 1,
        .xOrigin = 0x1A,
        .yOrigin = 6,
        .xSize = 1,
        .ySize = 2,
        .data = &gUnk_08CE31FC[1],
    },
    { .id = 2, .xOrigin = 5, .yOrigin = 0xD, .xSize = 1, .ySize = 1, .data = &gUnk_08CE3200[1] },
    { .id = 3, .xOrigin = 6, .yOrigin = 0xD, .xSize = 1, .ySize = 1, .data = gUnk_08CE3204 },
    {
        .id = 4,
        .xOrigin = 0x15,
        .yOrigin = 0xD,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3204[1],
    },
    { .id = 5, .xOrigin = 0x16, .yOrigin = 0xE, .xSize = 1, .ySize = 1, .data = gUnk_08CE3208 },
    { .id = 6, .xOrigin = 5, .yOrigin = 0xF, .xSize = 1, .ySize = 1, .data = &gUnk_08CE3208[1] },
    { .id = 7, .xOrigin = 0x15, .yOrigin = 0x10, .xSize = 1, .ySize = 1, .data = gUnk_08CE320C },
    {
        .id = 8,
        .xOrigin = 0xD,
        .yOrigin = 0x12,
        .xSize = 2,
        .ySize = 1,
        .data = &gUnk_08CE320C[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE341C")
const struct MapChange MapChanges_Ch26[] = {
    { .xOrigin = 4, .yOrigin = 8, .xSize = 2, .ySize = 1, .data = gUnk_08CE328C },
    { .id = 1, .xOrigin = 4, .yOrigin = 8, .xSize = 2, .ySize = 1, .data = gUnk_08CE3290 },
    { .id = 2, .xOrigin = 1, .yOrigin = 3, .xSize = 1, .ySize = 3, .data = gUnk_08CE3294 },
    { .id = 3, .xOrigin = 1, .yOrigin = 3, .xSize = 1, .ySize = 3, .data = &gUnk_08CE3298[1] },
    { .id = 4, .xOrigin = 3, .yOrigin = 1, .xSize = 3, .ySize = 1, .data = gUnk_08CE32A0 },
    { .id = 5, .xOrigin = 3, .yOrigin = 1, .xSize = 3, .ySize = 1, .data = &gUnk_08CE32A4[1] },
    { .id = 6, .xOrigin = 7, .yOrigin = 3, .xSize = 1, .ySize = 5, .data = gUnk_08CE32AC },
    { .id = 7, .xOrigin = 7, .yOrigin = 3, .xSize = 1, .ySize = 5, .data = &gUnk_08CE32B4[1] },
    { .id = 8, .xOrigin = 7, .yOrigin = 0xB, .xSize = 3, .ySize = 3, .data = gUnk_08CE32C0 },
    { .id = 9, .xOrigin = 7, .yOrigin = 0xB, .xSize = 3, .ySize = 3, .data = &gUnk_08CE32D0[1] },
    { .id = 0xA, .xOrigin = 7, .yOrigin = 0xE, .xSize = 1, .ySize = 3, .data = gUnk_08CE32E4 },
    {
        .id = 0xB,
        .xOrigin = 7,
        .yOrigin = 0xE,
        .xSize = 1,
        .ySize = 3,
        .data = &gUnk_08CE32E8[1],
    },
    { .id = 0xC, .xOrigin = 4, .yOrigin = 0x12, .xSize = 1, .ySize = 1, .data = gUnk_08CE32F0 },
    {
        .id = 0xD,
        .xOrigin = 4,
        .yOrigin = 0x12,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE32F0[1],
    },
    { .id = 0xE, .xOrigin = 0xB, .yOrigin = 1, .xSize = 4, .ySize = 1, .data = gUnk_08CE32F4 },
    { .id = 0xF, .xOrigin = 0xB, .yOrigin = 1, .xSize = 4, .ySize = 1, .data = gUnk_08CE32FC },
    { .id = 0x10, .xOrigin = 0xA, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE3304 },
    { .id = 0x11, .xOrigin = 0xA, .yOrigin = 3, .xSize = 1, .ySize = 2, .data = gUnk_08CE3308 },
    { .id = 0x12, .xOrigin = 0xB, .yOrigin = 8, .xSize = 2, .ySize = 3, .data = gUnk_08CE330C },
    { .id = 0x13, .xOrigin = 0xB, .yOrigin = 8, .xSize = 2, .ySize = 3, .data = gUnk_08CE3318 },
    { .id = 0x14, .xOrigin = 8, .yOrigin = 0x12, .xSize = 3, .ySize = 1, .data = gUnk_08CE3324 },
    {
        .id = 0x15,
        .xOrigin = 8,
        .yOrigin = 0x12,
        .xSize = 3,
        .ySize = 1,
        .data = &gUnk_08CE3328[1],
    },
    {
        .id = 0x16,
        .xOrigin = 0xC,
        .yOrigin = 0xF,
        .xSize = 1,
        .ySize = 2,
        .data = gUnk_08CE3330,
    },
    {
        .id = 0x17,
        .xOrigin = 0xC,
        .yOrigin = 0xF,
        .xSize = 1,
        .ySize = 2,
        .data = gUnk_08CE3334,
    },
    { .id = 0x18, .xOrigin = 0x11, .yOrigin = 3, .xSize = 1, .ySize = 1, .data = gUnk_08CE3338 },
    {
        .id = 0x19,
        .xOrigin = 0x11,
        .yOrigin = 3,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3338[1],
    },
    { .id = 0x1A, .xOrigin = 0xE, .yOrigin = 6, .xSize = 2, .ySize = 1, .data = gUnk_08CE333C },
    { .id = 0x1B, .xOrigin = 0xE, .yOrigin = 6, .xSize = 2, .ySize = 1, .data = gUnk_08CE3340 },
    { .id = 0x1C, .xOrigin = 0x10, .yOrigin = 8, .xSize = 3, .ySize = 5, .data = gUnk_08CE3344 },
    {
        .id = 0x1D,
        .xOrigin = 0x10,
        .yOrigin = 8,
        .xSize = 3,
        .ySize = 5,
        .data = &gUnk_08CE3360[1],
    },
    {
        .id = 0x1E,
        .xOrigin = 0xF,
        .yOrigin = 0x10,
        .xSize = 4,
        .ySize = 3,
        .data = gUnk_08CE3380,
    },
    {
        .id = 0x1F,
        .xOrigin = 0xF,
        .yOrigin = 0x10,
        .xSize = 4,
        .ySize = 3,
        .data = gUnk_08CE3398,
    },
    {
        .id = 0x20,
        .xOrigin = 0x12,
        .yOrigin = 0xE,
        .xSize = 3,
        .ySize = 2,
        .data = gUnk_08CE33B0,
    },
    {
        .id = 0x21,
        .xOrigin = 0x12,
        .yOrigin = 0xE,
        .xSize = 3,
        .ySize = 2,
        .data = gUnk_08CE33BC,
    },
    { .id = 0x22, .xOrigin = 0x13, .yOrigin = 1, .xSize = 4, .ySize = 1, .data = gUnk_08CE33C8 },
    { .id = 0x23, .xOrigin = 0x13, .yOrigin = 1, .xSize = 4, .ySize = 1, .data = gUnk_08CE33D0 },
    {
        .id = 0x24,
        .xOrigin = 0x17,
        .yOrigin = 0xE,
        .xSize = 3,
        .ySize = 5,
        .data = gUnk_08CE33D8,
    },
    {
        .id = 0x25,
        .xOrigin = 0x17,
        .yOrigin = 0xE,
        .xSize = 3,
        .ySize = 5,
        .data = &gUnk_08CE33F4[1],
    },
    { .id = 0x26, .xOrigin = 0x17, .xSize = 1, .ySize = 1, .data = gUnk_08CE3414 },
    {
        .id = 0x27,
        .xOrigin = 0x18,
        .yOrigin = 1,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3414[1],
    },
    { .id = 0x28, .xOrigin = 0x19, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE3418 },
    {
        .id = 0x29,
        .xOrigin = 0x10,
        .yOrigin = 0xE,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3418[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE3634")
const struct MapChange MapChanges_Ch27[] = {
    { .xOrigin = 2, .yOrigin = 0x15, .xSize = 3, .ySize = 3, .data = gUnk_08CE3620 },
    {
        .id = 1,
        .xOrigin = 3,
        .yOrigin = 0x17,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3630[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE3664")
const struct MapChange MapChanges_Ch28[] = {
    { .xOrigin = 3, .yOrigin = 5, .xSize = 1, .ySize = 1, .data = gUnk_08CE3658 },
    { .id = 1, .xOrigin = 0xD, .yOrigin = 5, .xSize = 1, .ySize = 1, .data = &gUnk_08CE3658[1] },
    { .id = 3, .xOrigin = 1, .yOrigin = 0x15, .xSize = 1, .ySize = 1, .data = gUnk_08CE365C },
    {
        .id = 4,
        .xOrigin = 8,
        .yOrigin = 0x15,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE365C[1],
    },
    { .id = 5, .xOrigin = 0xF, .yOrigin = 0x15, .xSize = 1, .ySize = 1, .data = gUnk_08CE3660 },
    { .id = -1 },
};

SECTION(".rodata.08CE36B4")
const struct MapChange MapChanges_Ch29[] = {
    { .xOrigin = 0x1C, .yOrigin = 1, .xSize = 1, .ySize = 1, .data = gUnk_08CE36AC },
    {
        .id = 1,
        .xOrigin = 0x10,
        .yOrigin = 0xF,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE36AC[1],
    },
    { .id = 2, .xOrigin = 4, .yOrigin = 0xC, .xSize = 1, .ySize = 1, .data = gUnk_08CE36B0 },
    { .id = -1 },
};

SECTION(".rodata.08CE3700")
const struct MapChange MapChanges_Ch2A[] = {
    { .xOrigin = 1, .xSize = 1, .ySize = 2, .data = gUnk_08CE36E4 },
    { .id = 1, .xOrigin = 1, .yOrigin = 0xB, .xSize = 2, .ySize = 2, .data = gUnk_08CE36E8 },
    { .id = 2, .xOrigin = 3, .yOrigin = 0xC, .xSize = 1, .ySize = 1, .data = gUnk_08CE36F0 },
    { .id = 3, .xOrigin = 4, .yOrigin = 0xC, .xSize = 1, .ySize = 1, .data = &gUnk_08CE36F0[1] },
    { .id = 4, .xOrigin = 4, .yOrigin = 0xE, .xSize = 1, .ySize = 2, .data = gUnk_08CE36F4 },
    { .id = 5, .xOrigin = 3, .yOrigin = 0x17, .xSize = 1, .ySize = 1, .data = gUnk_08CE36F8 },
    {
        .id = 6,
        .xOrigin = 0x13,
        .yOrigin = 0x15,
        .xSize = 2,
        .ySize = 1,
        .data = &gUnk_08CE36F8[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE3790")
const struct MapChange MapChanges_Ch2C[] = {
    { .xOrigin = 4, .yOrigin = 1, .xSize = 3, .ySize = 2, .data = gUnk_08CE3760 },
    { .id = 1, .xOrigin = 0xA, .yOrigin = 8, .xSize = 3, .ySize = 2, .data = gUnk_08CE376C },
    { .id = 2, .xOrigin = 0x16, .yOrigin = 0x19, .xSize = 3, .ySize = 2, .data = gUnk_08CE3778 },
    { .id = 3, .xOrigin = 5, .yOrigin = 2, .xSize = 1, .ySize = 1, .data = gUnk_08CE3784 },
    { .id = 4, .xOrigin = 0xB, .yOrigin = 9, .xSize = 1, .ySize = 1, .data = &gUnk_08CE3784[1] },
    { .id = 5, .xOrigin = 0x17, .yOrigin = 0x1A, .xSize = 1, .ySize = 1, .data = gUnk_08CE3788 },
    {
        .id = 6,
        .xOrigin = 0x12,
        .yOrigin = 5,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE3788[1],
    },
    { .id = 7, .xOrigin = 0x14, .yOrigin = 0xB, .xSize = 1, .ySize = 1, .data = gUnk_08CE378C },
    {
        .id = 8,
        .xOrigin = 0x16,
        .yOrigin = 0xB,
        .xSize = 1,
        .ySize = 1,
        .data = &gUnk_08CE378C[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE3810")
const struct MapChange MapChanges_Ch2D[] = {
    { .xOrigin = 0xA, .yOrigin = 0xD, .xSize = 1, .ySize = 2, .data = gUnk_08CE3808 },
    { .id = 1, .xOrigin = 6, .yOrigin = 3, .xSize = 1, .ySize = 1, .data = gUnk_08CE380C },
    { .id = 2, .xOrigin = 0xF, .yOrigin = 4, .xSize = 1, .ySize = 1, .data = &gUnk_08CE380C[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE39B4")
const struct MapChange MapChanges_Ch2E[] = {
    { .xOrigin = 3, .xSize = 0xC, .ySize = 8, .data = gUnk_08CE3840 },
    { .id = 1, .xOrigin = 2, .yOrigin = 0xA, .xSize = 3, .ySize = 5, .data = gUnk_08CE3900 },
    {
        .id = 2,
        .xOrigin = 0xC,
        .yOrigin = 0xA,
        .xSize = 3,
        .ySize = 5,
        .data = &gUnk_08CE391C[1],
    },
    { .id = 3, .xOrigin = 1, .yOrigin = 0xF, .xSize = 3, .ySize = 5, .data = gUnk_08CE393C },
    {
        .id = 4,
        .xOrigin = 0xD,
        .yOrigin = 0xF,
        .xSize = 3,
        .ySize = 5,
        .data = &gUnk_08CE3958[1],
    },
    { .id = 5, .xOrigin = 2, .yOrigin = 0x14, .xSize = 3, .ySize = 5, .data = gUnk_08CE3978 },
    {
        .id = 6,
        .xOrigin = 0xC,
        .yOrigin = 0x14,
        .xSize = 3,
        .ySize = 5,
        .data = &gUnk_08CE3994[1],
    },
    { .id = -1 },
};

SECTION(".rodata.08CE3A38")
const struct MapChange MapChanges_Ch2F[] = {
    { .xOrigin = 0xB, .yOrigin = 2, .xSize = 3, .ySize = 3, .data = gUnk_08CE3A14 },
    { .id = 1, .xOrigin = 0xB, .yOrigin = 2, .xSize = 3, .ySize = 3, .data = &gUnk_08CE3A24[1] },
    { .id = -1 },
};

SECTION(".rodata.08CE3A60")
const struct MapChange MapChanges_Ch31[] = {
    { .xOrigin = 0xA, .yOrigin = 5, .xSize = 2, .ySize = 1, .data = gUnk_08CE3A5C },
    { .id = -1 },
};

SECTION(".rodata.08CE3B40")
const struct MapChange MapChanges_Ch40[] = {
    { .xOrigin = 2, .xSize = 0xB, .ySize = 9, .data = gUnk_08CE3A78 },
    { .id = -1 },
};
