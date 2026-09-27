	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassIntroLetter_LoopFadeIn
ClassIntroLetter_LoopFadeIn: @ 0x080AF368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0x2e
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	str r1, [sp, #0xc]
	cmp r1, #0
	bne _080AF444
	ldr r3, _080AF43C @ =0x080C5A48
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r1, #0
	ldrsh r4, [r0, r1]
	asrs r4, r4, #6
	mov sl, r4
	adds r0, r3, #0
	adds r0, #0xc0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #1
	adds r5, r5, r0
	asrs r5, r5, #9
	ldrh r0, [r7, #0x2a]
	movs r2, #0xc0
	subs r2, r2, r0
	movs r1, #0xff
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	asrs r6, r1, #6
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	asrs r3, r1, #9
	lsls r0, r0, #8
	movs r1, #0x60
	str r3, [sp, #0x14]
	bl __divsi3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r4, [r7, #0x2c]
	mov r8, r4
	mov r0, sb
	ldrb r0, [r0]
	mov sb, r0
	movs r2, #0x30
	ldrsh r4, [r7, r2]
	adds r4, r4, r6
	mov r0, sl
	subs r4, r4, r0
	ldr r0, _080AF440 @ =0x000001FF
	ands r4, r0
	subs r5, #0x18
	ldr r3, [sp, #0x14]
	subs r5, r3, r5
	ands r5, r0
	str r1, [sp]
	str r1, [sp, #4]
	ldrh r0, [r7, #0x2a]
	movs r1, #0xc
	bl __divsi3
	movs r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutClassIntroLetter
	ldrh r0, [r7, #0x2a]
	adds r0, #4
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne _080AF494
	mov r1, sp
	ldrh r1, [r1, #0xc]
	strh r1, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080AF494
	.align 2, 0
_080AF43C: .4byte 0x080C5A48
_080AF440: .4byte 0x000001FF
_080AF444:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	adds r2, r1, #0
	asrs r4, r0, #4
	movs r0, #0x10
	subs r6, r0, r4
	adds r3, r6, #0
	ldrh r5, [r7, #0x2c]
	mov r2, sb
	ldrb r6, [r2]
	movs r2, #0x30
	ldrsh r0, [r7, r2]
	subs r2, r0, r3
	movs r0, #0x18
	subs r3, r0, r3
	str r1, [sp]
	adds r0, #0xe8
	mov r8, r0
	str r0, [sp, #4]
	movs r0, #0x10
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutClassIntroLetter
	ldrh r0, [r7, #0x2a]
	adds r0, #0x10
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r8
	bne _080AF494
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
_080AF494:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
