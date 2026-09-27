	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B84D0
sub_080B84D0: @ 0x080B84D0
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _080B8522
	lsls r0, r0, #2
	ldr r1, _080B84E8 @ =_080B84EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B84E8: .4byte _080B84EC
_080B84EC: @ jump table
	.4byte _080B8500 @ case 0
	.4byte _080B850C @ case 1
	.4byte _080B850C @ case 2
	.4byte _080B8518 @ case 3
	.4byte _080B8500 @ case 4
_080B8500:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	adds r2, r3, #0
	bl StartSoloEndingBattleDisplay
	b _080B8522
_080B850C:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl StartPairedEndingBattleDisplay
	b _080B8522
_080B8518:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl StartPairedEndingBattleDisplay
_080B8522:
	pop {r0}
	bx r0
	.align 2, 0
