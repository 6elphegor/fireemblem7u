	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035398
sub_08035398: @ 0x08035398
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080353D4 @ =0x0203A97C
	ldrb r2, [r3, #2]
	ldrb r4, [r3, #3]
	ldr r0, _080353D8 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _080353E4
	ldr r1, _080353DC @ =0x03004690
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r1, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r1, #0x11]
	ldr r1, _080353E0 @ =0x0203A85C
	movs r0, #0x17
	strb r0, [r1, #0x11]
	ldrb r0, [r3, #7]
	strb r0, [r1, #0x12]
	adds r0, r5, #0
	bl DoItemAction
	b _08035410
	.align 2, 0
_080353D4: .4byte 0x0203A97C
_080353D8: .4byte 0x0202E3E0
_080353DC: .4byte 0x03004690
_080353E0: .4byte 0x0203A85C
_080353E4:
	subs r1, r4, #1
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	ldr r0, _08035418 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08035404
	movs r0, #0xab
	bl m4aSongNumStart
_08035404:
	ldr r0, _0803541C @ =0x08B9701C
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
_08035410:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08035418: .4byte 0x0202BBF8
_0803541C: .4byte 0x08B9701C
