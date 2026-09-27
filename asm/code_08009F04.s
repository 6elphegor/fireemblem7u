	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTalkFaceHPos
GetTalkFaceHPos: @ 0x08009F04
	push {r4, lr}
	adds r4, r0, #0
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009F1E
	cmp r4, #2
	bgt _08009F1A
	movs r0, #4
	b _08009F26
_08009F1A:
	movs r0, #0x1a
	b _08009F26
_08009F1E:
	ldr r0, _08009F2C @ =0x08B90BCC
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08009F26:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08009F2C: .4byte 0x08B90BCC
