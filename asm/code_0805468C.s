	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckRoundMiss
CheckRoundMiss: @ 0x0805468C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _080546D0
	lsls r0, r0, #2
	ldr r1, _080546A0 @ =_080546A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080546A0: .4byte _080546A4
_080546A4: @ jump table
	.4byte _080546D0 @ case 0
	.4byte _080546D0 @ case 1
	.4byte _080546D0 @ case 2
	.4byte _080546D0 @ case 3
	.4byte _080546CC @ case 4
	.4byte _080546CC @ case 5
	.4byte _080546D0 @ case 6
	.4byte _080546D0 @ case 7
	.4byte _080546D0 @ case 8
	.4byte _080546D0 @ case 9
_080546CC:
	movs r0, #1
	b _080546D2
_080546D0:
	movs r0, #0
_080546D2:
	bx lr
