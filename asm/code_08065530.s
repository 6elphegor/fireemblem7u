	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_TriggerEnding
EkrDragon_TriggerEnding: @ 0x08065530
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
