	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_TriggerIntroDone
EkrDragon_TriggerIntroDone: @ 0x080653B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonFxMain
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
