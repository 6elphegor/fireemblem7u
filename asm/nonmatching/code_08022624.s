	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022624
sub_08022624: @ 0x08022624
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _0802265C
	ldr r0, _08022654 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _08022658 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemCantUseMsgid
	adds r1, r0, #0
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08022698
	.align 2, 0
_08022654: .4byte 0x03004690
_08022658: .4byte 0x0203A85C
_0802265C:
	bl ClearUi
	ldr r0, _080226A0 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _080226A4 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	ldr r0, _080226A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08022688
	ldr r0, _080226AC @ =0x0000038A
	bl m4aSongNumStart
_08022688:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x21
_08022698:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080226A0: .4byte 0x03004690
_080226A4: .4byte 0x0203A85C
_080226A8: .4byte 0x0202BBF8
_080226AC: .4byte 0x0000038A
