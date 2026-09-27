	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BD3C
sub_0803BD3C: @ 0x0803BD3C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0803BED0
	ldr r0, _0803BD58 @ =0x08B98AEA
	movs r1, #0
	adds r2, r4, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BD5C
	movs r0, #1
	b _0803BD5E
	.align 2, 0
_0803BD58: .4byte 0x08B98AEA
_0803BD5C:
	movs r0, #0
_0803BD5E:
	pop {r4}
	pop {r1}
	bx r1
