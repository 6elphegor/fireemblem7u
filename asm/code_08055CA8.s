	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055CA8
sub_08055CA8: @ 0x08055CA8
	ldr r0, _08055CC4 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055CC2
	ldr r3, _08055CC8 @ =0x0400001A
	ldr r2, _08055CCC @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055CC2:
	bx lr
	.align 2, 0
_08055CC4: .4byte 0x04000004
_08055CC8: .4byte 0x0400001A
_08055CCC: .4byte 0x0201FB28
