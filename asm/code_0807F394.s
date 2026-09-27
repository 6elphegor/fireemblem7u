	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueIntro_ClearBg1Bg2
NilsEpilogueIntro_ClearBg1Bg2: @ 0x0807F394
	push {r4, lr}
	ldr r1, _0807F40C @ =0x03002870
	mov ip, r1
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	mov r3, ip
	ldrb r3, [r3, #0xc]
	ands r1, r3
	mov r4, ip
	strb r1, [r4, #0xc]
	adds r1, r2, #0
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r4, #0x10]
	ldrb r4, [r4, #0x14]
	ands r2, r4
	movs r1, #2
	orrs r2, r1
	mov r1, ip
	strb r2, [r1, #0x14]
	movs r1, #3
	mov r2, ip
	ldrb r2, [r2, #0x18]
	orrs r1, r2
	mov r3, ip
	strb r1, [r3, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	bl EndDragonGatefx
	ldr r0, _0807F410 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807F414 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F40C: .4byte 0x03002870
_0807F410: .4byte 0x02023460
_0807F414: .4byte 0x02023C60
