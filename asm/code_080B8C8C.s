	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPairedEndingBattleDisplay
StartPairedEndingBattleDisplay: @ 0x080B8C8C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B8CA8 @ =0x08CEE950
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8CA8: .4byte 0x08CEE950
