	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08042BB8
sub_08042BB8: @ 0x08042BB8
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	ldr r0, _08042C20 @ =0x0203DA60
	ldr r1, _08042C24 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	movs r0, #5
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042BDC
	bl sub_080A1AC8
_08042BDC:
	ldr r1, _08042C28 @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl SetBmStLinkArenaFlag
	bl sub_08044ED8
	bl StartBmVSync
	ldr r1, _08042C2C @ =0x0202BBF8
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08042C30 @ =0x08B99640
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, _08042C34 @ =0x08B9333C
	movs r1, #3
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042C20: .4byte 0x0203DA60
_08042C24: .4byte 0x06001800
_08042C28: .4byte 0x0203D90C
_08042C2C: .4byte 0x0202BBF8
_08042C30: .4byte 0x08B99640
_08042C34: .4byte 0x08B9333C
