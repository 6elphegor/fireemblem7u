	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD168
sub_080BD168: @ 0x080BD168
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #2
	ldr r1, [r4, #0x30]
	adds r1, r1, r0
	str r1, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r1, r5
	ble _080BD180
	str r5, [r4, #0x30]
_080BD180:
	ldr r0, _080BD1A0 @ =0x020072E0
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_080BCFE8
	ldr r0, [r4, #0x30]
	cmp r0, r5
	bne _080BD19A
	adds r0, r4, #0
	bl Proc_Break
_080BD19A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1A0: .4byte 0x020072E0
