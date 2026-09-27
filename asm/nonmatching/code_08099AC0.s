	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099AC0
sub_08099AC0: @ 0x08099AC0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x14
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r6, _08099B54 @ =0x0840E830
	adds r3, r4, #0
	adds r3, #0x34
	movs r5, #0xff
_08099AEC:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _08099AEC
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, _08099B58 @ =0x06017000
	adds r0, r6, #0
	bl Decompress
	ldr r0, _08099B5C @ =0x0840E978
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08099B60 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08099B64 @ =sub_08099968
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl StartGreenText
	ldr r2, _08099B68 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x3c
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099B54: .4byte 0x0840E830
_08099B58: .4byte 0x06017000
_08099B5C: .4byte 0x0840E978
_08099B60: .4byte 0x0202BBF8
_08099B64: .4byte sub_08099968
_08099B68: .4byte 0x03002870
