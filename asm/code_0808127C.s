	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreen_Main
StatScreen_Main: @ 0x0808127C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _08081304 @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0808131C
	ldr r3, _08081308 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r4, r3, #0
	adds r4, #0x46
	movs r0, #0x10
	strb r0, [r4]
	ldr r0, _0808130C @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081310 @ =0x02022860
	strh r2, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08081314 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080812FA
	b _08081400
_080812FA:
	ldr r0, _08081318 @ =0x0000038B
	bl m4aSongNumStart
	b _08081400
	.align 2, 0
_08081304: .4byte 0x08B857F8
_08081308: .4byte 0x03002870
_0808130C: .4byte 0x0000FFE0
_08081310: .4byte 0x02022860
_08081314: .4byte 0x0202BBF8
_08081318: .4byte 0x0000038B
_0808131C:
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081340
	ldr r4, _0808133C @ =0x0200310C
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	adds r0, r2, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _0808135E
	.align 2, 0
_0808133C: .4byte 0x0200310C
_08081340:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808136C
	ldr r4, _08081368 @ =0x0200310C
	ldrb r1, [r4, #1]
	ldrb r3, [r4]
	adds r0, r3, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_0808135E:
	adds r2, r5, #0
	bl StartStatScreenPageSlide
	b _08081400
	.align 2, 0
_08081368: .4byte 0x0200310C
_0808136C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808138C
	ldr r0, _08081388 @ =0x0200310C
	ldr r0, [r0, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl FindNextStatScreenUnit
	adds r2, r0, #0
	adds r1, r4, #0
	b _080813D2
	.align 2, 0
_08081388: .4byte 0x0200310C
_0808138C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080813A8
	ldr r0, _080813A4 @ =0x0200310C
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl FindNextStatScreenUnit
	adds r2, r0, #0
	movs r1, #1
	b _080813D2
	.align 2, 0
_080813A4: .4byte 0x0200310C
_080813A8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080813E0
	ldr r4, _080813DC @ =0x0200310C
	ldr r2, [r4, #0xc]
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _080813E0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080813D0
	movs r1, #1
_080813D0:
	adds r0, r2, #0
_080813D2:
	adds r2, r5, #0
	bl StartStatScreenUnitSlide
	b _08081400
	.align 2, 0
_080813DC: .4byte 0x0200310C
_080813E0:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081400
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08081408 @ =0x0200310C
	ldrb r0, [r0]
	adds r1, r5, #0
	bl StartStatScreenHelp
_08081400:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081408: .4byte 0x0200310C
