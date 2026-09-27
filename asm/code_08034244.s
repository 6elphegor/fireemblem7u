	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBkselHelpBoxMsg
GetBkselHelpBoxMsg: @ 0x08034244
	lsls r1, r1, #0x18
	movs r2, #0
	cmp r1, #0
	beq _0803424E
	movs r2, #3
_0803424E:
	cmp r0, #0
	bge _08034254
	adds r2, #2
_08034254:
	cmp r0, #0
	ble _0803425A
	adds r2, #1
_0803425A:
	ldr r0, _08034264 @ =0x08B96DD4
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_08034264: .4byte 0x08B96DD4
