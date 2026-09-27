	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACB64
sub_080ACB64: @ 0x080ACB64
	push {r4, r5, lr}
	ldr r0, _080ACBB4 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa0
	bls _080ACB76
	movs r5, #0
_080ACB76:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080ACBAE
	cmp r5, #0x63
	bhi _080ACB98
	ldr r1, _080ACBB8 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	ldr r4, _080ACBBC @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080ACB98:
	cmp r5, #0
	bne _080ACBA4
	ldr r0, _080ACBC0 @ =0x04000012
	ldr r1, _080ACBC4 @ =0x03002870
	ldrh r1, [r1, #0x1e]
	strh r1, [r0]
_080ACBA4:
	cmp r5, #0x78
	bne _080ACBAE
	ldr r1, _080ACBC0 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
_080ACBAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACBB4: .4byte 0x04000006
_080ACBB8: .4byte 0x04000050
_080ACBBC: .4byte 0x04000054
_080ACBC0: .4byte 0x04000012
_080ACBC4: .4byte 0x03002870
