	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckRound2
CheckRound2: @ 0x0805471C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054760
	lsls r0, r0, #2
	ldr r1, _08054730 @ =_08054734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054730: .4byte _08054734
_08054734: @ jump table
	.4byte _0805475C @ case 0
	.4byte _0805475C @ case 1
	.4byte _0805475C @ case 2
	.4byte _0805475C @ case 3
	.4byte _08054760 @ case 4
	.4byte _08054760 @ case 5
	.4byte _08054760 @ case 6
	.4byte _08054760 @ case 7
	.4byte _08054760 @ case 8
	.4byte _0805475C @ case 9
_0805475C:
	movs r0, #1
	b _08054762
_08054760:
	movs r0, #0
_08054762:
	bx lr
