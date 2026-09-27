	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSupportSubScreenPartners
InitSupportSubScreenPartners: @ 0x0809C924
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809C9B0
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809C9FA
	movs r1, #0x40
	adds r1, r1, r6
	mov sl, r1
_0809C950:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerCharId
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov sb, r4
	adds r4, r1, #0
_0809C96A:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809C99E
	ldr r0, [r1]
	cmp r0, #0
	beq _0809C99E
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _0809C99E
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809C99E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809C99A
	movs r0, #2
	b _0809C99C
_0809C99A:
	movs r0, #1
_0809C99C:
	strb r0, [r4]
_0809C99E:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809C96A
	mov r4, sb
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809C950
	b _0809C9FA
_0809C9B0:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _0809C9FA
	adds r7, r1, #0
_0809C9C6:
	adds r0, r6, #0
	adds r0, #0x40
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerIsAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C9F0
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	ldrb r1, [r7]
	adds r0, r1, r0
	strb r0, [r7]
_0809C9F0:
	adds r4, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r4, r2
	blt _0809C9C6
_0809C9FA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
