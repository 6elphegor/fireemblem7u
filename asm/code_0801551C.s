	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBmBgLayers
InitBmBgLayers: @ 0x0801551C
	ldr r0, _08015554 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _0801555C
	ldr r3, _08015558 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	orrs r2, r1
	strb r2, [r3, #0x18]
	b _08015588
	.align 2, 0
_08015554: .4byte 0x0202BBF8
_08015558: .4byte 0x03002870
_0801555C:
	ldr r3, _0801558C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
_08015588:
	bx lr
	.align 2, 0
_0801558C: .4byte 0x03002870
