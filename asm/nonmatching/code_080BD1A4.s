	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD1A4
sub_080BD1A4: @ 0x080BD1A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r0, r0, r1
	str r0, [r4, #0x30]
	cmp r0, #0
	bge _080BD1B8
	movs r0, #0
	str r0, [r4, #0x30]
_080BD1B8:
	ldr r0, _080BD1D8 @ =0x020072E0
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_080BCFE8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080BD1D2
	adds r0, r4, #0
	bl Proc_Break
_080BD1D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1D8: .4byte 0x020072E0
