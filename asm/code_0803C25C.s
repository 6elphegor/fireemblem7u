	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C25C
sub_0803C25C: @ 0x0803C25C
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0803C284 @ =0x08B98AEC
	ldr r3, [r3]
	ldr r5, _0803C288 @ =0x00001B78
	adds r4, r3, r5
	strh r0, [r4]
	ldr r4, _0803C28C @ =0x00001B7A
	adds r0, r3, r4
	strh r1, [r0]
	adds r5, #4
	adds r3, r3, r5
	strh r2, [r3]
	ldr r0, _0803C290 @ =0x030013C8
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803C284: .4byte 0x08B98AEC
_0803C288: .4byte 0x00001B78
_0803C28C: .4byte 0x00001B7A
_0803C290: .4byte 0x030013C8
