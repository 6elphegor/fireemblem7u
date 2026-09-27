	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023398
sub_08023398: @ 0x08023398
	push {r4, lr}
	adds r4, r0, #0
	bl StartUnitInventoryInfoWindow
	movs r0, #0xe4
	lsls r0, r0, #3
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
