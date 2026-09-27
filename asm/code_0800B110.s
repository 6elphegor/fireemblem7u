	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800B110
sub_0800B110: @ 0x0800B110
	push {lr}
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800B12C
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	bl UnpackUiWindowFrameGraphics
_0800B12C:
	pop {r0}
	bx r0
