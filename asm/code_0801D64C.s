	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPlayerStartCursorPosition
GetPlayerStartCursorPosition: @ 0x0801D64C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0801D68C @ =0x0202BBF8
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0801D66A
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #0x13]
_0801D66A:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0801D690
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r5]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	b _0801D696
	.align 2, 0
_0801D68C: .4byte 0x0202BBF8
_0801D690:
	ldrb r0, [r4, #0x12]
	str r0, [r5]
	ldrb r0, [r4, #0x13]
_0801D696:
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
