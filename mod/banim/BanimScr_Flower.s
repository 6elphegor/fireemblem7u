@ Battle animation script of the flower character (mod/claude/art/battle.py):
@ the Mage's timeline (banim 058) with the flower's frames.

	.include "banim_script.inc"

	banim_script BanimScr_Flower


	banim_mode 1  @ NORMAL_ATK
	banim_cmd 0x3
	banim_cmd 0x7
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_frame 4, 1, Img_Banim_Flower_Sheet0, 0x30
	banim_cmd 0x1b
	banim_frame 4, 2, Img_Banim_Flower_Sheet0, 0x60
	banim_frame 4, 3, Img_Banim_Flower_Sheet0, 0x90
	banim_cmd 0x1b
	banim_frame 4, 4, Img_Banim_Flower_Sheet0, 0xc0
	banim_cmd 0x2e
	banim_frame 4, 5, Img_Banim_Flower_Sheet1, 0xf0
	banim_frame 4, 6, Img_Banim_Flower_Sheet1, 0x120
	banim_frame 8, 7, Img_Banim_Flower_Sheet1, 0x150
	banim_frame 4, 8, Img_Banim_Flower_Sheet1, 0x180
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 9, Img_Banim_Flower_Sheet1, 0x1bc
	banim_frame 2, 10, Img_Banim_Flower_Sheet2, 0x1ec
	banim_frame 2, 11, Img_Banim_Flower_Sheet2, 0x21c
	banim_frame 1, 39, Img_Banim_Flower_Sheet7, 0x768
	banim_cmd 0x1
	banim_frame 2, 12, Img_Banim_Flower_Sheet2, 0x240
	banim_frame 2, 13, Img_Banim_Flower_Sheet2, 0x264
	banim_frame 2, 14, Img_Banim_Flower_Sheet2, 0x288
	banim_frame 8, 15, Img_Banim_Flower_Sheet2, 0x2ac
	banim_frame 2, 16, Img_Banim_Flower_Sheet3, 0x2d0
	banim_frame 4, 17, Img_Banim_Flower_Sheet3, 0x2f4
	banim_frame 5, 18, Img_Banim_Flower_Sheet3, 0x318
	banim_cmd 0x1b
	banim_frame 2, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x6
	banim_frame 3, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x1b
	banim_frame 3, 20, Img_Banim_Flower_Sheet3, 0x360
	banim_cmd 0xd
	banim_end_mode

	banim_mode 2  @ NORMAL_ATK_PRIORITY_L
	banim_cmd 0x3
	banim_cmd 0x7
	banim_frame 1, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x1b
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x1b
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x2e
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 8, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 2, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 1, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_cmd 0x1
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 8, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 4, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 5, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_cmd 0x1b
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_cmd 0x6
	banim_frame 3, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_cmd 0x1b
	banim_frame 3, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0xd
	banim_end_mode

	banim_mode 3  @ CRIT_ATK
	banim_cmd 0x3
	banim_cmd 0x7
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_frame 4, 21, Img_Banim_Flower_Sheet3, 0x384
	banim_cmd 0x1b
	banim_frame 4, 22, Img_Banim_Flower_Sheet4, 0x3c0
	banim_frame 4, 23, Img_Banim_Flower_Sheet4, 0x3f0
	banim_cmd 0x1b
	banim_frame 4, 24, Img_Banim_Flower_Sheet4, 0x420
	banim_frame 4, 25, Img_Banim_Flower_Sheet4, 0x45c
	banim_cmd 0x2f
	banim_frame 3, 26, Img_Banim_Flower_Sheet5, 0x498
	banim_frame 8, 34, Img_Banim_Flower_Sheet6, 0x5f4
	banim_frame 3, 35, Img_Banim_Flower_Sheet6, 0x648
	banim_frame 8, 36, Img_Banim_Flower_Sheet7, 0x69c
	banim_frame 3, 37, Img_Banim_Flower_Sheet7, 0x6fc
	banim_frame 11, 38, Img_Banim_Flower_Sheet7, 0x744
	banim_frame 4, 1, Img_Banim_Flower_Sheet0, 0x30
	banim_frame 4, 2, Img_Banim_Flower_Sheet0, 0x60
	banim_cmd 0x1b
	banim_frame 4, 3, Img_Banim_Flower_Sheet0, 0x90
	banim_frame 4, 4, Img_Banim_Flower_Sheet0, 0xc0
	banim_cmd 0x2e
	banim_frame 4, 5, Img_Banim_Flower_Sheet1, 0xf0
	banim_frame 4, 6, Img_Banim_Flower_Sheet1, 0x120
	banim_frame 8, 7, Img_Banim_Flower_Sheet1, 0x150
	banim_frame 4, 8, Img_Banim_Flower_Sheet1, 0x180
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 9, Img_Banim_Flower_Sheet1, 0x1bc
	banim_frame 2, 10, Img_Banim_Flower_Sheet2, 0x1ec
	banim_frame 2, 11, Img_Banim_Flower_Sheet2, 0x21c
	banim_frame 1, 39, Img_Banim_Flower_Sheet7, 0x768
	banim_cmd 0x1
	banim_frame 2, 12, Img_Banim_Flower_Sheet2, 0x240
	banim_frame 2, 13, Img_Banim_Flower_Sheet2, 0x264
	banim_frame 2, 14, Img_Banim_Flower_Sheet2, 0x288
	banim_frame 8, 15, Img_Banim_Flower_Sheet2, 0x2ac
	banim_frame 2, 16, Img_Banim_Flower_Sheet3, 0x2d0
	banim_frame 4, 17, Img_Banim_Flower_Sheet3, 0x2f4
	banim_frame 5, 18, Img_Banim_Flower_Sheet3, 0x318
	banim_cmd 0x1b
	banim_frame 2, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x6
	banim_frame 3, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x1b
	banim_frame 3, 20, Img_Banim_Flower_Sheet3, 0x360
	banim_cmd 0xd
	banim_end_mode

	banim_mode 4  @ CRIT_ATK_PRIORITY_L
	banim_cmd 0x3
	banim_cmd 0x7
	banim_frame 1, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 32, Img_Banim_Flower_Sheet6, 0x5a0
	banim_cmd 0x1b
	banim_frame 4, 32, Img_Banim_Flower_Sheet6, 0x5a0
	banim_frame 4, 32, Img_Banim_Flower_Sheet6, 0x5a0
	banim_cmd 0x1b
	banim_frame 4, 32, Img_Banim_Flower_Sheet6, 0x5a0
	banim_frame 4, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_cmd 0x2f
	banim_frame 3, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_frame 8, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_frame 3, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_frame 8, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_frame 3, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_frame 11, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x1b
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x2e
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 8, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 4, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 2, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 1, 33, Img_Banim_Flower_Sheet6, 0x5c4
	banim_cmd 0x1
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 8, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 4, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_frame 5, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_cmd 0x1b
	banim_frame 2, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_cmd 0x6
	banim_frame 3, 31, Img_Banim_Flower_Sheet5, 0x57c
	banim_cmd 0x1b
	banim_frame 3, 29, Img_Banim_Flower_Sheet5, 0x54c
	banim_cmd 0xd
	banim_end_mode

	banim_mode 5  @ RANGED_ATK
	banim_cmd 0x3
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_frame 4, 1, Img_Banim_Flower_Sheet0, 0x30
	banim_cmd 0x1b
	banim_frame 4, 2, Img_Banim_Flower_Sheet0, 0x60
	banim_frame 4, 3, Img_Banim_Flower_Sheet0, 0x90
	banim_cmd 0x1b
	banim_frame 4, 4, Img_Banim_Flower_Sheet0, 0xc0
	banim_cmd 0x2e
	banim_frame 4, 5, Img_Banim_Flower_Sheet1, 0xf0
	banim_frame 4, 6, Img_Banim_Flower_Sheet1, 0x120
	banim_frame 8, 7, Img_Banim_Flower_Sheet1, 0x150
	banim_frame 4, 8, Img_Banim_Flower_Sheet1, 0x180
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 9, Img_Banim_Flower_Sheet1, 0x1bc
	banim_frame 2, 10, Img_Banim_Flower_Sheet2, 0x1ec
	banim_frame 2, 11, Img_Banim_Flower_Sheet2, 0x21c
	banim_frame 1, 39, Img_Banim_Flower_Sheet7, 0x768
	banim_cmd 0x1
	banim_frame 2, 12, Img_Banim_Flower_Sheet2, 0x240
	banim_frame 2, 13, Img_Banim_Flower_Sheet2, 0x264
	banim_frame 2, 14, Img_Banim_Flower_Sheet2, 0x288
	banim_frame 8, 15, Img_Banim_Flower_Sheet2, 0x2ac
	banim_frame 2, 16, Img_Banim_Flower_Sheet3, 0x2d0
	banim_frame 4, 17, Img_Banim_Flower_Sheet3, 0x2f4
	banim_frame 5, 18, Img_Banim_Flower_Sheet3, 0x318
	banim_cmd 0x1b
	banim_frame 2, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x6
	banim_frame 3, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x1b
	banim_frame 3, 20, Img_Banim_Flower_Sheet3, 0x360
	banim_cmd 0xd
	banim_end_mode

	banim_mode 6  @ RANGED_CRIT_ATK
	banim_cmd 0x3
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_frame 4, 21, Img_Banim_Flower_Sheet3, 0x384
	banim_cmd 0x1b
	banim_frame 4, 22, Img_Banim_Flower_Sheet4, 0x3c0
	banim_frame 4, 23, Img_Banim_Flower_Sheet4, 0x3f0
	banim_cmd 0x1b
	banim_frame 4, 24, Img_Banim_Flower_Sheet4, 0x420
	banim_frame 4, 25, Img_Banim_Flower_Sheet4, 0x45c
	banim_cmd 0x2f
	banim_frame 3, 26, Img_Banim_Flower_Sheet5, 0x498
	banim_frame 8, 34, Img_Banim_Flower_Sheet6, 0x5f4
	banim_frame 3, 35, Img_Banim_Flower_Sheet6, 0x648
	banim_frame 8, 36, Img_Banim_Flower_Sheet7, 0x69c
	banim_frame 3, 37, Img_Banim_Flower_Sheet7, 0x6fc
	banim_frame 11, 38, Img_Banim_Flower_Sheet7, 0x744
	banim_frame 4, 1, Img_Banim_Flower_Sheet0, 0x30
	banim_frame 4, 2, Img_Banim_Flower_Sheet0, 0x60
	banim_cmd 0x1b
	banim_frame 4, 3, Img_Banim_Flower_Sheet0, 0x90
	banim_frame 4, 4, Img_Banim_Flower_Sheet0, 0xc0
	banim_cmd 0x2e
	banim_frame 4, 5, Img_Banim_Flower_Sheet1, 0xf0
	banim_frame 4, 6, Img_Banim_Flower_Sheet1, 0x120
	banim_frame 8, 7, Img_Banim_Flower_Sheet1, 0x150
	banim_frame 4, 8, Img_Banim_Flower_Sheet1, 0x180
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 9, Img_Banim_Flower_Sheet1, 0x1bc
	banim_frame 2, 10, Img_Banim_Flower_Sheet2, 0x1ec
	banim_frame 2, 11, Img_Banim_Flower_Sheet2, 0x21c
	banim_frame 1, 39, Img_Banim_Flower_Sheet7, 0x768
	banim_cmd 0x1
	banim_frame 2, 12, Img_Banim_Flower_Sheet2, 0x240
	banim_frame 2, 13, Img_Banim_Flower_Sheet2, 0x264
	banim_frame 2, 14, Img_Banim_Flower_Sheet2, 0x288
	banim_frame 8, 15, Img_Banim_Flower_Sheet2, 0x2ac
	banim_frame 2, 16, Img_Banim_Flower_Sheet3, 0x2d0
	banim_frame 4, 17, Img_Banim_Flower_Sheet3, 0x2f4
	banim_frame 5, 18, Img_Banim_Flower_Sheet3, 0x318
	banim_cmd 0x1b
	banim_frame 2, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x6
	banim_frame 3, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x1b
	banim_frame 3, 20, Img_Banim_Flower_Sheet3, 0x360
	banim_cmd 0xd
	banim_end_mode

	banim_mode 7  @ CLOSE_DODGE
	banim_cmd 0x2
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_cmd 0xe
	banim_frame 3, 27, Img_Banim_Flower_Sheet5, 0x4ec
	banim_frame 1, 28, Img_Banim_Flower_Sheet5, 0x51c
	banim_cmd 0x1
	banim_frame 3, 27, Img_Banim_Flower_Sheet5, 0x4ec
	banim_cmd 0xd
	banim_end_mode

	banim_mode 8  @ RANGED_DODGE
	banim_cmd 0x2
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_cmd 0xe
	banim_frame 3, 27, Img_Banim_Flower_Sheet5, 0x4ec
	banim_frame 1, 28, Img_Banim_Flower_Sheet5, 0x51c
	banim_cmd 0x1
	banim_frame 3, 27, Img_Banim_Flower_Sheet5, 0x4ec
	banim_cmd 0xd
	banim_end_mode

	banim_mode 9  @ STANDING
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_cmd 0x1
	banim_end_mode

	banim_mode 10  @ STANDING2
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_cmd 0x1
	banim_end_mode

	banim_mode 11  @ RANGED_STANDING
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_cmd 0x1
	banim_end_mode

	banim_mode 12  @ MISSED_ATK
	banim_cmd 0x3
	banim_cmd 0x7
	banim_frame 1, 0, Img_Banim_Flower_Sheet0, 0x0
	banim_frame 4, 1, Img_Banim_Flower_Sheet0, 0x30
	banim_cmd 0x1b
	banim_frame 4, 2, Img_Banim_Flower_Sheet0, 0x60
	banim_frame 4, 3, Img_Banim_Flower_Sheet0, 0x90
	banim_cmd 0x1b
	banim_frame 4, 4, Img_Banim_Flower_Sheet0, 0xc0
	banim_cmd 0x2e
	banim_frame 4, 5, Img_Banim_Flower_Sheet1, 0xf0
	banim_frame 4, 6, Img_Banim_Flower_Sheet1, 0x120
	banim_frame 8, 7, Img_Banim_Flower_Sheet1, 0x150
	banim_frame 4, 8, Img_Banim_Flower_Sheet1, 0x180
	banim_cmd 0x1b
	banim_cmd 0x5
	banim_frame 3, 9, Img_Banim_Flower_Sheet1, 0x1bc
	banim_frame 2, 10, Img_Banim_Flower_Sheet2, 0x1ec
	banim_frame 2, 11, Img_Banim_Flower_Sheet2, 0x21c
	banim_frame 1, 39, Img_Banim_Flower_Sheet7, 0x768
	banim_cmd 0x1
	banim_frame 2, 12, Img_Banim_Flower_Sheet2, 0x240
	banim_frame 2, 13, Img_Banim_Flower_Sheet2, 0x264
	banim_frame 2, 14, Img_Banim_Flower_Sheet2, 0x288
	banim_frame 8, 15, Img_Banim_Flower_Sheet2, 0x2ac
	banim_frame 2, 16, Img_Banim_Flower_Sheet3, 0x2d0
	banim_frame 4, 17, Img_Banim_Flower_Sheet3, 0x2f4
	banim_frame 5, 18, Img_Banim_Flower_Sheet3, 0x318
	banim_cmd 0x1b
	banim_frame 2, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x6
	banim_frame 3, 19, Img_Banim_Flower_Sheet3, 0x33c
	banim_cmd 0x1b
	banim_frame 3, 20, Img_Banim_Flower_Sheet3, 0x360
	banim_cmd 0xd
	banim_end_mode

	banim_modes BanimModes_Flower
