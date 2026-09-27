	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08077680
sub_08077680: @ 0x08077680
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x70
	ble _08077692
	movs r0, #0x70
	str r0, [r7]
_08077692:
	movs r0, #0x50
	ldr r1, [r7]
	subs r0, r0, r1
	str r0, [r7, #8]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x50
	str r1, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #4]
_080776A6:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080776B0
	b _080776D0
_080776B0:
	ldr r0, _080776CC @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080776A6
	.align 2, 0
_080776CC: .4byte 0x0203E660
_080776D0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #4]
_080776D4:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _080776DC
	b _080776FC
_080776DC:
	ldr r0, _080776F8 @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080776D4
	.align 2, 0
_080776F8: .4byte 0x0203E660
_080776FC:
	ldr r0, [r7, #8]
	str r0, [r7, #4]
_08077700:
	ldr r0, [r7, #4]
	cmp r0, #0x4f
	bgt _08077714
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _08077716
	b _08077714
_08077714:
	b _08077750
_08077716:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	asrs r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, _0807774C @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	movs r2, #0x10
	subs r1, r2, r1
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077700
	.align 2, 0
_0807774C: .4byte 0x0203E660
_08077750:
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #4]
_08077756:
	ldr r0, [r7, #4]
	cmp r0, #0x4f
	ble _0807776A
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _0807776C
	b _0807776A
_0807776A:
	b _080777A4
_0807776C:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	asrs r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, _080777A0 @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	movs r2, #0x10
	subs r1, r2, r1
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08077756
	.align 2, 0
_080777A0: .4byte 0x0203E660
_080777A4:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7, #4]
_080777AC:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _080777BA
	b _080777D8
_080777BA:
	ldr r0, _080777D4 @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080777AC
	.align 2, 0
_080777D4: .4byte 0x0203E660
_080777D8:
	bl SwapScanlineBufs
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
