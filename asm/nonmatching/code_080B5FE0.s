	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5FE0
sub_080B5FE0: @ 0x080B5FE0
	ldr r0, _080B6020 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B5FF0
	movs r3, #0
_080B5FF0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B601C
	ldr r1, _080B6024 @ =0x02000814
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B601C
	ldr r1, _080B6028 @ =0x0203E668
	cmp r3, #0
	bne _080B6010
	ldr r0, _080B602C @ =0x0203E660
	ldr r0, [r0]
	str r0, [r1]
_080B6010:
	ldr r2, _080B6030 @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B601C:
	bx lr
	.align 2, 0
_080B6020: .4byte 0x04000006
_080B6024: .4byte 0x02000814
_080B6028: .4byte 0x0203E668
_080B602C: .4byte 0x0203E660
_080B6030: .4byte 0x04000040
