	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_InitItemText
TradeMenu_InitItemText: @ 0x0802AD6C
	push {r4, r5, r6, r7, lr}
	movs r1, #0
	ldr r7, _0802AD9C @ =0x0200278C
_0802AD72:
	movs r5, #0
	lsls r0, r1, #2
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r7, r0
_0802AD7E:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	adds r5, #1
	cmp r5, #4
	ble _0802AD7E
	adds r1, r6, #0
	cmp r1, #1
	ble _0802AD72
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AD9C: .4byte 0x0200278C
