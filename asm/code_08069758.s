	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_InitCounterForMainAnim
EkrLvup_InitCounterForMainAnim: @ 0x08069758
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _0806976C
	adds r0, r1, #0
	bl Proc_Break
	b _08069784
_0806976C:
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _08069784
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl Proc_Break
_08069784:
	pop {r0}
	bx r0
