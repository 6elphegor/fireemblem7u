	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027E68
sub_08027E68: @ 0x08027E68
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08027E94
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	bne _08027E94
	movs r0, #1
	b _08027E96
_08027E94:
	movs r0, #0
_08027E96:
	pop {r1}
	bx r1
	.align 2, 0
