	.include "macro.inc"

	.syntax unified

	thumb_func_start RemoveItemFromConvoy
RemoveItemFromConvoy: @ 0x0802E7C8
	push {lr}
	ldr r1, _0802E7DC @ =0x0203A720
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	bl ShrinkConvoyItemList
	pop {r0}
	bx r0
	.align 2, 0
_0802E7DC: .4byte 0x0203A720
