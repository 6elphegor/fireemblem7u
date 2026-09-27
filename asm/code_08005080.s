	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005080
sub_08005080: @ 0x08005080
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0800502C
	cmp r4, #0xff
	beq _08005094
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080050A4
_08005094:
	ldr r1, _080050A0 @ =0x02028D44
	movs r0, #0x3a
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _080050AA
	.align 2, 0
_080050A0: .4byte 0x02028D44
_080050A4:
	adds r0, r4, #0
	bl sub_08005044
_080050AA:
	pop {r4}
	pop {r0}
	bx r0
