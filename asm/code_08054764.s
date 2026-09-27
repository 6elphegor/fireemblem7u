	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckRoundCrit
CheckRoundCrit: @ 0x08054764
	ldrb r0, [r0, #0x12]
	cmp r0, #9
	bhi _080547A4
	lsls r0, r0, #2
	ldr r1, _08054774 @ =_08054778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054774: .4byte _08054778
_08054778: @ jump table
	.4byte _080547A4 @ case 0
	.4byte _080547A0 @ case 1
	.4byte _080547A4 @ case 2
	.4byte _080547A0 @ case 3
	.4byte _080547A4 @ case 4
	.4byte _080547A4 @ case 5
	.4byte _080547A4 @ case 6
	.4byte _080547A4 @ case 7
	.4byte _080547A4 @ case 8
	.4byte _080547A4 @ case 9
_080547A0:
	movs r0, #1
	b _080547A6
_080547A4:
	movs r0, #0
_080547A6:
	bx lr
