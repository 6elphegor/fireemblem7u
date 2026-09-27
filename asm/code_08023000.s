	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023000
sub_08023000: @ 0x08023000
	push {r4, lr}
	adds r4, r0, #0
	bl StartUnitInventoryInfoWindow
	ldr r0, _0802301C @ =0x00000721
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802301C: .4byte 0x00000721
