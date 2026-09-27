	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTriangle
NewEkrTriangle: @ 0x0806A4BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A4D8 @ =0x08BDB874
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	ldr r1, _0806A4DC @ =0x02020134
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A4D8: .4byte 0x08BDB874
_0806A4DC: .4byte 0x02020134
