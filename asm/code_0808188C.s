	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBox_OnClose
HelpBox_OnClose: @ 0x0808188C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080818D8 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _080818A2
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #0
	strb r0, [r1]
_080818A2:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _080818D0
	ldr r0, _080818DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080818BE
	ldr r0, _080818E0 @ =0x00000391
	bl m4aSongNumStart
_080818BE:
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
_080818D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080818D8: .4byte 0x08CC209C
_080818DC: .4byte 0x0202BBF8
_080818E0: .4byte 0x00000391
