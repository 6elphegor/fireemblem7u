	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055C30
sub_08055C30: @ 0x08055C30
	ldr r0, _08055C5C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055C58
	ldr r3, _08055C60 @ =0x0400001A
	ldr r2, _08055C64 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #6
	ldr r2, _08055C68 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055C58:
	bx lr
	.align 2, 0
_08055C5C: .4byte 0x04000004
_08055C60: .4byte 0x0400001A
_08055C64: .4byte 0x0201FB28
_08055C68: .4byte 0x0201FDB4
