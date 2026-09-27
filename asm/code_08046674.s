	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046674
sub_08046674: @ 0x08046674
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080466B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080466C0
	bl EndLinkArenaPointsBox
	str r4, [r5, #0x58]
	ldr r0, _080466B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080466A8
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
	ldr r0, _080466BC @ =0x08B99D20
	bl sub_0800AF5C
_080466A8:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	movs r0, #1
	b _080466C2
	.align 2, 0
_080466B4: .4byte 0x08B857F8
_080466B8: .4byte 0x0202BBF8
_080466BC: .4byte 0x08B99D20
_080466C0:
	movs r0, #0
_080466C2:
	pop {r4, r5}
	pop {r1}
	bx r1
