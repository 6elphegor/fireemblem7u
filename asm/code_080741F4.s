	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080741F4
sub_080741F4: @ 0x080741F4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #8
	bls _08074206
	b _08074360
_08074206:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08074214 @ =_08074218
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08074214: .4byte _08074218
_08074218: @ jump table
	.4byte _0807423C @ case 0
	.4byte _08074240 @ case 1
	.4byte _08074264 @ case 2
	.4byte _08074288 @ case 3
	.4byte _080742AC @ case 4
	.4byte _080742D0 @ case 5
	.4byte _080742F4 @ case 6
	.4byte _08074318 @ case 7
	.4byte _0807433C @ case 8
_0807423C:
	movs r0, #1
	b _08074364
_08074240:
	ldr r0, _08074260 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x73
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074260: .4byte 0x0203E0FC
_08074264:
	ldr r0, _08074284 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x74
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074284: .4byte 0x0203E0FC
_08074288:
	ldr r0, _080742A8 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x75
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_080742A8: .4byte 0x0203E0FC
_080742AC:
	ldr r0, _080742CC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x76
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_080742CC: .4byte 0x0203E0FC
_080742D0:
	ldr r0, _080742F0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x79
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_080742F0: .4byte 0x0203E0FC
_080742F4:
	ldr r0, _08074314 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x77
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074314: .4byte 0x0203E0FC
_08074318:
	ldr r0, _08074338 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x78
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074338: .4byte 0x0203E0FC
_0807433C:
	ldr r0, _0807435C @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x7a
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_0807435C: .4byte 0x0203E0FC
_08074360:
	movs r0, #0
	b _08074364
_08074364:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
