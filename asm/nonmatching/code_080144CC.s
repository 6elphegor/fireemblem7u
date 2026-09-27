	.include "macro.inc"

	.syntax unified

	thumb_func_start NumberToStringSJis
NumberToStringSJis: @ 0x080144CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne _080144F4
	ldr r0, _080144F0 @ =0x08B929F4
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b _08014580
	.align 2, 0
_080144F0: .4byte 0x08B929F4
_080144F4:
	cmp r4, #0
	bge _08014506
	ldr r0, _08014510 @ =0x08B929F8
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	rsbs r4, r4, #0
	movs r5, #2
_08014506:
	ldr r0, _08014514 @ =0x0001869F
	cmp r4, r0
	ble _08014518
	adds r5, #0xa
	b _08014546
	.align 2, 0
_08014510: .4byte 0x08B929F8
_08014514: .4byte 0x0001869F
_08014518:
	ldr r0, _08014524 @ =0x0000270F
	cmp r4, r0
	ble _08014528
	adds r5, #8
	b _08014546
	.align 2, 0
_08014524: .4byte 0x0000270F
_08014528:
	ldr r0, _08014534 @ =0x000003E7
	cmp r4, r0
	ble _08014538
	adds r5, #6
	b _08014546
	.align 2, 0
_08014534: .4byte 0x000003E7
_08014538:
	cmp r4, #0x63
	ble _08014540
	adds r5, #4
	b _08014546
_08014540:
	cmp r4, #9
	ble _08014546
	adds r5, #2
_08014546:
	mov r8, r5
	cmp r4, #0
	ble _08014572
	ldr r7, _0801458C @ =0x08B929F4
_0801454E:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r0, r1, r0
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt _0801454E
_08014572:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
_08014580:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801458C: .4byte 0x08B929F4
