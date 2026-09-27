	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055C08
sub_08055C08: @ 0x08055C08
	ldr r0, _08055C24 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055C22
	ldr r3, _08055C28 @ =0x04000016
	ldr r2, _08055C2C @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055C22:
	bx lr
	.align 2, 0
_08055C24: .4byte 0x04000004
_08055C28: .4byte 0x04000016
_08055C2C: .4byte 0x0201FDB4
