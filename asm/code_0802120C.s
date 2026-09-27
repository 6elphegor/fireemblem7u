	.include "macro.inc"

	.syntax unified

	thumb_func_start SwingSwordfx_End
SwingSwordfx_End: @ 0x0802120C
	push {lr}
	ldr r2, _08021230 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_08021230: .4byte 0x03002870
