	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BAB24
sub_080BAB24: @ 0x080BAB24
	ldr r0, _080BAB3C @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080BAB48
	ldr r0, _080BAB40 @ =0x0203E668
	ldr r1, _080BAB44 @ =0x0203E660
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080BAB4E
	.align 2, 0
_080BAB3C: .4byte 0x04000006
_080BAB40: .4byte 0x0203E668
_080BAB44: .4byte 0x0203E660
_080BAB48:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080BAB4E:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080BAB78
	ldr r2, _080BAB70 @ =0x04000010
	ldr r0, _080BAB74 @ =0x0203E668
	ldr r0, [r0]
	lsls r1, r3, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	b _080BABA2
	.align 2, 0
_080BAB70: .4byte 0x04000010
_080BAB74: .4byte 0x0203E668
_080BAB78:
	cmp r3, #0x28
	bne _080BAB8C
	ldr r1, _080BABA8 @ =0x04000050
	ldr r0, _080BABAC @ =0x02000000
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080BABB0 @ =0x02000002
	ldrh r0, [r0]
	strh r0, [r1]
_080BAB8C:
	cmp r3, #0x64
	bne _080BABA4
	ldr r2, _080BABA8 @ =0x04000050
	ldr r1, _080BABB4 @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
_080BABA2:
	strh r0, [r2]
_080BABA4:
	bx lr
	.align 2, 0
_080BABA8: .4byte 0x04000050
_080BABAC: .4byte 0x02000000
_080BABB0: .4byte 0x02000002
_080BABB4: .4byte 0x030028AC
