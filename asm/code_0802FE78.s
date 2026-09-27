	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802FE78
sub_0802FE78: @ 0x0802FE78
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802FE84 @ =0x08B96444
	ldr r0, [r0]
	adds r0, #0x2c
	ldrb r1, [r0]
	b _0802FEE4
	.align 2, 0
_0802FE84: .4byte 0x08B96444
_0802FE88:
	asrs r4, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	lsls r7, r1, #0x18
	cmp r2, #0
	blt _0802FEDC
	ldr r0, _0802FEC8 @ =0x08B96444
	ldr r1, [r0]
	adds r5, r1, #0
	adds r5, #0x2d
	adds r0, r5, r4
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, #0x41
	adds r4, r1, r4
_0802FEAC:
	asrs r2, r2, #0x18
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bne _0802FECC
	adds r0, r1, r2
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r2, r0
	bne _0802FECC
	movs r0, #0
	b _0802FEEC
	.align 2, 0
_0802FEC8: .4byte 0x08B96444
_0802FECC:
	lsls r0, r3, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	cmp r2, #0
	bge _0802FEAC
_0802FEDC:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r7, r1
	lsrs r1, r0, #0x18
_0802FEE4:
	lsls r0, r1, #0x18
	cmp r0, #0
	bgt _0802FE88
	movs r0, #1
_0802FEEC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
