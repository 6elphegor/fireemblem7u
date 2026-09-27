	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046B6C
sub_08046B6C: @ 0x08046B6C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
	ldr r0, _08046B88 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046B88: .4byte 0x03004690
