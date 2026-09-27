	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSoloEndingBattleDisplay
StartSoloEndingBattleDisplay: @ 0x080B88C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080B88DC @ =0x08CEE930
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x38]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B88DC: .4byte 0x08CEE930
