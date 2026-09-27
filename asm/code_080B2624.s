	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2624
sub_080B2624: @ 0x080B2624
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2664 @ =0x0869D668
	ldr r2, _080B2668 @ =0x0869D6E0
	adds r1, r2, #0
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0
	bne _080B266E
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	bne _080B266E
	movs r0, #0
	b _080B2672
	.align 2, 0
_080B2664: .4byte 0x0869D668
_080B2668: .4byte 0x0869D6E0
_080B266C:
	.byte 0x01, 0xE0
_080B266E:
	movs r0, #1
	b _080B2672
_080B2672:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
