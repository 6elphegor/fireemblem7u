	.include "macro.inc"

	.syntax unified

	thumb_func_start StartGasTrapAnim
StartGasTrapAnim: @ 0x0801ED04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0801ED30 @ =0x08B937F4
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	adds r0, #0x4a
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED30: .4byte 0x08B937F4
