	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807744C
sub_0807744C: @ 0x0807744C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08077456:
	ldr r0, [r7]
	cmp r0, #0x9f
	ble _0807745E
	b _08077480
_0807745E:
	ldr r0, _0807747C @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077456
	.align 2, 0
_0807747C: .4byte 0x0203E660
_08077480:
	movs r0, #8
	str r0, [r7]
_08077484:
	ldr r0, [r7]
	cmp r0, #0x97
	ble _0807748C
	b _080774A8
_0807748C:
	ldr r0, _080774A4 @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0]
	adds r0, r1, r2
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077484
	.align 2, 0
_080774A4: .4byte 0x0203E660
_080774A8:
	movs r0, #0
	str r0, [r7]
_080774AC:
	ldr r0, [r7]
	cmp r0, #0x20
	ble _080774B4
	b _08077514
_080774B4:
	ldr r0, _0807750C @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	ldr r2, [r7]
	asrs r1, r2, #1
	adds r2, r1, #0
	movs r3, #0x10
	subs r1, r3, r2
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7]
	asrs r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807750C @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, _08077510 @ =0xFFFFFED0
	adds r2, r1, r3
	ldr r1, [r0]
	subs r0, r1, r2
	ldr r2, [r7]
	asrs r1, r2, #1
	adds r2, r1, #0
	movs r3, #0x10
	subs r1, r3, r2
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7]
	asrs r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _080774AC
	.align 2, 0
_0807750C: .4byte 0x0203E660
_08077510: .4byte 0xFFFFFED0
_08077514:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
