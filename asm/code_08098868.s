	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098868
sub_08098868: @ 0x08098868
	push {r4, r5, lr}
	ldr r4, _080988A4 @ =0x02022E48
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0xe
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080988A4: .4byte 0x02022E48
