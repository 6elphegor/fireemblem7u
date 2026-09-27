	.include "macro.inc"

	.syntax unified

	thumb_func_start EndProcIfNotMarkedB
EndProcIfNotMarkedB: @ 0x080126D0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r1, [r1]
	cmp r1, #0xb
	beq _080126E0
	bl Proc_End
_080126E0:
	pop {r0}
	bx r0
