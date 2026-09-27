	.include "macro.inc"

	.syntax unified

	thumb_func_start TryRemoveUnitFromBallista
TryRemoveUnitFromBallista: @ 0x080347A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080347D8
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldr r1, [r4, #0xc]
	ldr r2, _080347E0 @ =0xFFFFF7FF
	ands r1, r2
	str r1, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #5]
	strb r1, [r4, #0x1c]
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
	bl RefreshUnitSprites
_080347D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080347E0: .4byte 0xFFFFF7FF
