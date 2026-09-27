	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_FogDraw
DebugMenu_FogDraw: @ 0x0801BCE4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r0, _0801BD54 @ =0x081C3B80
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801BD58 @ =0x00001253
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _0801BD5C @ =0x0202BBF8
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BD60 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BD54: .4byte 0x081C3B80
_0801BD58: .4byte 0x00001253
_0801BD5C: .4byte 0x0202BBF8
_0801BD60: .4byte 0x02022C60
