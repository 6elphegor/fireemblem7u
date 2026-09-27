	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSupporterCount
GetUnitSupporterCount: @ 0x08026628
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026634
	ldrb r0, [r0, #0x15]
	b _08026636
_08026634:
	movs r0, #0
_08026636:
	bx lr
