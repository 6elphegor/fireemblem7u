	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepUnitSwap
StartPrepUnitSwap: @ 0x0801E480
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _0801E4B4 @ =0x08B93704
	adds r1, r6, #0
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	lsls r4, r4, #4
	strh r4, [r0, #0x34]
	lsls r5, r5, #4
	strh r5, [r0, #0x36]
	mov r0, r8
	bl HideUnitSprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E4B4: .4byte 0x08B93704
