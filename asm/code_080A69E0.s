	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A69E0
sub_080A69E0: @ 0x080A69E0
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysHandCursor
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r4, #0
	bl sub_080A66D8
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl UpdateTactMainHandShadow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
