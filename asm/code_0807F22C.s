	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueIntro_CopyBg3ToBg1
NilsEpilogueIntro_CopyBg3ToBg1: @ 0x0807F22C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0807F2C0 @ =0x03002870
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r6, #4
	orrs r0, r6
	movs r1, #8
	orrs r0, r1
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	ldr r0, _0807F2C4 @ =0x06008000
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _0807F2C8 @ =0x02024460
	ldr r1, _0807F2CC @ =0x02023460
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	ldrb r0, [r7, #1]
	orrs r4, r0
	movs r0, #2
	orrs r4, r0
	orrs r4, r6
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	strb r4, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0807F2D0 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0807F2D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F2C0: .4byte 0x03002870
_0807F2C4: .4byte 0x06008000
_0807F2C8: .4byte 0x02024460
_0807F2CC: .4byte 0x02023460
_0807F2D0: .4byte 0x0000FFE0
_0807F2D4: .4byte 0x0000E0FF
