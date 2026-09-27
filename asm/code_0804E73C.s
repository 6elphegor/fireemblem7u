	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxQuakePure
NewEfxQuakePure: @ 0x0804E73C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E774 @ =0x08B9AD94
	movs r1, #3
	bl Proc_Start
	ldr r2, _0804E778 @ =0x08B9ADAC
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804E774: .4byte 0x08B9AD94
_0804E778: .4byte 0x08B9ADAC
