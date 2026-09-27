	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010DC4
sub_08010DC4: @ 0x08010DC4
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08010DEE
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, r4, #0
	movs r1, #1
	bl sub_08010AF8
	movs r0, #2
	b _08010DF0
_08010DEE:
	movs r0, #0
_08010DF0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
