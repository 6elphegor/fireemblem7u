	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxTriangleQUAKE
NewEfxTriangleQUAKE: @ 0x0806ADE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0806AE10 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806AE14 @ =0x08BDB93C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AE10: .4byte 0x0201774C
_0806AE14: .4byte 0x08BDB93C
