	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801CA38
sub_0801CA38: @ 0x0801CA38
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CA78 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r5, r1, #0x18
	ldrb r0, [r4, #0x11]
	cmp r0, #0x1f
	bls _0801CA6C
	b _0801CB68
_0801CA6C:
	lsls r0, r0, #2
	ldr r1, _0801CA7C @ =_0801CA80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CA78: .4byte 0x0203A85C
_0801CA7C: .4byte _0801CA80
_0801CA80: @ jump table
	.4byte _0801CB00 @ case 0
	.4byte _0801CB68 @ case 1
	.4byte _0801CB68 @ case 2
	.4byte _0801CB68 @ case 3
	.4byte _0801CB68 @ case 4
	.4byte _0801CB68 @ case 5
	.4byte _0801CB68 @ case 6
	.4byte _0801CB68 @ case 7
	.4byte _0801CB68 @ case 8
	.4byte _0801CB40 @ case 9
	.4byte _0801CB40 @ case 10
	.4byte _0801CB68 @ case 11
	.4byte _0801CB68 @ case 12
	.4byte _0801CB68 @ case 13
	.4byte _0801CB68 @ case 14
	.4byte _0801CB68 @ case 15
	.4byte _0801CB68 @ case 16
	.4byte _0801CB68 @ case 17
	.4byte _0801CB68 @ case 18
	.4byte _0801CB68 @ case 19
	.4byte _0801CB68 @ case 20
	.4byte _0801CB68 @ case 21
	.4byte _0801CB68 @ case 22
	.4byte _0801CB68 @ case 23
	.4byte _0801CB26 @ case 24
	.4byte _0801CB34 @ case 25
	.4byte _0801CB58 @ case 26
	.4byte _0801CB68 @ case 27
	.4byte _0801CB68 @ case 28
	.4byte _0801CB68 @ case 29
	.4byte _0801CB4C @ case 30
	.4byte _0801CB4C @ case 31
_0801CB00:
	ldr r0, _0801CB14 @ =0x0202BBB8
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CB1C
	ldr r1, _0801CB18 @ =0x0203A85C
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	b _0801CB68
	.align 2, 0
_0801CB14: .4byte 0x0202BBB8
_0801CB18: .4byte 0x0203A85C
_0801CB1C:
	adds r0, r6, #0
	bl PlayerPhase_BackToMove
	movs r0, #1
	b _0801CB88
_0801CB26:
	ldr r0, _0801CB30 @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #2
	b _0801CB52
	.align 2, 0
_0801CB30: .4byte 0x0202BBB8
_0801CB34:
	ldr r0, _0801CB3C @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #4
	b _0801CB52
	.align 2, 0
_0801CB3C: .4byte 0x0202BBB8
_0801CB40:
	ldr r0, _0801CB48 @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #1
	b _0801CB52
	.align 2, 0
_0801CB48: .4byte 0x0202BBB8
_0801CB4C:
	ldr r0, _0801CB64 @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #8
_0801CB52:
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0801CB58:
	adds r0, r6, #0
	bl PlayerPhase_CancelAction
	movs r0, #1
	b _0801CB88
	.align 2, 0
_0801CB64: .4byte 0x0202BBB8
_0801CB68:
	ldr r1, _0801CB90 @ =0x0203A85C
	ldrb r0, [r1, #0x11]
	cmp r0, #1
	beq _0801CB84
	ldr r0, _0801CB94 @ =0x0202BBB8
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CB84
	movs r0, #1
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
_0801CB84:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
_0801CB88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801CB90: .4byte 0x0203A85C
_0801CB94: .4byte 0x0202BBB8
