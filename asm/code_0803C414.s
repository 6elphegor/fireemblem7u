	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C414
sub_0803C414: @ 0x0803C414
	push {r4, lr}
	ldr r2, _0803C470 @ =0x08B98AEC
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, _0803C474 @ =0x00006581
	movs r1, #3
	movs r2, #0x88
	bl sub_0803C25C
	movs r0, #0
	bl sub_0803D500
	bl sub_0803C294
	ldr r0, _0803C478 @ =0x030013D4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C470: .4byte 0x08B98AEC
_0803C474: .4byte 0x00006581
_0803C478: .4byte 0x030013D4
