	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086844
sub_08086844: @ 0x08086844
	push {r4, lr}
	movs r4, #0x81
_08086848:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08086870
	ldr r1, [r2]
	cmp r1, #0
	beq _08086870
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08086870
	adds r0, r2, #0
	b _08086878
_08086870:
	adds r4, #1
	cmp r4, #0xbf
	ble _08086848
	movs r0, #0
_08086878:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
