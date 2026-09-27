	.include "macro.inc"

	.syntax unified

	thumb_func_start StartChapterStatusHelpBox
StartChapterStatusHelpBox: @ 0x080867F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08086814 @ =0x06014800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, _08086818 @ =0x08CE5D74
	adds r1, r4, #0
	bl StartMovingHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086814: .4byte 0x06014800
_08086818: .4byte 0x08CE5D74
