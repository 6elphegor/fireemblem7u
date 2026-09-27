	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemStatBoostAction
DoItemStatBoostAction: @ 0x0802CE60
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802CEB8 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, _0802CEBC @ =0x0203A470
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl ApplyItemStatBoost
	adds r5, r0, #0
	ldr r0, _0802CEC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802CE9A
	ldr r0, _0802CEC4 @ =0x0000037A
	bl m4aSongNumStart
_0802CE9A:
	adds r0, r6, #0
	bl GetItemIconId
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CEB8: .4byte 0x0203A85C
_0802CEBC: .4byte 0x0203A470
_0802CEC0: .4byte 0x0202BBF8
_0802CEC4: .4byte 0x0000037A
