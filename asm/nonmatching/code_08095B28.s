	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemUseBooster_IDLE
PrepItemUseBooster_IDLE: @ 0x08095B28
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _08095B64 @ =0x0000A580
	str r4, [sp]
	bl PrepItemDrawPopupBox
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _08095B56
	ldr r0, _08095B68 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095B5C
_08095B56:
	adds r0, r5, #0
	bl Proc_Break
_08095B5C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095B64: .4byte 0x0000A580
_08095B68: .4byte 0x08B857F8
