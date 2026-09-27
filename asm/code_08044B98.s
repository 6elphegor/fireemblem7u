	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044B98
sub_08044B98: @ 0x08044B98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl sub_08044B84
	ldr r1, _08044BD4 @ =0x0300141C
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, _08044BD8 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #2
	beq _08044BDC
	movs r0, #0
	b _08044BE8
	.align 2, 0
_08044BD4: .4byte 0x0300141C
_08044BD8: .4byte 0x0203D90C
_08044BDC:
	adds r0, r1, #0
	movs r1, #4
	bl SioEmitData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08044BE8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
