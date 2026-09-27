	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuWriteNewGame
SaveMenuWriteNewGame: @ 0x080A3C78
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #1
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r4, [r1]
	rsbs r0, r4, #0
	orrs r0, r4
	lsrs r1, r0, #0x1f
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A3C96
	movs r2, #2
_080A3C96:
	cmp r0, #2
	bne _080A3C9C
	movs r2, #3
_080A3C9C:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl WriteNewGameSave
	pop {r4}
	pop {r0}
	bx r0
