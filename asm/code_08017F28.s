	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitSyncMovement
UnitSyncMovement: @ 0x08017F28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08017F48
	ldr r1, _08017F68 @ =0x08B92EB0
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0x11]
	strb r0, [r1, #0x11]
_08017F48:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017F62
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
_08017F62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017F68: .4byte 0x08B92EB0
