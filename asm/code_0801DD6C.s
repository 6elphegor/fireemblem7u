	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801DD6C
sub_0801DD6C: @ 0x0801DD6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x64
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801DD7E
	b _0801DEEA
_0801DD7E:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0801DD8E
	b _0801DEEA
_0801DD8E:
	ldr r6, _0801DEF4 @ =0x0203A3F0
	movs r0, #0x5a
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0801DEF8 @ =0x0203A470
	adds r7, r5, #0
	adds r7, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	ble _0801DDC2
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl PutSysArrow
_0801DDC2:
	mov r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bge _0801DDEA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl PutSysArrow
_0801DDEA:
	adds r7, r6, #0
	adds r7, #0x60
	movs r0, #0x60
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801DE1A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl PutSysArrow
_0801DE1A:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801DE42
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl PutSysArrow
_0801DE42:
	adds r7, r6, #0
	adds r7, #0x66
	movs r0, #0x66
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801DE72
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl PutSysArrow
_0801DE72:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801DE9A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl PutSysArrow
_0801DE9A:
	adds r6, #0x62
	adds r5, #0x62
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0801DEC4
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl PutSysArrow
_0801DEC4:
	movs r3, #0
	ldrsh r1, [r6, r3]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _0801DEEA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl PutSysArrow
_0801DEEA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DEF4: .4byte 0x0203A3F0
_0801DEF8: .4byte 0x0203A470
