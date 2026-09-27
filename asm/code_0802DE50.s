	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableTilesetPalAnim
DisableTilesetPalAnim: @ 0x0802DE50
	push {lr}
	ldr r0, _0802DE68 @ =0x08B96158
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0802DE62
	movs r0, #0
	str r0, [r1, #0x38]
_0802DE62:
	pop {r0}
	bx r0
	.align 2, 0
_0802DE68: .4byte 0x08B96158
