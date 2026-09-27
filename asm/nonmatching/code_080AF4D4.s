	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassIntroLetter_LoopFadeOut
ClassIntroLetter_LoopFadeOut: @ 0x080AF4D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r1, [r5, #0x2a]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r2, r1, r6
	subs r3, r6, r1
	movs r0, #0x30
	ldrsh r4, [r5, r0]
	adds r0, r4, #0
	subs r0, #0x58
	muls r0, r1, r0
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldrh r1, [r5, #0x2c]
	mov ip, r1
	movs r7, #0x2e
	adds r7, r7, r5
	mov r8, r7
	ldrb r1, [r7]
	adds r4, r4, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	ldrh r0, [r5, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, ip
	adds r2, r4, #0
	movs r3, #0x18
	bl PutClassIntroLetter
	ldrh r0, [r5, #0x2a]
	cmp r0, r6
	bne _080AF53E
	ldr r0, _080AF550 @ =0x02000000
	mov r2, r8
	ldrb r2, [r2]
	lsls r1, r2, #2
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080AF53E:
	ldrh r0, [r5, #0x2a]
	adds r0, #8
	strh r0, [r5, #0x2a]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF550: .4byte 0x02000000
