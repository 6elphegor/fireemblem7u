	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F828
sub_0800F828: @ 0x0800F828
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F83E
	bl WmMergeMonsters
	movs r0, #2
	b _0800F840
_0800F83E:
	movs r0, #0
_0800F840:
	pop {r1}
	bx r1
