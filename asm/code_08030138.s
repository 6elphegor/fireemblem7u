	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030138
sub_08030138: @ 0x08030138
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08030146
	movs r0, #0
	b _08030196
_08030146:
	ldr r0, _08030168 @ =0x08B96444
	ldr r3, [r0]
	subs r4, r2, #1
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0803016C
	movs r0, #3
	b _08030196
	.align 2, 0
_08030168: .4byte 0x08B96444
_0803016C:
	cmp r1, r0
	ble _08030174
	movs r0, #1
	b _08030196
_08030174:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08030190
	movs r0, #4
	b _08030196
_08030190:
	cmp r1, r0
	ble _08030196
	movs r0, #2
_08030196:
	pop {r4}
	pop {r1}
	bx r1
