	.include "macro.inc"

	.syntax unified

	thumb_func_start PutTalkBubbleTail
PutTalkBubbleTail: @ 0x08009A90
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl GetBgTilemap
	adds r3, r0, #0
	cmp r6, #5
	bls _08009AA4
	b _08009C06
_08009AA4:
	lsls r0, r6, #2
	ldr r1, _08009AB0 @ =_08009AB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009AB0: .4byte _08009AB4
_08009AB4: @ jump table
	.4byte _08009ACC @ case 0
	.4byte _08009B00 @ case 1
	.4byte _08009B38 @ case 2
	.4byte _08009B6C @ case 3
	.4byte _08009BA4 @ case 4
	.4byte _08009BDC @ case 5
_08009ACC:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08009AF4 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08009AF8 @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009AFC @ =0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b _08009C02
	.align 2, 0
_08009AF4: .4byte 0x00003014
_08009AF8: .4byte 0x00003414
_08009AFC: .4byte 0x00003416
_08009B00:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08009B28 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08009B2C @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009B30 @ =0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, _08009B34 @ =0x00003016
	b _08009C02
	.align 2, 0
_08009B28: .4byte 0x00003014
_08009B2C: .4byte 0x00003414
_08009B30: .4byte 0x00003015
_08009B34: .4byte 0x00003016
_08009B38:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009B60 @ =0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009B64 @ =0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009B68 @ =0x00003C17
	b _08009C02
	.align 2, 0
_08009B60: .4byte 0x00003418
_08009B64: .4byte 0x00003419
_08009B68: .4byte 0x00003C17
_08009B6C:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009B94 @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009B98 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009B9C @ =0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009BA0 @ =0x00003019
	b _08009C02
	.align 2, 0
_08009B94: .4byte 0x00003017
_08009B98: .4byte 0x00003817
_08009B9C: .4byte 0x00003018
_08009BA0: .4byte 0x00003019
_08009BA4:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009BCC @ =0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009BD0 @ =0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009BD4 @ =0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009BD8 @ =0x00003C17
	b _08009C02
	.align 2, 0
_08009BCC: .4byte 0x00003C19
_08009BD0: .4byte 0x00003C18
_08009BD4: .4byte 0x00003417
_08009BD8: .4byte 0x00003C17
_08009BDC:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009C0C @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009C10 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009C14 @ =0x00003818
_08009C02:
	adds r1, r2, #0
	strh r1, [r0, #2]
_08009C06:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009C0C: .4byte 0x00003017
_08009C10: .4byte 0x00003817
_08009C14: .4byte 0x00003818
