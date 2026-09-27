	.include "macro.inc"

	.syntax unified

	thumb_func_start BmVSync_AnimInit
BmVSync_AnimInit: @ 0x0802D324
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	ldr r5, _0802D360 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldr r6, _0802D364 @ =0x08C9C9C8
	ldrb r0, [r0, #9]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x30]
	str r0, [r4, #0x2c]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D360: .4byte 0x0202BBF8
_0802D364: .4byte 0x08C9C9C8
