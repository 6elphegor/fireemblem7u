	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A503C
sub_080A503C: @ 0x080A503C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080A5078
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A506C @ =0x00000765
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5070 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5080
	ldr r0, _080A5074 @ =0x0000037B
	bl m4aSongNumStart
	b _080A5080
	.align 2, 0
_080A506C: .4byte 0x00000765
_080A5070: .4byte 0x0202BBF8
_080A5074: .4byte 0x0000037B
_080A5078:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080A5080:
	pop {r0}
	bx r0
