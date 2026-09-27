	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshTorchlightsOnBmMap
RefreshTorchlightsOnBmMap: @ 0x08019A3C
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _08019A5C
_08019A48:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	bne _08019A5A
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #3]
	movs r3, #1
	bl MapAddInRange
_08019A5A:
	adds r4, #8
_08019A5C:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08019A48
	pop {r4}
	pop {r0}
	bx r0
