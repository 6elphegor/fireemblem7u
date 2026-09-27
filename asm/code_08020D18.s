	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020D18
sub_08020D18: @ 0x08020D18
	push {lr}
	ldr r3, _08020D60 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08020D64 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _08020D68 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_08020D60: .4byte 0x03002870
_08020D64: .4byte 0x0000FFE0
_08020D68: .4byte 0x0000E0FF
