	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080831B4
sub_080831B4: @ 0x080831B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r3, _08083214 @ =0x0203E6F4
	adds r2, r3, #0
	adds r2, #0x40
	ldr r0, _08083218 @ =0x000003FF
	ldrh r2, [r2]
	ands r0, r2
	ldrh r3, [r3, #0x18]
	adds r0, r3, r0
	lsls r0, r0, #5
	ldr r2, _0808321C @ =0x06010000
	adds r5, r0, r2
	movs r7, #0
	lsls r0, r1, #1
	cmp r7, r0
	bge _08083246
	adds r3, r0, #0
_080831E0:
	adds r4, r5, #0
	movs r2, #0
	adds r0, r7, #1
	mov r8, r0
	cmp r2, sb
	bge _0808323A
_080831EC:
	adds r6, r2, #1
	movs r1, #6
_080831F0:
	ldr r0, [r4, #4]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _080831F0
	subs r0, r3, #1
	cmp r7, r0
	bne _08083228
	str r3, [sp]
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	bne _08083224
	ldr r0, _08083220 @ =0x44444444
	b _08083232
	.align 2, 0
_08083214: .4byte 0x0203E6F4
_08083218: .4byte 0x000003FF
_0808321C: .4byte 0x06010000
_08083220: .4byte 0x44444444
_08083224:
	movs r0, #0
	b _08083232
_08083228:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
_08083232:
	stm r4!, {r0}
	adds r2, r6, #0
	cmp r2, sb
	blt _080831EC
_0808323A:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	mov r7, r8
	cmp r7, r3
	blt _080831E0
_08083246:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
