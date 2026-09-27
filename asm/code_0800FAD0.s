	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FAD0
sub_0800FAD0: @ 0x0800FAD0
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FAE8
	adds r0, r2, #0
	bl EndWmIcon
_0800FAE8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
