	.include "macro.inc"

	.syntax unified

	thumb_func_start SioInit
SioInit: @ 0x0803D988
	push {lr}
	bl SioRegisterIrq
	bl sub_0803C414
	ldr r2, _0803D9A4 @ =0x08B98AEC
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_0803D9A4: .4byte 0x08B98AEC
