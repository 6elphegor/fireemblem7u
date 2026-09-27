	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A078
sub_0807A078: @ 0x0807A078
	push {r4, lr}
	movs r4, #0x41
_0807A07C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A09C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A09C
	ldr r0, [r1, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A09C
	movs r0, #0
	b _0807A0A4
_0807A09C:
	adds r4, #1
	cmp r4, #0x7f
	ble _0807A07C
	movs r0, #1
_0807A0A4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
