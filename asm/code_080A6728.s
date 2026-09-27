	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateTactMainHandPosition
UpdateTactMainHandPosition: @ 0x080A6728
	push {lr}
	ldr r1, _080A6744 @ =0x08CE45C0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0
	movs r3, #0
	bl SetUiCursorHandConfig
	pop {r0}
	bx r0
	.align 2, 0
_080A6744: .4byte 0x08CE45C0
