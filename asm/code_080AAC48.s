	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAC48
sub_080AAC48: @ 0x080AAC48
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AAC70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AAC60
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080AAC60:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBox_Unk
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC70: .4byte 0x0202BBF8
