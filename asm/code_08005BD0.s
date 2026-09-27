	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005BD0
sub_08005BD0: @ 0x08005BD0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _08005BFC @ =0x02028D70
	ldr r0, [r0]
	ldr r3, [r0, #4]
	ldrb r4, [r2]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r2, #1
	cmp r0, #0
	bne _08005BEE
	adds r0, r3, #0
	adds r0, #0xfc
	ldr r0, [r0]
_08005BEE:
	ldrb r0, [r0, #5]
	str r0, [r1]
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005BFC: .4byte 0x02028D70
