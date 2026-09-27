	.include "macro.inc"

	.syntax unified

	thumb_func_start InitTextList
InitTextList: @ 0x080054C4
	push {r4, lr}
	adds r4, r0, #0
	b _080054D4
_080054CA:
	ldr r0, [r4]
	ldrb r1, [r4, #4]
	bl InitText
	adds r4, #8
_080054D4:
	ldr r0, [r4]
	cmp r0, #0
	bne _080054CA
	pop {r4}
	pop {r0}
	bx r0
