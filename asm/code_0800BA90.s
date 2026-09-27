	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkMoreByMode
EvtCmd_TalkMoreByMode: @ 0x0800BA90
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BAA8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BAAC
_0800BAA8:
	movs r0, #0
	b _0800BAD6
_0800BAAC:
	ldr r0, _0800BAC4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800BAC8
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BAD4
	.align 2, 0
_0800BAC4: .4byte 0x0202BBF8
_0800BAC8:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #8]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
_0800BAD4:
	movs r0, #2
_0800BAD6:
	pop {r1}
	bx r1
	.align 2, 0
