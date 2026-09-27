	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterAllyUnitCount
GetChapterAllyUnitCount: @ 0x0800F0AC
	push {lr}
	bl sub_08079280
	adds r1, r0, #0
	movs r2, #0
	b _0800F0BC
_0800F0B8:
	adds r2, #1
	adds r1, #0x10
_0800F0BC:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800F0B8
	adds r0, r2, #0
	pop {r1}
	bx r1
