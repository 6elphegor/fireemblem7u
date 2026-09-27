	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPostLynModeChapter
SetPostLynModeChapter: @ 0x0807F0C4
	push {r4, lr}
	ldr r4, _0807F0D4 @ =0x0202BBF8
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	beq _0807F0D8
	cmp r0, #3
	beq _0807F0E2
	b _0807F0EC
	.align 2, 0
_0807F0D4: .4byte 0x0202BBF8
_0807F0D8:
	movs r0, #0xc
	bl SetNextChapterId
	movs r0, #0xc
	b _0807F0EA
_0807F0E2:
	movs r0, #0xd
	bl SetNextChapterId
	movs r0, #0xd
_0807F0EA:
	strb r0, [r4, #0xe]
_0807F0EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
