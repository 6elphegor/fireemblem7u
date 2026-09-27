	.include "macro.inc"

	.syntax unified

	thumb_func_start NumberToStringAscii
NumberToStringAscii: @ 0x08014590
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	cmp r4, #0
	bne _080145AC
	ldr r0, _080145A8 @ =0x08B929FB
	ldrb r0, [r0]
	strb r0, [r5]
	strb r4, [r5, #1]
	movs r0, #1
	b _0801462A
	.align 2, 0
_080145A8: .4byte 0x08B929FB
_080145AC:
	cmp r4, #0
	bge _080145BA
	ldr r0, _080145C4 @ =0x08B929FC
	ldrb r0, [r0]
	strb r0, [r5]
	adds r5, #1
	rsbs r4, r4, #0
_080145BA:
	ldr r0, _080145C8 @ =0x0001869F
	cmp r4, r0
	ble _080145CC
	movs r6, #5
	b _080145FA
	.align 2, 0
_080145C4: .4byte 0x08B929FC
_080145C8: .4byte 0x0001869F
_080145CC:
	ldr r0, _080145D8 @ =0x0000270F
	cmp r4, r0
	ble _080145DC
	movs r6, #4
	b _080145FA
	.align 2, 0
_080145D8: .4byte 0x0000270F
_080145DC:
	ldr r0, _080145E8 @ =0x000003E7
	cmp r4, r0
	ble _080145EC
	movs r6, #3
	b _080145FA
	.align 2, 0
_080145E8: .4byte 0x000003E7
_080145EC:
	cmp r4, #0x63
	ble _080145F4
	movs r6, #2
	b _080145FA
_080145F4:
	cmp r4, #9
	ble _080145FA
	movs r6, #1
_080145FA:
	adds r7, r6, #0
	cmp r4, #0
	ble _08014622
_08014600:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r5, r6
	ldr r1, _08014630 @ =0x08B929FB
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r6, #1
	cmp r4, #0
	bgt _08014600
_08014622:
	adds r0, r5, r7
	movs r1, #0
	strb r1, [r0, #1]
	adds r0, r7, #1
_0801462A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014630: .4byte 0x08B929FB
