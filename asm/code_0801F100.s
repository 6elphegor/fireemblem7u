	.include "macro.inc"

	.syntax unified

	thumb_func_start NewPopup2_PlanA
NewPopup2_PlanA: @ 0x0801F100
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r6, #0
	bl GetStringTextLen
	adds r2, r0, #0
	cmp r5, #0
	blt _0801F118
	adds r2, #0x10
_0801F118:
	adds r2, #0x18
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F124
	adds r0, #0xf
_0801F124:
	asrs r4, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F12E
	adds r0, #7
_0801F12E:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r3, #4
	bl DrawUiFrame2
	cmp r5, #0
	blt _0801F15E
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	lsls r0, r4, #1
	ldr r1, _0801F188 @ =0x02022EA2
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r5, #0
	bl PutIcon
	adds r4, #2
_0801F15E:
	bl ResetTextFont
	lsls r1, r4, #1
	ldr r0, _0801F188 @ =0x02022EA2
	adds r1, r1, r0
	movs r0, #0x14
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0801F18C @ =0x08B938EC
	adds r1, r7, #0
	bl Proc_StartBlocking
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F188: .4byte 0x02022EA2
_0801F18C: .4byte 0x08B938EC
