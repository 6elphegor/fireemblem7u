	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueIntro_ReloadCg
NilsEpilogueIntro_ReloadCg: @ 0x0807F418
	push {lr}
	sub sp, #4
	ldr r0, _0807F454 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	ldr r2, _0807F458 @ =0x03002870
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807F454: .4byte 0x02024460
_0807F458: .4byte 0x03002870
