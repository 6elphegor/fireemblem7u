	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_HandlePressA
PrepUnit_HandlePressA: @ 0x08093690
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080936D0
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _080936CC @ =0x000003B1
_080936C2:
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _0809372C
	.align 2, 0
_080936CC: .4byte 0x000003B1
_080936D0:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0809371A
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093710
	adds r0, r5, #0
	bl sub_08090DB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093710
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809370C @ =0x000003AD
	b _080936C2
	.align 2, 0
_0809370C: .4byte 0x000003AD
_08093710:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PrepCheckCanSelectUnit
	b _08093722
_0809371A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PrepCheckCanUnselectUnit
_08093722:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809372C
	movs r0, #1
	b _0809372E
_0809372C:
	movs r0, #0
_0809372E:
	pop {r4, r5}
	pop {r1}
	bx r1
