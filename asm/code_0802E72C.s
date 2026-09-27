	.include "macro.inc"

	.syntax unified

	thumb_func_start ShrinkConvoyItemList
ShrinkConvoyItemList: @ 0x0802E72C
	push {r4, r5, r6, lr}
	ldr r6, _0802E76C @ =0x02020140
	adds r4, r6, #0
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r5, #0
_0802E73A:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0802E744
	strh r0, [r4]
	adds r4, #2
_0802E744:
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x63
	bls _0802E73A
	movs r0, #0
	strh r0, [r4]
	bl ClearSupplyItems
	bl GetConvoyItemArray
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E76C: .4byte 0x02020140
