	.include "macro.inc"

	.syntax unified

	thumb_func_start StartGame
StartGame: @ 0x08012B00
	push {lr}
	ldr r0, _08012B2C @ =OnMain
	bl SetMainFunc
	ldr r0, _08012B30 @ =OnVBlank
	bl SetOnVBlank
	ldr r0, _08012B34 @ =0x08B924BC
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08012B2C: .4byte OnMain
_08012B30: .4byte OnVBlank
_08012B34: .4byte 0x08B924BC
