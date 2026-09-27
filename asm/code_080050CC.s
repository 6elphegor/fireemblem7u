	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080050CC
sub_080050CC: @ 0x080050CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0800502C
	movs r2, #7
	ldr r1, _08005110 @ =0x02028D44
	ldr r3, _08005114 @ =0x08193D8C
	movs r0, #0xf
	ands r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1, #7]
	asrs r4, r4, #4
	cmp r4, #0
	beq _08005108
	adds r6, r1, #0
	adds r5, r3, #0
	movs r3, #0xf
_080050F0:
	subs r2, #1
	cmp r2, #0
	blt _08005108
	adds r0, r2, r6
	adds r1, r4, #0
	ands r1, r3
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	asrs r4, r4, #4
	cmp r4, #0
	bne _080050F0
_08005108:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005110: .4byte 0x02028D44
_08005114: .4byte 0x08193D8C
