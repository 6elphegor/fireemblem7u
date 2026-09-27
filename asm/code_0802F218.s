	.include "macro.inc"

	.syntax unified

	thumb_func_start DoAction
DoAction: @ 0x0802F218
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F23C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, _0802F240 @ =0x03004690
	str r0, [r1]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	cmp r0, #0x1a
	bhi _0802F31E
	lsls r0, r0, #2
	ldr r1, _0802F244 @ =_0802F248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802F23C: .4byte 0x0203A85C
_0802F240: .4byte 0x03004690
_0802F244: .4byte _0802F248
_0802F248: @ jump table
	.4byte _0802F2B4 @ case 0
	.4byte _0802F2E0 @ case 1
	.4byte _0802F314 @ case 2
	.4byte _0802F2E8 @ case 3
	.4byte _0802F31E @ case 4
	.4byte _0802F300 @ case 5
	.4byte _0802F2C8 @ case 6
	.4byte _0802F2D0 @ case 7
	.4byte _0802F31E @ case 8
	.4byte _0802F31E @ case 9
	.4byte _0802F31E @ case 10
	.4byte _0802F2F0 @ case 11
	.4byte _0802F2F8 @ case 12
	.4byte _0802F2D8 @ case 13
	.4byte _0802F2D8 @ case 14
	.4byte _0802F314 @ case 15
	.4byte _0802F31E @ case 16
	.4byte _0802F314 @ case 17
	.4byte _0802F31E @ case 18
	.4byte _0802F31E @ case 19
	.4byte _0802F31E @ case 20
	.4byte _0802F308 @ case 21
	.4byte _0802F314 @ case 22
	.4byte _0802F31E @ case 23
	.4byte _0802F31E @ case 24
	.4byte _0802F31E @ case 25
	.4byte _0802F2B4 @ case 26
_0802F2B4:
	ldr r0, _0802F2C4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	b _0802F31E
	.align 2, 0
_0802F2C4: .4byte 0x03004690
_0802F2C8:
	adds r0, r5, #0
	bl DoRescueAction
	b _0802F30E
_0802F2D0:
	adds r0, r5, #0
	bl DoRescueDropAction
	b _0802F30E
_0802F2D8:
	adds r0, r5, #0
	bl ActionVisitAndSeize
	b _0802F30E
_0802F2E0:
	adds r0, r5, #0
	bl sub_0802F460
	b _0802F30E
_0802F2E8:
	adds r0, r5, #0
	bl ActionDance
	b _0802F30E
_0802F2F0:
	adds r0, r5, #0
	bl ActionTalk
	b _0802F30E
_0802F2F8:
	adds r0, r5, #0
	bl ActionSupport
	b _0802F30E
_0802F300:
	adds r0, r5, #0
	bl sub_0802F5E8
	b _0802F30E
_0802F308:
	adds r0, r5, #0
	bl ActionArena
_0802F30E:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802F320
_0802F314:
	adds r0, r5, #0
	bl DoItemAction
	movs r0, #0
	b _0802F320
_0802F31E:
	movs r0, #1
_0802F320:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
