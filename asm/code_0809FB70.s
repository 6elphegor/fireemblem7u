	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809FB70
sub_0809FB70: @ 0x0809FB70
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetChapterStats
	adds r4, r0, #0
	movs r5, #0
	ldr r1, _0809FBB0 @ =0x0000FF80
	adds r0, r1, #0
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0809FBA6
	adds r6, r1, #0
_0809FB8A:
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FB9C
	adds r5, #1
_0809FB9C:
	adds r4, #4
	ldrh r0, [r4]
	ands r0, r6
	cmp r0, #0
	bne _0809FB8A
_0809FBA6:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809FBB0: .4byte 0x0000FF80
