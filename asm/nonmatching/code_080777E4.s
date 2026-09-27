	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080777E4
sub_080777E4: @ 0x080777E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _0807780C @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9e
	bls _08077818
	ldr r0, _08077810 @ =0x0203E668
	ldr r1, _08077814 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077826
	.align 2, 0
_0807780C: .4byte 0x04000006
_08077810: .4byte 0x0203E668
_08077814: .4byte 0x0203E660
_08077818:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077826:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0807784E
	ldr r0, _08077858 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807785C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_0807784E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077858: .4byte 0x04000040
_0807785C: .4byte 0x0203E668
