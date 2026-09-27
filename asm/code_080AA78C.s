	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBmBgfx
StartBmBgfx: @ 0x080AA78C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	ldr r1, [sp, #0x30]
	cmp r1, #0
	bne _080AA7B4
	ldr r0, _080AA7B0 @ =0x08CE4CB0
	movs r1, #3
	b _080AA7B6
	.align 2, 0
_080AA7B0: .4byte 0x08CE4CB0
_080AA7B4:
	ldr r0, _080AA830 @ =0x08CE4CB0
_080AA7B6:
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	ldr r0, [sp, #0x28]
	strb r0, [r1]
	cmp r7, #0
	bge _080AA7D6
	movs r7, #0x80
	lsls r7, r7, #7
_080AA7D6:
	cmp r6, #0
	bge _080AA7DC
	movs r6, #0
_080AA7DC:
	mov r0, r8
	bl GetBgChrOffset
	str r0, [r4, #0x3c]
	str r6, [r4, #0x40]
	str r7, [r4, #0x48]
	mov r2, sb
	strh r2, [r4, #0x30]
	mov r6, sl
	strh r6, [r4, #0x32]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x58]
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	rsbs r1, r2, #0
	movs r3, #0xff
	ands r1, r3
	mov r6, sl
	rsbs r2, r6, #0
	ands r2, r3
	bl SetBgOffset
	ldrb r0, [r5]
	cmp r0, #9
	bhi _080AA822
_080AA812:
	ldr r0, [r4, #0x4c]
	ldrb r1, [r5, #0xa]
	adds r0, r1, r0
	str r0, [r4, #0x4c]
	adds r5, #0xc
	ldrb r2, [r5]
	cmp r2, #9
	bls _080AA812
_080AA822:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA830: .4byte 0x08CE4CB0
