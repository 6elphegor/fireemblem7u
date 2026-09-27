	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_Finish
Manim_Finish: @ 0x0806E474
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetMuAnims
	bl ResetTextFont
	bl EndManimInfoWindow
	bl InitBmBgLayers
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl IsEventRunning
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E4A4
	bl EndAllMus
_0806E4A4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
