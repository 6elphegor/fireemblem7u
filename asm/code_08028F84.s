	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearBattleHits
ClearBattleHits: @ 0x08028F84
	push {r4, r5, lr}
	ldr r4, _08028FA8 @ =0x0203A4F0
	ldr r5, _08028FAC @ =0x0203A50C
	movs r2, #0
	movs r3, #0
	adds r0, r4, #0
	movs r1, #6
_08028F92:
	strh r3, [r0]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _08028F92
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028FA8: .4byte 0x0203A4F0
_08028FAC: .4byte 0x0203A50C
