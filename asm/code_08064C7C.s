	.include "macro.inc"

	.syntax unified

	thumb_func_start InitEkrDragonStatus
InitEkrDragonStatus: @ 0x08064C7C
	push {lr}
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064C8C
	movs r0, #0
	bl SetAnimStateHidden
_08064C8C:
	pop {r0}
	bx r0
