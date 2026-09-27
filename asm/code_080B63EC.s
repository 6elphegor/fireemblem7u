	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameSurvivalRank
GetGameSurvivalRank: @ 0x080B63EC
	push {lr}
	sub sp, #4
	ldr r1, _080B6420 @ =0x085E9AC0
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl GetGameDeathCount
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B6404:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B6418
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B6404
_080B6418:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B6420: .4byte 0x085E9AC0
