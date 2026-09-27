	.include "macro.inc"

	.syntax unified

	thumb_func_start EventClearTalkDisplayed
EventClearTalkDisplayed: @ 0x0800ECB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800ECC6
	bl ClearTalk
	b _0800ECEE
_0800ECC6:
	ldr r5, _0800ECF4 @ =0x08B907C0
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0800ECEE
	bl ClearTalkBubble
	ldr r1, _0800ECF8 @ =StartFaceFadeOut
	adds r0, r5, #0
	bl Proc_ForEach
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl StartTemporaryLock
_0800ECEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800ECF4: .4byte 0x08B907C0
_0800ECF8: .4byte StartFaceFadeOut
