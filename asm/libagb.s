	.include "macro.inc"

	.syntax unified

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x080BFA0C
	svc #0xc
	bx lr

	thumb_func_start CpuSet
CpuSet: @ 0x080BFA10
	svc #0xb
	bx lr

	thumb_func_start Div
Div: @ 0x080BFA14
	svc #6
	bx lr

	thumb_func_start DivRem
DivRem: @ 0x080BFA18
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080BFA20:
	.byte 0x13, 0xDF, 0x70, 0x47

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 0x080BFA24
	svc #0x12
	bx lr

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x080BFA28
	svc #0x11
	bx lr

	thumb_func_start MultiBoot
MultiBoot: @ 0x080BFA2C
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

	thumb_func_start ObjAffineSet
ObjAffineSet: @ 0x080BFA34
	svc #0xf
	bx lr
_080BFA38:
	.byte 0x15, 0xDF, 0x70, 0x47, 0x14, 0xDF, 0x70, 0x47

	thumb_func_start SoftReset
SoftReset: @ 0x080BFA40
	ldr r3, _080BFA50 @ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _080BFA54 @ =0x03007F00
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_080BFA50: .4byte 0x04000208
_080BFA54: .4byte 0x03007F00

	thumb_func_start SoundBiasReset
SoundBiasReset: @ 0x080BFA58
	movs r0, #0
	svc #0x19
	bx lr
	.align 2, 0

	thumb_func_start SoundBiasSet
SoundBiasSet: @ 0x080BFA60
	movs r0, #1
	svc #0x19
	bx lr
	.align 2, 0

	thumb_func_start Sqrt
Sqrt: @ 0x080BFA68
	svc #8
	bx lr

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x080BFA6C
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0
_080BFA74:
	.byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x13, 0x1C, 0x0B, 0x4A, 0x10, 0x88
	.byte 0x0B, 0x49, 0x08, 0x40, 0x03, 0x21, 0x08, 0x43, 0x10, 0x80, 0x01, 0x3B, 0x01, 0x20, 0x40, 0x42
	.byte 0x83, 0x42, 0x07, 0xD0, 0x01, 0x1C, 0x28, 0x78, 0x20, 0x70, 0x01, 0x35, 0x01, 0x34, 0x01, 0x3B
	.byte 0x8B, 0x42, 0xF8, 0xD1, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x04, 0x02, 0x00, 0x04
	.byte 0xFC, 0xFF, 0x00, 0x00

	thumb_func_start WriteSramFast
WriteSramFast: @ 0x080BFAB4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080BFAEC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080BFAF0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080BFAE4
	adds r1, r0, #0
_080BFAD6:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080BFAD6
_080BFAE4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BFAEC: .4byte 0x04000204
_080BFAF0: .4byte 0x0000FFFC
_080BFAF4:
	.byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x13, 0x1C, 0x0A, 0x4A, 0x10, 0x88
	.byte 0x0A, 0x49, 0x08, 0x40, 0x03, 0x21, 0x08, 0x43, 0x10, 0x80, 0x01, 0x3B, 0x01, 0x20, 0x40, 0x42
	.byte 0x83, 0x42, 0x10, 0xD0, 0x02, 0x1C, 0x21, 0x78, 0x28, 0x78, 0x01, 0x35, 0x01, 0x34, 0x81, 0x42
	.byte 0x06, 0xD0, 0x60, 0x1E, 0x08, 0xE0, 0x00, 0x00, 0x04, 0x02, 0x00, 0x04, 0xFC, 0xFF, 0x00, 0x00
	.byte 0x01, 0x3B, 0x93, 0x42, 0xEF, 0xD1, 0x00, 0x20, 0x30, 0xBC, 0x02, 0xBC, 0x08, 0x47, 0x00, 0x00

	thumb_func_start SetSramFastFunc
SetSramFastFunc: @ 0x080BFB40
	ldr r2, _080BFB54 @ =0x080BFA75
	movs r0, #1
	eors r2, r0
	ldr r3, _080BFB58 @ =0x030022F8
	ldr r0, _080BFB5C @ =WriteSramFast
	ldr r1, _080BFB54 @ =0x080BFA75
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080BFB6C
	.align 2, 0
_080BFB54: .4byte 0x080BFA75
_080BFB58: .4byte 0x030022F8
_080BFB5C: .4byte WriteSramFast
_080BFB60:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080BFB6C:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080BFB60
	ldr r1, _080BFB8C @ =0x03005E70
	ldr r0, _080BFB90 @ =0x030022F9
	str r0, [r1]
	ldr r2, _080BFB94 @ =0x080BFAF5
	movs r0, #1
	eors r2, r0
	ldr r3, _080BFB98 @ =0x03002258
	ldr r0, _080BFB9C @ =SetSramFastFunc
	ldr r1, _080BFB94 @ =0x080BFAF5
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080BFBAC
	.align 2, 0
_080BFB8C: .4byte 0x03005E70
_080BFB90: .4byte 0x030022F9
_080BFB94: .4byte 0x080BFAF5
_080BFB98: .4byte 0x03002258
_080BFB9C: .4byte SetSramFastFunc
_080BFBA0:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080BFBAC:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080BFBA0
	ldr r1, _080BFBC8 @ =0x03005E74
	ldr r0, _080BFBCC @ =0x03002259
	str r0, [r1]
	ldr r2, _080BFBD0 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080BFBD4 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080BFBC8: .4byte 0x03005E74
_080BFBCC: .4byte 0x03002259
_080BFBD0: .4byte 0x04000204
_080BFBD4: .4byte 0x0000FFFC

	thumb_func_start WriteAndVerifySramFast
WriteAndVerifySramFast: @ 0x080BFBD8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r7, #0
	b _080BFBEA
_080BFBE4:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_080BFBEA:
	cmp r7, #2
	bhi _080BFC0C
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl WriteSramFast
	ldr r0, _080BFC14 @ =0x03005E74
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r3, r0, #0
	cmp r3, #0
	bne _080BFBE4
_080BFC0C:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BFC14: .4byte 0x03005E74

	thumb_func_start sub_080BFC18
sub_080BFC18: @ 0x080BFC18
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080BFC48
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080BFC34
	movs r3, #0
	rsbs r0, r0, #0
	adds r4, r5, #0
	lsls r4, r0
	b _080BFC44
_080BFC34:
	adds r1, r5, #0
	lsrs r1, r0
	adds r3, r5, #0
	lsls r3, r2
	adds r0, r6, #0
	lsls r0, r2
	adds r4, r0, #0
	orrs r4, r1
_080BFC44:
	adds r1, r4, #0
	adds r0, r3, #0
_080BFC48:
	pop {r4, r5, r6, pc}
	.align 2, 0

