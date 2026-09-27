	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807436C
sub_0807436C: @ 0x0807436C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080743A8 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl GetUnit
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #8
	bhi _08074454
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080743AC @ =_080743B0
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080743A8: .4byte 0x0203E0FC
_080743AC: .4byte _080743B0
_080743B0: @ jump table
	.4byte _080743D4 @ case 0
	.4byte _080743F8 @ case 1
	.4byte _08074402 @ case 2
	.4byte _0807440C @ case 3
	.4byte _08074416 @ case 4
	.4byte _08074420 @ case 5
	.4byte _0807442A @ case 6
	.4byte _08074434 @ case 7
	.4byte _0807443E @ case 8
_080743D4:
	ldr r0, _080743F4 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x70
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074458
	.align 2, 0
_080743F4: .4byte 0x0203E0FC
_080743F8:
	ldr r0, [r7, #8]
	movs r1, #0x12
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074402:
	ldr r0, [r7, #8]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_0807440C:
	ldr r0, [r7, #8]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074416:
	ldr r0, [r7, #8]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074420:
	ldr r0, [r7, #8]
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_0807442A:
	ldr r0, [r7, #8]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074434:
	ldr r0, [r7, #8]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_0807443E:
	ldr r0, [r7, #8]
	ldr r2, [r0, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r7, #8]
	ldr r2, [r0]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08074458
_08074454:
	movs r0, #0
	b _08074458
_08074458:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
