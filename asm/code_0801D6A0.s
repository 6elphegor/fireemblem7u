	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEnemyStartCursorPosition
GetEnemyStartCursorPosition: @ 0x0801D6A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0801D6B0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _0801D6F4
	.align 2, 0
_0801D6B0: .4byte 0x0202BBF8
_0801D6B4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801D6EE
	ldr r3, [r2]
	cmp r3, #0
	beq _0801D6EE
	ldr r0, [r2, #0xc]
	ldr r1, _0801D700 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _0801D6EE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	str r0, [r5]
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0801D6FA
_0801D6EE:
	adds r4, #1
	ldr r0, _0801D704 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
_0801D6F4:
	adds r0, #0x40
	cmp r4, r0
	blt _0801D6B4
_0801D6FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D700: .4byte 0x00000201
_0801D704: .4byte 0x0202BBF8
