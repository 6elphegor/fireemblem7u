	.include "macro.inc"

	.syntax unified

	thumb_func_start Destruct6CBMXFADE
Destruct6CBMXFADE: @ 0x0801D5EC
	push {r4, lr}
	adds r4, r0, #0
	bl SetAllUnitNotBackSprite
	adds r4, #0x4e
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801D602
	bl UnlockGame
_0801D602:
	pop {r4}
	pop {r0}
	bx r0
