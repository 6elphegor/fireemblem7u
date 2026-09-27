	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076AFC
sub_08076AFC: @ 0x08076AFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076B24 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076B30
	ldr r0, _08076B28 @ =0x0203E668
	ldr r1, _08076B2C @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076B3E
	.align 2, 0
_08076B24: .4byte 0x04000006
_08076B28: .4byte 0x0203E668
_08076B2C: .4byte 0x0203E660
_08076B30:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076B3E:
	ldr r0, _08076B74 @ =0x05000022
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076B78 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08076B7C @ =0x05000042
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076B78 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B74: .4byte 0x05000022
_08076B78: .4byte 0x0203E668
_08076B7C: .4byte 0x05000042
