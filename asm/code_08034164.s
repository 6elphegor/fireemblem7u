	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateBattleForecastContents
UpdateBattleForecastContents: @ 0x08034164
	push {lr}
	ldr r0, _08034188 @ =0x08B96D5C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08034184
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08034184
	adds r1, #0x34
	movs r0, #1
	strb r0, [r1]
_08034184:
	pop {r0}
	bx r0
	.align 2, 0
_08034188: .4byte 0x08B96D5C
