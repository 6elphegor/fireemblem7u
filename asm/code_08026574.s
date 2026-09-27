	.include "macro.inc"

	.syntax unified

	thumb_func_start HideUnitSprite
HideUnitSprite: @ 0x08026574
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08026580
	bl RefreshUnitSprites
_08026580:
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	beq _08026592
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r2, [r1, #0xb]
	orrs r0, r2
	strb r0, [r1, #0xb]
_08026592:
	pop {r4}
	pop {r0}
	bx r0
