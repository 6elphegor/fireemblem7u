	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005C00
sub_08005C00: @ 0x08005C00
	push {r4, lr}
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #1
	bls _08005C26
	ldr r0, _08005C30 @ =0x02028D70
	ldr r0, [r0]
	ldr r3, [r0, #4]
_08005C12:
	ldrb r4, [r1]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, #1
	ldrb r0, [r0, #5]
	adds r2, r0, r2
	ldrb r0, [r1]
	cmp r0, #1
	bhi _08005C12
_08005C26:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005C30: .4byte 0x02028D70
