	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08042C58
sub_08042C58: @ 0x08042C58
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	bl UnsetBmStLinkArenaFlag
	ldr r0, _08042CA4 @ =0x0203DA60
	ldr r1, _08042CA8 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r1, _08042CAC @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	ldr r1, _08042CB0 @ =0x0202BBF8
	adds r1, #0x41
	subs r0, #0xd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08042CB4 @ =0x08B98E14
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #7
	strb r1, [r2]
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042CA4: .4byte 0x0203DA60
_08042CA8: .4byte 0x06001800
_08042CAC: .4byte 0x0203D90C
_08042CB0: .4byte 0x0202BBF8
_08042CB4: .4byte 0x08B98E14
