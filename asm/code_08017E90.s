	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitKill
UnitKill: @ 0x08017E90
	push {lr}
	adds r2, r0, #0
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08017EAE
	ldr r0, [r2, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl ClearUnitSupports
	b _08017EB2
_08017EAE:
	movs r0, #0
	str r0, [r2]
_08017EB2:
	pop {r0}
	bx r0
	.align 2, 0
