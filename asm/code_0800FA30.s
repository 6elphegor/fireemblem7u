	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FA30
sub_0800FA30: @ 0x0800FA30
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FA48
	adds r0, r2, #0
	bl sub_080B4D14
_0800FA48:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
