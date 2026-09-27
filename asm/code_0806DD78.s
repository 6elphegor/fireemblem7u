	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DD78
sub_0806DD78: @ 0x0806DD78
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806DDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r4, [r1]
	ldr r1, _0806DDD0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	movs r1, #1
	subs r5, r1, r0
	ldr r0, _0806DDD0 @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFacing
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0806EC18
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DDD0: .4byte 0x0203E0FC
