	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A03C
sub_0807A03C: @ 0x0807A03C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807A042:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A068
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A068
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807A068
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0807A068
	adds r5, #1
_0807A068:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A042
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
