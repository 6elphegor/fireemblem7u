	.include "macro.inc"

	.syntax unified

	thumb_func_start InitTextFont
InitTextFont: @ 0x080053D4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080053DE
	ldr r4, _08005408 @ =0x02028D58
_080053DE:
	str r1, [r4]
	ldr r0, _0800540C @ =GetTextDrawDest
	str r0, [r4, #0xc]
	movs r1, #0
	strh r3, [r4, #0x14]
	lsls r0, r3, #0xc
	adds r0, r2, r0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl GetLang
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	bl InitSystemTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005408: .4byte 0x02028D58
_0800540C: .4byte GetTextDrawDest
