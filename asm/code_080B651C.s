	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameCombatRank
GetGameCombatRank: @ 0x080B651C
	push {lr}
	sub sp, #4
	ldr r1, _080B654C @ =0x085E9AC4
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl GetGameWinPerc
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B6534:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B6544
	adds r1, #1
	cmp r1, #3
	ble _080B6534
_080B6544:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B654C: .4byte 0x085E9AC4
