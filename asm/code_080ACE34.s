	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBonusItemClaimed
SetBonusItemClaimed: @ 0x080ACE34
	push {r4, r5, lr}
	ldr r1, _080ACE5C @ =0x08CE577C
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl GetBonusContentClaimFlags
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl SetBonusContentClaimFlags
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE5C: .4byte 0x08CE577C
