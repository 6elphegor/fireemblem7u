	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082F50
sub_08082F50: @ 0x08082F50
	push {lr}
	ldr r0, _08082F74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08082F64
	ldr r0, _08082F78 @ =0x00000391
	bl m4aSongNumStart
_08082F64:
	bl ClearHelpBoxText
	ldr r0, _08082F7C @ =0x08CC29E4
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_08082F74: .4byte 0x0202BBF8
_08082F78: .4byte 0x00000391
_08082F7C: .4byte 0x08CC29E4
