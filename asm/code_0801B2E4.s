	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugPrint
DebugPrint: @ 0x0801B2E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _0801B310 @ =0x08B93344
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	str r4, [r0, #0x54]
	adds r0, #0x52
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B310: .4byte 0x08B93344
