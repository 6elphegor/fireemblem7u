	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CA38
sub_0809CA38: @ 0x0809CA38
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0809CA5E
	ldr r0, [r4, #0x2c]
	bl GetTotalSupportLevel
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _0809CAAC
_0809CA5E:
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	mov sb, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _0809CA9C
	mov r6, r8
_0809CA7E:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	mov r0, sb
	bl GetUnitsAverageSupportValue
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _0809CA7E
_0809CA9C:
	ldr r0, [r4, #0x2c]
	bl GetTotalSupportLevel
	mov r1, r8
	ldrb r1, [r1]
	subs r0, r1, r0
	mov r2, r8
	strb r0, [r2]
_0809CAAC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
