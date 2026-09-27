	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08018888
sub_08018888: @ 0x08018888
	push {r4, r5, r6, lr}
	movs r4, #1
	ldr r6, _080188BC @ =0x08B92EB0
	ldr r5, _080188C0 @ =0xFFEFFFFF
_08018890:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _080188C8
	ldr r0, [r2]
	cmp r0, #0
	beq _080188C8
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r1
	cmp r0, #0
	beq _080188C4
	movs r0, #4
	orrs r1, r0
	ands r1, r5
	str r1, [r2, #0xc]
	b _080188C8
	.align 2, 0
_080188BC: .4byte 0x08B92EB0
_080188C0: .4byte 0xFFEFFFFF
_080188C4:
	ands r1, r5
	str r1, [r3, #0xc]
_080188C8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018890
	pop {r4, r5, r6}
	pop {r0}
	bx r0
