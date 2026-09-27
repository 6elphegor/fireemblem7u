	.include "macro.inc"

	.syntax unified

	thumb_func_start efxExcaliburSCR_Loop
efxExcaliburSCR_Loop: @ 0x08060184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, _080601E0 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r5, _080601E4 @ =0x0201FB2C
	cmp r0, #0
	bne _0806019A
	ldr r5, _080601E8 @ =0x0201FC6C
_0806019A:
	ldr r4, _080601EC @ =0x0201FDB8
	cmp r0, #0
	bne _080601A2
	ldr r4, _080601F0 @ =0x0201FEF8
_080601A2:
	movs r3, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #0x10
	mov ip, r1
	movs r7, #0x80
	ldr r6, _080601F4 @ =0x08BA3A4C
_080601B2:
	cmp r3, #0x7f
	bhi _0806020C
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08060204
	cmp r3, #0x3f
	bhi _080601FC
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bhs _08060204
	ldr r1, _080601F8 @ =0x0000FF80
	adds r0, r3, r1
	lsls r0, r0, #0x10
	b _08060202
	.align 2, 0
_080601E0: .4byte 0x0201FDAC
_080601E4: .4byte 0x0201FB2C
_080601E8: .4byte 0x0201FC6C
_080601EC: .4byte 0x0201FDB8
_080601F0: .4byte 0x0201FEF8
_080601F4: .4byte 0x08BA3A4C
_080601F8: .4byte 0x0000FF80
_080601FC:
	cmp r1, r7
	bls _08060204
	mov r0, ip
_08060202:
	lsrs r2, r0, #0x10
_08060204:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r4]
	b _08060214
_0806020C:
	mov r1, r8
	strh r1, [r5]
	adds r5, #2
	strh r1, [r4]
_08060214:
	adds r4, #2
	ldr r2, _08060230 @ =0xFFFF0000
	add ip, r2
	subs r7, #1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _080601B2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060230: .4byte 0xFFFF0000
