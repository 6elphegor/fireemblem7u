	.include "macro.inc"

	.syntax unified

	thumb_func_start SupportSubScreen_OnEnd
SupportSubScreen_OnEnd: @ 0x0809D6A8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_0809BF78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
