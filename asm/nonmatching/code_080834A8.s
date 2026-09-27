	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080834A8
sub_080834A8: @ 0x080834A8
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080834C8
	ldr r0, _080834D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080834C8
	ldr r0, _080834DC @ =0x000002E7
	bl m4aSongNumStart
_080834C8:
	movs r0, #0
	bl SetTextFontGlyphs
	bl EndMergeBoxDialogue
	pop {r0}
	bx r0
	.align 2, 0
_080834D8: .4byte 0x0202BBF8
_080834DC: .4byte 0x000002E7
