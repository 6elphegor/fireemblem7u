	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsInShortList
AiIsInShortList: @ 0x08035E0C
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _08035E1C
_08035E12:
	cmp r2, r1
	bne _08035E1A
	movs r0, #1
	b _08035E24
_08035E1A:
	adds r0, #2
_08035E1C:
	ldrh r2, [r0]
	cmp r2, #0
	bne _08035E12
	movs r0, #0
_08035E24:
	bx lr
	.align 2, 0
