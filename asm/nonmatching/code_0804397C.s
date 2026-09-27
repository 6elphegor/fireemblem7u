	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804397C
sub_0804397C: @ 0x0804397C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _080439CC @ =0x08B99894
	lsls r2, r2, #2
	adds r5, r2, r0
	ldrh r4, [r5, #2]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_08043828
	ldrh r0, [r5]
	bl DecodeMsg
	bl GetStringTextLen
	movs r1, #0x46
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r4, #0
	bne _080439B0
	subs r1, #0x20
_080439B0:
	adds r4, r1, #0
	adds r4, #0x28
	ldrh r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl Text_InsertDrawString
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080439CC: .4byte 0x08B99894
