	.include "macro.inc"

	.syntax unified

	thumb_func_start AiRideBallistaAction
AiRideBallistaAction: @ 0x080354D4
	push {lr}
	ldr r1, _080354F4 @ =0x03004690
	ldr r2, [r1]
	ldr r3, _080354F8 @ =0x0203A97C
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl RideBallista
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080354F4: .4byte 0x03004690
_080354F8: .4byte 0x0203A97C
