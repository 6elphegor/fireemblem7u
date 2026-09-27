	.include "macro.inc"

	.syntax unified

	thumb_func_start IsPositionMagicSealed
IsPositionMagicSealed: @ 0x0801871C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0x81
	ldr r6, _0801876C @ =0x08B92EB0
_08018726:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _0801877C
	ldr r1, [r2]
	cmp r1, #0
	beq _0801877C
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801877C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	subs r1, r0, r5
	cmp r1, #0
	bge _08018758
	subs r1, r5, r0
_08018758:
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	subs r0, r2, r4
	cmp r0, #0
	blt _08018770
	adds r0, r1, r0
	cmp r0, #0xa
	ble _08018778
	b _0801877C
	.align 2, 0
_0801876C: .4byte 0x08B92EB0
_08018770:
	subs r0, r4, r2
	adds r0, r1, r0
	cmp r0, #0xa
	bgt _0801877C
_08018778:
	movs r0, #1
	b _08018784
_0801877C:
	adds r3, #1
	cmp r3, #0xbf
	ble _08018726
	movs r0, #0
_08018784:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
