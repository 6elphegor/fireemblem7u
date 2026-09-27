	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08065BFC
sub_08065BFC: @ 0x08065BFC
	ldr r0, _08065C18 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08065C16
	ldr r3, _08065C1C @ =0x0400001A
	ldr r2, _08065C20 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08065C16:
	bx lr
	.align 2, 0
_08065C18: .4byte 0x04000004
_08065C1C: .4byte 0x0400001A
_08065C20: .4byte 0x0201FB28
