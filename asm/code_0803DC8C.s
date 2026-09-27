	.include "macro.inc"

	.syntax unified

	thumb_func_start PutSioText
PutSioText: @ 0x0803DC8C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, _0803DCB8 @ =0x0203DC08
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	cmp r6, #0
	bge _0803DCC0
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0803DCBC @ =0x02023C62
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b _0803DCE6
	.align 2, 0
_0803DCB8: .4byte 0x0203DC08
_0803DCBC: .4byte 0x02023C62
_0803DCC0:
	adds r0, r6, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0803DCEC @ =0x02023C62
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #4
	bl EnableBgSync
_0803DCE6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DCEC: .4byte 0x02023C62
