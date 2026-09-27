	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckRound1
CheckRound1: @ 0x080546D4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054718
	lsls r0, r0, #2
	ldr r1, _080546E8 @ =_080546EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080546E8: .4byte _080546EC
_080546EC: @ jump table
	.4byte _08054718 @ case 0
	.4byte _08054718 @ case 1
	.4byte _08054718 @ case 2
	.4byte _08054718 @ case 3
	.4byte _08054718 @ case 4
	.4byte _08054718 @ case 5
	.4byte _08054714 @ case 6
	.4byte _08054714 @ case 7
	.4byte _08054714 @ case 8
	.4byte _08054718 @ case 9
_08054714:
	movs r0, #1
	b _0805471A
_08054718:
	movs r0, #0
_0805471A:
	bx lr
