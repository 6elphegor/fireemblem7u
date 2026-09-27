	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CDB8
sub_0803CDB8: @ 0x0803CDB8
	ldr r0, _0803CDD4 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r2, _0803CDD8 @ =0x00001B75
	adds r1, r0, r2
	ldr r3, _0803CDDC @ =0x00001B74
	adds r0, r0, r3
	ldrb r2, [r1]
	ldrb r3, [r0]
	cmp r2, r3
	bhs _0803CDE0
	adds r0, r3, #0
	subs r0, #0x20
	subs r0, r2, r0
	b _0803CDE6
	.align 2, 0
_0803CDD4: .4byte 0x08B98AEC
_0803CDD8: .4byte 0x00001B75
_0803CDDC: .4byte 0x00001B74
_0803CDE0:
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r0, r1, r0
_0803CDE6:
	bx lr
