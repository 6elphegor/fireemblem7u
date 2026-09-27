	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueIntro_Loop_BlendCg
NilsEpilogueIntro_Loop_BlendCg: @ 0x0807F328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807F390 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r4, #0x10
	subs r0, r4, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807F388
	movs r0, #1
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	subs r1, #3
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r5, #0
	bl Proc_Break
_0807F388:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F390: .4byte 0x03002870
