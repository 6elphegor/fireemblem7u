	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadUnits
LoadUnits: @ 0x08017734
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _08017746
_0801773C:
	adds r0, r4, #0
	bl LoadUnit
	adds r4, #0x10
	adds r5, #1
_08017746:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801773C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
