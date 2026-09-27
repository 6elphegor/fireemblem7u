	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F9A4
sub_0802F9A4: @ 0x0802F9A4
	push {r4, lr}
	bl GetActiveMapSong
	adds r4, r0, #0
	bl GetCurrentBgmSong
	cmp r0, r4
	beq _0802F9BE
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl StartBgmExt
_0802F9BE:
	pop {r4}
	pop {r0}
	bx r0
