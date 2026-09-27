	.include "macro.inc"

	.syntax unified

	thumb_func_start GetConvoyItemCount
GetConvoyItemCount: @ 0x0802E770
	movs r3, #0
	ldr r2, _0802E78C @ =0x0203A720
	movs r1, #0x63
_0802E776:
	ldrh r0, [r2]
	cmp r0, #0
	beq _0802E77E
	adds r3, #1
_0802E77E:
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0802E776
	adds r0, r3, #0
	bx lr
	.align 2, 0
_0802E78C: .4byte 0x0203A720
