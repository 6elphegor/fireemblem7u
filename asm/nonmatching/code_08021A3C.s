	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitAttackCommandEffect
UnitAttackCommandEffect: @ 0x08021A3C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08021A5C
	ldr r1, _08021A58 @ =0x00000742
	adds r0, r5, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08021A90
	.align 2, 0
_08021A58: .4byte 0x00000742
_08021A5C:
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08021A80 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08021A84
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartFightItemReview
	b _08021A8C
	.align 2, 0
_08021A80: .4byte 0x03004690
_08021A84:
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartFightBallistaReview
_08021A8C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08021A90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
