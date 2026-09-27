	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitItemCount
GetUnitItemCount: @ 0x080176DC
	movs r2, #4
	adds r1, r0, #0
	adds r1, #0x26
_080176E2:
	ldrh r0, [r1]
	cmp r0, #0
	beq _080176EC
	adds r0, r2, #1
	b _080176F6
_080176EC:
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080176E2
	movs r0, #0
_080176F6:
	bx lr
