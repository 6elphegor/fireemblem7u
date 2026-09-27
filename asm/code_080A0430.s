	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A0430
sub_080A0430: @ 0x080A0430
	push {r4, lr}
	movs r0, #0
	bl GetChapterStats
	adds r4, r0, #0
	bl GetNextChapterStatsSlot
	cmp r0, #0
	beq _080A044C
	movs r0, #0x7f
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080A0450
_080A044C:
	movs r0, #0
	b _080A0452
_080A0450:
	movs r0, #1
_080A0452:
	pop {r4}
	pop {r1}
	bx r1
