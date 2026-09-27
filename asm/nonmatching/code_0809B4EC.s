	.include "macro.inc"

	.syntax unified

	thumb_func_start Support_GetSupportLevelTextColor
Support_GetSupportLevelTextColor: @ 0x0809B4EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B508
	adds r0, r6, #0
	bl GetTotalSupportLevel
	cmp r0, #5
	beq _0809B54A
	b _0809B550
_0809B508:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl GetTotalSupportLevel
	mov sb, r0
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _0809B546
_0809B526:
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	adds r0, r4, #0
	bl GetUnitsAverageSupportValue
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _0809B526
_0809B546:
	cmp r8, sb
	bne _0809B54E
_0809B54A:
	movs r0, #2
	b _0809B55A
_0809B54E:
	mov r0, sb
_0809B550:
	cmp r0, #0
	beq _0809B558
	movs r0, #1
	b _0809B55A
_0809B558:
	movs r0, #0
_0809B55A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
