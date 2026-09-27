	.include "macro.inc"

	.syntax unified

	thumb_func_start SortAiUnitList
SortAiUnitList: @ 0x08034C84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	cmp r0, #1
	ble _08034CDA
	movs r5, #0
	subs r0, #2
	cmp r5, r0
	bgt _08034CDA
	mov ip, r0
	ldr r1, _08034CE8 @ =0x08B96ED0
	mov sb, r1
	ldr r1, _08034CEC @ =0x0203A8EC
	mov r8, r1
_08034CA2:
	adds r4, r0, #0
	adds r6, r5, #1
	cmp r0, r5
	blt _08034CD2
	mov r7, sb
	mov r1, r8
	adds r3, r0, r1
_08034CB0:
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	bls _08034CCA
	str r1, [r0]
	str r2, [r0, #4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	strb r0, [r3]
	strb r1, [r3, #1]
_08034CCA:
	subs r3, #1
	subs r4, #1
	cmp r4, r5
	bge _08034CB0
_08034CD2:
	adds r5, r6, #0
	mov r0, ip
	cmp r5, r0
	ble _08034CA2
_08034CDA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034CE8: .4byte 0x08B96ED0
_08034CEC: .4byte 0x0203A8EC
