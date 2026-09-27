	.include "macro.inc"

	.syntax unified

	thumb_func_start StringEquals
StringEquals: @ 0x080130B4
	push {r4, lr}
	adds r4, r0, #0
	b _080130C6
_080130BA:
	adds r1, #1
	adds r4, #1
	cmp r2, r3
	beq _080130C6
	movs r0, #0
	b _080130D4
_080130C6:
	ldrb r2, [r4]
	ldrb r3, [r1]
	adds r0, r3, #0
	orrs r0, r2
	cmp r0, #0
	bne _080130BA
	movs r0, #1
_080130D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
