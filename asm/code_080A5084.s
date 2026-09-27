	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5084
sub_080A5084: @ 0x080A5084
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080A50C0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A50B4 @ =0x00000766
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A50B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A50C8
	ldr r0, _080A50BC @ =0x0000037B
	bl m4aSongNumStart
	b _080A50C8
	.align 2, 0
_080A50B4: .4byte 0x00000766
_080A50B8: .4byte 0x0202BBF8
_080A50BC: .4byte 0x0000037B
_080A50C0:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A50C8:
	pop {r0}
	bx r0
