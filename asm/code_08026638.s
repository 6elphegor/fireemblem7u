	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSupportPid
GetUnitSupportPid: @ 0x08026638
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026646
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026648
_08026646:
	movs r0, #0
_08026648:
	bx lr
	.align 2, 0
