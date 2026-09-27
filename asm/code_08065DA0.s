	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08065DA0
sub_08065DA0: @ 0x08065DA0
	ldr r0, _08065DBC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08065DBA
	ldr r3, _08065DC0 @ =0x0400001C
	ldr r2, _08065DC4 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08065DBA:
	bx lr
	.align 2, 0
_08065DBC: .4byte 0x04000004
_08065DC0: .4byte 0x0400001C
_08065DC4: .4byte 0x0201FDB4
