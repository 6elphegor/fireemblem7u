#include "gbafe.h"

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
extern const u8 gUnk_083154BC[];
extern const u8 gUnk_0831ACB0[];
extern const u8 gUnk_0831DE34[];
extern const u8 gUnk_083230BC[];
extern const u8 gUnk_08329534[];
extern const u8 gUnk_08330140[];
extern const u8 gUnk_08336F24[];
extern const u8 gUnk_0833BC70[];
extern const u8 gUnk_0833F2C8[];
extern const u8 gUnk_083464F0[];
extern const u8 gUnk_0834C74C[];
extern const u8 gUnk_0835334C[];
extern const u8 gUnk_08353EFC[];
extern const u8 gUnk_08354854[];
extern const u8 gUnk_0835580C[];
extern const u8 gUnk_08356FD0[];
extern const u8 gUnk_0835801C[];
extern const u8 gUnk_08359304[];
extern const u8 gUnk_08359F3C[];
extern const u8 gUnk_0835B72C[];
extern const u8 gUnk_0835C63C[];
extern const u8 gUnk_0835DB50[];
extern const u8 gUnk_0835EE10[];
extern const u8 gUnk_083602B8[];
extern const u8 gUnk_083603F8[];
extern const u8 gUnk_08360538[];
extern const u8 gUnk_08360678[];
extern const u8 gUnk_083607B8[];
extern const u8 gUnk_083608F8[];
extern const u8 gUnk_08360A38[];
extern const u8 gUnk_08360B78[];
extern const u8 gUnk_08360CB8[];
extern const u8 gUnk_08360DF8[];
extern const u8 gUnk_08360F38[];
extern const u8 gUnk_08361078[];
extern const u8 gUnk_083611B8[];
extern const u8 gUnk_083612F8[];
extern const u8 gUnk_08361438[];
extern const u8 gUnk_08361578[];
extern const u8 gUnk_083616B8[];
extern const u8 gUnk_083617F8[];
extern const u8 gUnk_08361938[];
extern const u8 gUnk_08361A78[];
extern const u8 gUnk_08361BB8[];
extern const u8 gUnk_08361CF8[];
extern const u8 gUnk_08361E38[];
extern const u8 gUnk_08361F78[];
extern const u8 gUnk_083620B8[];
extern const u8 gUnk_083621F8[];
extern const u8 gUnk_08362338[];
extern const u8 gUnk_08362478[];
extern const u8 gUnk_083625B8[];
extern const u8 gUnk_083626F8[];
extern const u8 gUnk_08362838[];
extern const u8 gUnk_08362978[];
extern const u8 gUnk_08362AB8[];
extern const u8 gUnk_08362BF8[];
extern const u8 gUnk_08362D38[];
extern const u8 gUnk_08362E78[];
extern const u8 gUnk_08362FB8[];
extern const u8 gUnk_083630C0[];
extern const u8 gUnk_083631C8[];
extern const u8 gUnk_08363328[];
extern const u8 gUnk_08363474[];
extern const u8 gUnk_083635B0[];
extern const u8 gUnk_083636F4[];
extern const u8 gUnk_08363800[];
extern const u8 gUnk_08363900[];
extern const u8 gUnk_08363A38[];
extern const u8 gUnk_08363B7C[];
extern const u8 gUnk_08363C58[];
extern const u8 gUnk_08363D2C[];
extern const u8 gUnk_08363E80[];
extern const u8 gUnk_08363FE4[];
extern const u8 gUnk_08364108[];
extern const u8 gUnk_0836423C[];
extern const u8 gUnk_083642E8[];
extern const u8 gUnk_083643CC[];
extern const u8 gUnk_083644C0[];
extern const u8 gUnk_08364754[];
extern const u8 gUnk_08364958[];
extern const u8 gUnk_08364B34[];
extern const u8 gUnk_0836503C[];
extern const u8 gUnk_08365154[];
extern const u8 gUnk_083653D0[];
extern const u8 gUnk_083656A8[];
extern const u8 gUnk_08365980[];
extern const u8 gUnk_08365E98[];
extern const u8 gUnk_08366090[];
extern const u8 gUnk_08366378[];
extern const u8 gUnk_08366608[];
extern const u8 gUnk_08366950[];
extern const u8 gUnk_08366D04[];
extern const u8 gUnk_08367064[];
extern const u8 gUnk_08367324[];
extern const u8 gUnk_0836768C[];
extern const u8 gUnk_0836785C[];
extern const u8 gUnk_08367A80[];
extern const u8 gUnk_08367D3C[];
extern const u8 gUnk_08367FAC[];
extern const u8 gUnk_0836821C[];
extern const u8 gUnk_08368438[];
extern const u8 gUnk_08368650[];
extern const u8 gUnk_0836889C[];
extern const u8 gUnk_08368A6C[];
extern const u8 gUnk_08368C98[];
extern const u8 gUnk_08368E68[];
extern const u8 gUnk_0836913C[];
extern const u8 gUnk_0836927C[];
extern const u8 gUnk_0836959C[];
extern const u8 gUnk_08369750[];
extern const u8 gUnk_083699AC[];
extern const u8 gUnk_08369BB0[];
extern const u8 gUnk_08369C90[];
extern const u8 gUnk_08369E54[];
extern const u8 gUnk_0836A0A8[];
extern const u8 gUnk_0836A2AC[];
extern const u8 gUnk_0836A48C[];
extern const u8 gUnk_0836A5B0[];
extern const u8 gUnk_0836A7B4[];
extern const u8 gUnk_0836A940[];
extern const u8 gUnk_0836AA64[];
extern const u8 gUnk_0836ABAC[];
extern const u8 gUnk_0836ACE4[];
extern const u8 gUnk_0836AE00[];
extern const u8 gUnk_0836AF00[];
extern const u8 gUnk_0836B01C[];
extern const u8 gUnk_0836EC28[];
extern const u8 gUnk_08B95D38[];
extern const u8 gUnk_08B95DC0[];
extern const u8 gUnk_08B95E08[];
extern const u8 gUnk_08B95F50[];
extern const u8 gUnk_08B95F98[];
extern const u8 gUnk_08B95FE0[];
extern const u8 gUnk_08B960A0[];
extern const u8 gUnk_08CE1D20[];
extern const u8 gUnk_08CE1D6C[];
extern const u8 gUnk_08CE1DB8[];
extern const u8 gUnk_08CE1EC0[];
extern const u8 gUnk_08CE1F88[];
extern const u8 gUnk_08CE1FE4[];
extern const u8 gUnk_08CE2058[];
extern const u8 gUnk_08CE2090[];
extern const u8 gUnk_08CE20D4[];
extern const u8 gUnk_08CE2114[];
extern const u8 gUnk_08CE2158[];
extern const u8 gUnk_08CE21E4[];
extern const u8 gUnk_08CE2244[];
extern const u8 gUnk_08CE22EC[];
extern const u8 gUnk_08CE238C[];
extern const u8 gUnk_08CE23E0[];
extern const u8 gUnk_08CE245C[];
extern const u8 gUnk_08CE24BC[];
extern const u8 gUnk_08CE254C[];
extern const u8 gUnk_08CE27F0[];
extern const u8 gUnk_08CE2834[];
extern const u8 gUnk_08CE2874[];
extern const u8 gUnk_08CE28AC[];
extern const u8 gUnk_08CE2968[];
extern const u8 gUnk_08CE2A70[];
extern const u8 gUnk_08CE2B04[];
extern const u8 gUnk_08CE2BF4[];
extern const u8 gUnk_08CE2D30[];
extern const u8 gUnk_08CE2DA4[];
extern const u8 gUnk_08CE2E0C[];
extern const u8 gUnk_08CE2E44[];
extern const u8 gUnk_08CE2E78[];
extern const u8 gUnk_08CE3178[];
extern const u8 gUnk_08CE3214[];
extern const u8 gUnk_08CE341C[];
extern const u8 gUnk_08CE3634[];
extern const u8 gUnk_08CE3664[];
extern const u8 gUnk_08CE36B4[];
extern const u8 gUnk_08CE3700[];
extern const u8 gUnk_08CE3790[];
extern const u8 gUnk_08CE3810[];
extern const u8 gUnk_08CE39B4[];
extern const u8 gUnk_08CE3A38[];
extern const u8 gUnk_08CE3A60[];
extern const u8 gUnk_08CE3B40[];
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
    [0x01] = (void const *) gUnk_0834C74C, // img_a: CHAPTER_00, CHAPTER_01
    [0x02] = (void const *) gUnk_08362E78, // pal: CHAPTER_00
    [0x03] = (void const *) gUnk_0835EE10, // tileset: CHAPTER_00, CHAPTER_01
    [0x04] = (void const *) gUnk_0836AF00, // map: CHAPTER_00
    [0x05] = (void const *) gUnk_08B95D38, // img_anims: CHAPTER_00, CHAPTER_01, CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_27, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x06] = (void const *) ChapterEvents_Ch00, // events: CHAPTER_00
    [0x07] = (void const *) gUnk_08362D38, // pal: CHAPTER_01
    [0x08] = (void const *) gUnk_0836AE00, // map: CHAPTER_01
    [0x09] = (void const *) ChapterEvents_Ch01, // events: CHAPTER_01
    [0x0A] = (void const *) gUnk_083464F0, // img_a: CHAPTER_02, CHAPTER_08, CHAPTER_0D, CHAPTER_12, CHAPTER_14, CHAPTER_1E, CHAPTER_25, CHAPTER_26, CHAPTER_2A, 0x31, 0x32, 0x37, 0x38, 0x3F
    [0x0B] = (void const *) gUnk_08362BF8, // pal: CHAPTER_02
    [0x0C] = (void const *) gUnk_0835DB50, // tileset: CHAPTER_02, CHAPTER_08, CHAPTER_0D, CHAPTER_12, CHAPTER_14, CHAPTER_1E, CHAPTER_25, CHAPTER_26, CHAPTER_2A, 0x31, 0x32, 0x37, 0x38, 0x3F
    [0x0D] = (void const *) gUnk_0836ACE4, // map: CHAPTER_02
    [0x0E] = (void const *) gUnk_08CE1D20, // map_changes: CHAPTER_02
    [0x0F] = (void const *) ChapterEvents_Ch02, // events: CHAPTER_02
    [0x10] = (void const *) gUnk_0833F2C8, // img_a: CHAPTER_03, CHAPTER_06, CHAPTER_15, CHAPTER_1B, CHAPTER_20, CHAPTER_2B, 0x30, 0x39, 0x3D
    [0x11] = (void const *) gUnk_08362AB8, // pal: CHAPTER_03
    [0x12] = (void const *) gUnk_0835C63C, // tileset: CHAPTER_03, CHAPTER_06, CHAPTER_15, CHAPTER_1B, CHAPTER_20, CHAPTER_2B, 0x30, 0x39, 0x3D
    [0x13] = (void const *) gUnk_0836ABAC, // map: CHAPTER_03
    [0x14] = (void const *) gUnk_08CE1D6C, // map_changes: CHAPTER_03
    [0x15] = (void const *) ChapterEvents_Ch03, // events: CHAPTER_03
    [0x16] = (void const *) gUnk_0833BC70, // img_a: CHAPTER_04, CHAPTER_1C, 0x36, 0x41
    [0x17] = (void const *) gUnk_08362978, // pal: CHAPTER_04
    [0x18] = (void const *) gUnk_0835B72C, // tileset: CHAPTER_04, CHAPTER_1C, 0x36, 0x41
    [0x19] = (void const *) gUnk_0836AA64, // map: CHAPTER_04
    [0x1A] = (void const *) gUnk_08CE1DB8, // map_changes: CHAPTER_04
    [0x1B] = (void const *) ChapterEvents_Ch04, // events: CHAPTER_04
    [0x1C] = (void const *) gUnk_0836B01C, // img_a: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x1D] = (void const *) gUnk_0836EC28, // img_b: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x1E] = (void const *) gUnk_08362838, // pal: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_13, CHAPTER_1F, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3C, 0x3E, 0x42
    [0x1F] = (void const *) gUnk_08359F3C, // tileset: CHAPTER_05, CHAPTER_07, CHAPTER_09, CHAPTER_0A, CHAPTER_0B, CHAPTER_0C, CHAPTER_0E, CHAPTER_0F, CHAPTER_10, CHAPTER_11, CHAPTER_13, CHAPTER_17, CHAPTER_18, CHAPTER_1F, CHAPTER_21, CHAPTER_22, CHAPTER_2C, 0x33, 0x34, 0x3A, 0x3C, 0x3E, 0x42
    [0x20] = (void const *) gUnk_0836A940, // map: CHAPTER_05
    [0x21] = (void const *) ChapterEvents_Ch05, // events: CHAPTER_05
    [0x22] = (void const *) gUnk_083626F8, // pal: CHAPTER_06
    [0x23] = (void const *) gUnk_0836A7B4, // map: CHAPTER_06
    [0x24] = (void const *) gUnk_08CE1EC0, // map_changes: CHAPTER_06
    [0x25] = (void const *) ChapterEvents_Ch06, // events: CHAPTER_06
    [0x26] = (void const *) gUnk_0836A5B0, // map: CHAPTER_07
    [0x27] = (void const *) gUnk_08CE1F88, // map_changes: CHAPTER_07
    [0x28] = (void const *) ChapterEvents_Ch07, // events: CHAPTER_07
    [0x29] = (void const *) gUnk_083625B8, // pal: CHAPTER_08, 0x31
    [0x2A] = (void const *) gUnk_0836A48C, // map: CHAPTER_08
    [0x2B] = (void const *) gUnk_08CE1FE4, // map_changes: CHAPTER_08
    [0x2C] = (void const *) ChapterEvents_Ch08, // events: CHAPTER_08
    [0x2D] = (void const *) gUnk_0836A2AC, // map: CHAPTER_09
    [0x2E] = (void const *) gUnk_08CE2058, // map_changes: CHAPTER_09
    [0x2F] = (void const *) ChapterEvents_Ch09, // events: CHAPTER_09
    [0x30] = (void const *) gUnk_0836A0A8, // map: CHAPTER_0A
    [0x31] = (void const *) gUnk_08CE2090, // map_changes: CHAPTER_0A
    [0x32] = (void const *) ChapterEvents_Ch0A, // events: CHAPTER_0A
    [0x33] = (void const *) gUnk_08362478, // pal: CHAPTER_0B
    [0x34] = (void const *) gUnk_08369E54, // map: CHAPTER_0B
    [0x35] = (void const *) gUnk_08CE20D4, // map_changes: CHAPTER_0B
    [0x36] = (void const *) ChapterEvents_Ch0B, // events: CHAPTER_0B
    [0x37] = (void const *) gUnk_08369C90, // map: CHAPTER_0C
    [0x38] = (void const *) gUnk_08CE2114, // map_changes: CHAPTER_0C
    [0x39] = (void const *) ChapterEvents_Ch0C, // events: CHAPTER_0C
    [0x3A] = (void const *) gUnk_08362338, // pal: CHAPTER_0D, CHAPTER_12, CHAPTER_2A, 0x32, 0x38, 0x3F
    [0x3B] = (void const *) gUnk_08369BB0, // map: CHAPTER_0D
    [0x3C] = (void const *) gUnk_08CE2158, // map_changes: CHAPTER_0D
    [0x3D] = (void const *) ChapterEvents_Ch0D, // events: CHAPTER_0D
    [0x3E] = (void const *) gUnk_083699AC, // map: CHAPTER_0E
    [0x3F] = (void const *) gUnk_08CE21E4, // map_changes: CHAPTER_0E
    [0x40] = (void const *) ChapterEvents_Ch0E, // events: CHAPTER_0E
    [0x41] = (void const *) gUnk_08369750, // map: CHAPTER_0F
    [0x42] = (void const *) gUnk_08CE2244, // map_changes: CHAPTER_0F
    [0x43] = (void const *) ChapterEvents_Ch0F, // events: CHAPTER_0F
    [0x44] = (void const *) gUnk_083621F8, // pal: CHAPTER_10
    [0x45] = (void const *) gUnk_0836959C, // map: CHAPTER_10
    [0x46] = (void const *) gUnk_08CE22EC, // map_changes: CHAPTER_10
    [0x47] = (void const *) ChapterEvents_Ch10, // events: CHAPTER_10
    [0x48] = (void const *) gUnk_083620B8, // pal: CHAPTER_11
    [0x49] = (void const *) gUnk_0836927C, // map: CHAPTER_11
    [0x4A] = (void const *) gUnk_08CE238C, // map_changes: CHAPTER_11
    [0x4B] = (void const *) ChapterEvents_Ch11, // events: CHAPTER_11
    [0x4C] = (void const *) gUnk_0836913C, // map: CHAPTER_12
    [0x4D] = (void const *) gUnk_08CE23E0, // map_changes: CHAPTER_12
    [0x4E] = (void const *) ChapterEvents_Ch12, // events: CHAPTER_12
    [0x4F] = (void const *) gUnk_08368E68, // map: CHAPTER_13
    [0x50] = (void const *) gUnk_08CE245C, // map_changes: CHAPTER_13
    [0x51] = (void const *) ChapterEvents_Ch13, // events: CHAPTER_13
    [0x52] = (void const *) gUnk_08361F78, // pal: CHAPTER_14
    [0x53] = (void const *) gUnk_08368C98, // map: CHAPTER_14
    [0x54] = (void const *) gUnk_08CE24BC, // map_changes: CHAPTER_14
    [0x55] = (void const *) ChapterEvents_Ch14, // events: CHAPTER_14
    [0x56] = (void const *) gUnk_08361E38, // pal: CHAPTER_15, CHAPTER_20
    [0x57] = (void const *) gUnk_08368A6C, // map: CHAPTER_15
    [0x58] = (void const *) gUnk_08B95E08, // img_anims: CHAPTER_15, CHAPTER_1B, CHAPTER_20, CHAPTER_2B, 0x39, 0x3D
    [0x59] = (void const *) gUnk_08CE254C, // map_changes: CHAPTER_15
    [0x5A] = (void const *) ChapterEvents_Ch15, // events: CHAPTER_15
    [0x5B] = (void const *) gUnk_08336F24, // img_a: CHAPTER_16
    [0x5C] = (void const *) gUnk_08361CF8, // pal: CHAPTER_16
    [0x5D] = (void const *) gUnk_08359304, // tileset: CHAPTER_16
    [0x5E] = (void const *) gUnk_0836889C, // map: CHAPTER_16
    [0x5F] = (void const *) gUnk_08B95DC0, // img_anims: CHAPTER_16
    [0x60] = (void const *) gUnk_08CE27F0, // map_changes: CHAPTER_16
    [0x61] = (void const *) ChapterEvents_Ch16, // events: CHAPTER_16
    [0x62] = (void const *) gUnk_08361BB8, // pal: CHAPTER_17
    [0x63] = (void const *) gUnk_08368650, // map: CHAPTER_17
    [0x64] = (void const *) gUnk_08CE2834, // map_changes: CHAPTER_17
    [0x65] = (void const *) ChapterEvents_Ch17, // events: CHAPTER_17
    [0x66] = (void const *) gUnk_08361A78, // pal: CHAPTER_18
    [0x67] = (void const *) gUnk_08368438, // map: CHAPTER_18
    [0x68] = (void const *) gUnk_08CE2874, // map_changes: CHAPTER_18
    [0x69] = (void const *) ChapterEvents_Ch18, // events: CHAPTER_18
    [0x6A] = (void const *) gUnk_08330140, // img_a: CHAPTER_19, CHAPTER_1A, CHAPTER_27, CHAPTER_2D, 0x35
    [0x6B] = (void const *) gUnk_08361938, // pal: CHAPTER_19, CHAPTER_1A, CHAPTER_27
    [0x6C] = (void const *) gUnk_0835801C, // tileset: CHAPTER_19, CHAPTER_1A, CHAPTER_27, CHAPTER_2D, 0x35
    [0x6D] = (void const *) gUnk_0836821C, // map: CHAPTER_19
    [0x6E] = (void const *) gUnk_08CE28AC, // map_changes: CHAPTER_19
    [0x6F] = (void const *) ChapterEvents_Ch19, // events: CHAPTER_19
    [0x70] = (void const *) gUnk_08367FAC, // map: CHAPTER_1A
    [0x71] = (void const *) gUnk_08CE2968, // map_changes: CHAPTER_1A
    [0x72] = (void const *) ChapterEvents_Ch1A, // events: CHAPTER_1A
    [0x73] = (void const *) gUnk_083617F8, // pal: CHAPTER_1B
    [0x74] = (void const *) gUnk_08367D3C, // map: CHAPTER_1B
    [0x75] = (void const *) gUnk_08CE2A70, // map_changes: CHAPTER_1B
    [0x76] = (void const *) ChapterEvents_Ch1B, // events: CHAPTER_1B
    [0x77] = (void const *) gUnk_083616B8, // pal: CHAPTER_1C, 0x36, 0x41
    [0x78] = (void const *) gUnk_08367A80, // map: CHAPTER_1C
    [0x79] = (void const *) gUnk_08CE2B04, // map_changes: CHAPTER_1C
    [0x7A] = (void const *) ChapterEvents_Ch1C, // events: CHAPTER_1C
    [0x7B] = (void const *) gUnk_08329534, // img_a: CHAPTER_1D
    [0x7C] = (void const *) gUnk_08361578, // pal: CHAPTER_1D
    [0x7D] = (void const *) gUnk_08356FD0, // tileset: CHAPTER_1D
    [0x7E] = (void const *) gUnk_0836785C, // map: CHAPTER_1D
    [0x7F] = (void const *) ChapterEvents_Ch1D, // events: CHAPTER_1D
    [0x80] = (void const *) gUnk_08361438, // pal: CHAPTER_1E
    [0x81] = (void const *) gUnk_0836768C, // map: CHAPTER_1E
    [0x82] = (void const *) gUnk_08CE2BF4, // map_changes: CHAPTER_1E
    [0x83] = (void const *) ChapterEvents_Ch1E, // events: CHAPTER_1E
    [0x84] = (void const *) gUnk_08367324, // map: CHAPTER_1F
    [0x85] = (void const *) gUnk_08CE2D30, // map_changes: CHAPTER_1F
    [0x86] = (void const *) ChapterEvents_Ch1F, // events: CHAPTER_1F
    [0x87] = (void const *) gUnk_08367064, // map: CHAPTER_20
    [0x88] = (void const *) gUnk_08CE2DA4, // map_changes: CHAPTER_20
    [0x89] = (void const *) ChapterEvents_Ch20, // events: CHAPTER_20
    [0x8A] = (void const *) gUnk_083612F8, // pal: CHAPTER_21
    [0x8B] = (void const *) gUnk_08366D04, // map: CHAPTER_21
    [0x8C] = (void const *) gUnk_08CE2E0C, // map_changes: CHAPTER_21
    [0x8D] = (void const *) ChapterEvents_Ch21, // events: CHAPTER_21
    [0x8E] = (void const *) gUnk_08366950, // map: CHAPTER_22
    [0x8F] = (void const *) gUnk_08CE2E44, // map_changes: CHAPTER_22
    [0x90] = (void const *) ChapterEvents_Ch22, // events: CHAPTER_22
    [0x91] = (void const *) gUnk_083230BC, // img_a: CHAPTER_23, CHAPTER_24, 0x3B
    [0x92] = (void const *) gUnk_083611B8, // pal: CHAPTER_23, CHAPTER_24, 0x3B
    [0x93] = (void const *) gUnk_0835580C, // tileset: CHAPTER_23, CHAPTER_24, 0x3B
    [0x94] = (void const *) gUnk_08366608, // map: CHAPTER_23
    [0x95] = (void const *) gUnk_08CE2E78, // map_changes: CHAPTER_23
    [0x96] = (void const *) ChapterEvents_Ch23, // events: CHAPTER_23
    [0x97] = (void const *) gUnk_08366378, // map: CHAPTER_24
    [0x98] = (void const *) gUnk_08B95FE0, // pal_anims: CHAPTER_24
    [0x99] = (void const *) gUnk_08CE3178, // map_changes: CHAPTER_24
    [0x9A] = (void const *) ChapterEvents_Ch24, // events: CHAPTER_24
    [0x9B] = (void const *) gUnk_08361078, // pal: CHAPTER_25
    [0x9C] = (void const *) gUnk_08366090, // map: CHAPTER_25
    [0x9D] = (void const *) gUnk_08CE3214, // map_changes: CHAPTER_25
    [0x9E] = (void const *) ChapterEvents_Ch25, // events: CHAPTER_25
    [0x9F] = (void const *) gUnk_08360F38, // pal: CHAPTER_26
    [0xA0] = (void const *) gUnk_08365E98, // map: CHAPTER_26
    [0xA1] = (void const *) gUnk_08B95F98, // img_anims: CHAPTER_26, 0x37
    [0xA2] = (void const *) gUnk_08CE341C, // map_changes: CHAPTER_26
    [0xA3] = (void const *) ChapterEvents_Ch26, // events: CHAPTER_26
    [0xA4] = (void const *) gUnk_08365980, // map: CHAPTER_27
    [0xA5] = (void const *) gUnk_08CE3634, // map_changes: CHAPTER_27
    [0xA6] = (void const *) ChapterEvents_Ch27, // events: CHAPTER_27
    [0xA7] = (void const *) gUnk_0831DE34, // img_a: CHAPTER_28
    [0xA8] = (void const *) gUnk_08360DF8, // pal: CHAPTER_28
    [0xA9] = (void const *) gUnk_08354854, // tileset: CHAPTER_28
    [0xAA] = (void const *) gUnk_083656A8, // map: CHAPTER_28
    [0xAB] = (void const *) gUnk_08B960A0, // pal_anims: CHAPTER_28
    [0xAC] = (void const *) gUnk_08CE3664, // map_changes: CHAPTER_28
    [0xAD] = (void const *) ChapterEvents_Ch28, // events: CHAPTER_28
    [0xAE] = (void const *) gUnk_0831ACB0, // img_a: CHAPTER_29
    [0xAF] = (void const *) gUnk_08360CB8, // pal: CHAPTER_29
    [0xB0] = (void const *) gUnk_08353EFC, // tileset: CHAPTER_29
    [0xB1] = (void const *) gUnk_083653D0, // map: CHAPTER_29
    [0xB2] = (void const *) gUnk_08CE36B4, // map_changes: CHAPTER_29
    [0xB3] = (void const *) ChapterEvents_Ch29, // events: CHAPTER_29
    [0xB4] = (void const *) gUnk_08365154, // map: CHAPTER_2A
    [0xB5] = (void const *) gUnk_08CE3700, // map_changes: CHAPTER_2A
    [0xB6] = (void const *) ChapterEvents_Ch2A, // events: CHAPTER_2A
    [0xB7] = (void const *) gUnk_08360B78, // pal: CHAPTER_2B, 0x39
    [0xB8] = (void const *) gUnk_0836503C, // map: CHAPTER_2B
    [0xB9] = (void const *) ChapterEvents_Ch2B, // events: CHAPTER_2B
    [0xBA] = (void const *) gUnk_08364B34, // map: CHAPTER_2C
    [0xBB] = (void const *) gUnk_08CE3790, // map_changes: CHAPTER_2C
    [0xBC] = (void const *) ChapterEvents_Ch2C, // events: CHAPTER_2C
    [0xBD] = (void const *) gUnk_08360A38, // pal: CHAPTER_2D
    [0xBE] = (void const *) gUnk_08364958, // map: CHAPTER_2D
    [0xBF] = (void const *) gUnk_08CE3810, // map_changes: CHAPTER_2D
    [0xC0] = (void const *) ChapterEvents_Ch2D, // events: CHAPTER_2D
    [0xC1] = (void const *) gUnk_083154BC, // img_a: CHAPTER_2E, CHAPTER_2F, 0x40
    [0xC2] = (void const *) gUnk_083608F8, // pal: CHAPTER_2E, CHAPTER_2F, 0x40
    [0xC3] = (void const *) gUnk_0835334C, // tileset: CHAPTER_2E, CHAPTER_2F, 0x40
    [0xC4] = (void const *) gUnk_08364754, // map: CHAPTER_2E
    [0xC5] = (void const *) gUnk_08B95F50, // img_anims: CHAPTER_2E, CHAPTER_2F
    [0xC6] = (void const *) gUnk_08CE39B4, // map_changes: CHAPTER_2E
    [0xC7] = (void const *) ChapterEvents_Ch2E, // events: CHAPTER_2E
    [0xC8] = (void const *) gUnk_083644C0, // map: CHAPTER_2F
    [0xC9] = (void const *) gUnk_08CE3A38, // map_changes: CHAPTER_2F
    [0xCA] = (void const *) ChapterEvents_Ch2F, // events: CHAPTER_2F
    [0xCB] = (void const *) gUnk_083607B8, // pal: 0x30
    [0xCC] = (void const *) gUnk_083643CC, // map: 0x30
    [0xCD] = (void const *) ChapterEvents_Ch30, // events: 0x30
    [0xCE] = (void const *) gUnk_083642E8, // map: 0x31
    [0xCF] = (void const *) gUnk_08CE3A60, // map_changes: 0x31
    [0xD0] = (void const *) ChapterEvents_Ch31, // events: 0x31
    [0xD1] = (void const *) gUnk_0836423C, // map: 0x32
    [0xD2] = (void const *) ChapterEvents_Ch32, // events: 0x32
    [0xD3] = (void const *) gUnk_08364108, // map: 0x33
    [0xD4] = (void const *) ChapterEvents_Ch33, // events: 0x33
    [0xD5] = (void const *) gUnk_08363FE4, // map: 0x34
    [0xD6] = (void const *) ChapterEvents_Ch34, // events: 0x34
    [0xD7] = (void const *) gUnk_08360678, // pal: 0x35
    [0xD8] = (void const *) gUnk_08363E80, // map: 0x35
    [0xD9] = (void const *) ChapterEvents_Ch35, // events: 0x35
    [0xDA] = (void const *) gUnk_08363D2C, // map: 0x36
    [0xDB] = (void const *) ChapterEvents_Ch36, // events: 0x36
    [0xDC] = (void const *) gUnk_08360538, // pal: 0x37
    [0xDD] = (void const *) gUnk_08363C58, // map: 0x37
    [0xDE] = (void const *) ChapterEvents_Ch37, // events: 0x37
    [0xDF] = (void const *) gUnk_08363B7C, // map: 0x38
    [0xE0] = (void const *) ChapterEvents_Ch38, // events: 0x38
    [0xE1] = (void const *) gUnk_08363A38, // map: 0x39
    [0xE2] = (void const *) ChapterEvents_Ch39, // events: 0x39
    [0xE3] = (void const *) gUnk_083603F8, // pal: 0x3A
    [0xE4] = (void const *) gUnk_08363900, // map: 0x3A
    [0xE5] = (void const *) ChapterEvents_Ch3A, // events: 0x3A
    [0xE6] = (void const *) gUnk_08363800, // map: 0x3B
    [0xE7] = (void const *) ChapterEvents_Ch3B, // events: 0x3B
    [0xE8] = (void const *) gUnk_083636F4, // map: 0x3C
    [0xE9] = (void const *) ChapterEvents_Ch3C, // events: 0x3C
    [0xEA] = (void const *) gUnk_083602B8, // pal: 0x3D
    [0xEB] = (void const *) gUnk_083635B0, // map: 0x3D
    [0xEC] = (void const *) ChapterEvents_Ch3D, // events: 0x3D
    [0xED] = (void const *) gUnk_08363474, // map: 0x3E
    [0xEE] = (void const *) ChapterEvents_Ch3E, // events: 0x3E
    [0xEF] = (void const *) gUnk_08363328, // map: 0x3F
    [0xF0] = (void const *) ChapterEvents_Ch3F, // events: 0x3F
    [0xF1] = (void const *) gUnk_083631C8, // map: 0x40
    [0xF2] = (void const *) gUnk_08CE3B40, // map_changes: 0x40
    [0xF3] = (void const *) ChapterEvents_Ch40, // events: 0x40
    [0xF4] = (void const *) gUnk_083630C0, // map: 0x41
    [0xF5] = (void const *) gUnk_08362FB8, // map: 0x42
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
