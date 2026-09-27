	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005EF8
sub_08005EF8: @ 0x08005EF8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08005F66
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x36
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r5, r1
	bge _08005F66
_08005F24:
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	blt _08005F54
	cmp r2, #1
	ble _08005F38
	cmp r2, #4
	beq _08005F46
	b _08005F54
_08005F38:
	ldr r1, [r4, #0x2c]
	movs r0, #0
	strb r0, [r1, #7]
	adds r0, r4, #0
	bl Proc_Break
	b _08005F66
_08005F46:
	adds r0, r1, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl Text_Skip
	b _08005F5C
_08005F54:
	ldr r0, [r4, #0x2c]
	bl Text_DrawCharacter
	str r0, [r4, #0x30]
_08005F5C:
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r5, r0
	blt _08005F24
_08005F66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
