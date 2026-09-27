	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3D20
sub_080B3D20: @ 0x080B3D20
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r0, _080B3D6C @ =0x08CE7650
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B3D64
	bl sub_080B3C58
	cmp r4, #0
	bne _080B3D42
	ldr r1, _080B3D70 @ =0x02000815
	movs r0, #4
	strb r0, [r1]
_080B3D42:
	cmp r4, #1
	bne _080B3D4C
	ldr r1, _080B3D70 @ =0x02000815
	movs r0, #0x74
	strb r0, [r1]
_080B3D4C:
	ldr r1, _080B3D74 @ =0x02000814
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080B3D64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D6C: .4byte 0x08CE7650
_080B3D70: .4byte 0x02000815
_080B3D74: .4byte 0x02000814
