	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801CDBC
sub_0801CDBC: @ 0x0801CDBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CE20 @ =0x03004690
	ldr r1, [r4]
	ldr r5, _0801CE24 @ =0x0203A85C
	ldrb r0, [r5, #0xe]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r5, #0xf]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CE06
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	bne _0801CE06
	ldr r0, _0801CE28 @ =0x0202BBB8
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CE06
	ldr r0, _0801CE2C @ =0x0202E3E4
	ldr r1, [r0]
	ldrb r2, [r5, #0xf]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r3, [r5, #0xe]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
_0801CE06:
	bl ResetTextFont
	bl sub_08079004
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801CE34
	ldr r1, _0801CE30 @ =sub_0801CD80
	adds r0, r6, #0
	bl Proc_SetRepeatCb
	b _0801CE58
	.align 2, 0
_0801CE20: .4byte 0x03004690
_0801CE24: .4byte 0x0203A85C
_0801CE28: .4byte 0x0202BBB8
_0801CE2C: .4byte 0x0202E3E4
_0801CE30: .4byte sub_0801CD80
_0801CE34:
	ldr r0, _0801CE60 @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	beq _0801CE52
	ldr r0, _0801CE64 @ =0x08B95AAC
	ldr r2, _0801CE68 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
_0801CE52:
	adds r0, r6, #0
	bl Proc_Break
_0801CE58:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801CE60: .4byte 0x0203A85C
_0801CE64: .4byte 0x08B95AAC
_0801CE68: .4byte 0x0202BBB8
