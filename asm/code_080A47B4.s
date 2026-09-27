	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A47B4
sub_080A47B4: @ 0x080A47B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A47E4 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBoxExt_Unk
	ldr r0, _080A47E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A47DE
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080A47DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A47E4: .4byte 0x06013800
_080A47E8: .4byte 0x0202BBF8
