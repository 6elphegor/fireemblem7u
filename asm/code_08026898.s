	.include "macro.inc"

	.syntax unified

	thumb_func_start DoTurnSupportExp
DoTurnSupportExp: @ 0x08026898
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08026938 @ =0x0202BBF8
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	beq _08026984
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08026984
	movs r4, #1
_080268B4:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov sb, r4
	cmp r5, #0
	beq _0802697E
	ldr r0, [r5]
	cmp r0, #0
	beq _0802697E
	ldr r0, [r5, #0xc]
	ldr r1, _0802693C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802697E
	adds r0, r5, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _0802697E
	adds r0, r5, #0
	bl GetUnitSupporterCount
	mov r8, r0
	movs r7, #0
	cmp r7, r8
	bge _0802697E
_080268EC:
	adds r0, r5, #0
	adds r1, r7, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026978
	ldr r1, [r4, #0xc]
	ldr r0, _0802693C @ =0x0001000C
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0
	bne _08026978
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	mov ip, r1
	cmp r0, #0
	bne _08026978
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026924
	subs r1, r0, r2
_08026924:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08026940
	adds r0, r1, r2
	b _08026944
	.align 2, 0
_08026938: .4byte 0x0202BBF8
_0802693C: .4byte 0x0001000C
_08026940:
	subs r0, r0, r3
	adds r0, r1, r0
_08026944:
	cmp r0, #0
	beq _0802694E
	cmp r0, #1
	beq _08026956
	b _08026978
_0802694E:
	ldrb r0, [r5, #0x1b]
	cmp r0, ip
	bne _08026978
	b _08026966
_08026956:
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08026978
	ands r6, r1
	cmp r6, #0
	bne _08026978
_08026966:
	adds r0, r4, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _08026978
	adds r0, r5, #0
	adds r1, r7, #0
	bl UnitGainSupportExp
_08026978:
	adds r7, #1
	cmp r7, r8
	blt _080268EC
_0802697E:
	mov r4, sb
	cmp r4, #0x3f
	ble _080268B4
_08026984:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
