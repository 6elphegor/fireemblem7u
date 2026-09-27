	.include "macro.inc"

	.syntax unified

	thumb_func_start NewColFadeOut
NewColFadeOut: @ 0x080AEC5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AEC88 @ =0x08CE5DE4
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080AEC98
	cmp r6, #1
	bgt _080AEC8C
	cmp r6, #0
	beq _080AEC92
	b _080AECA8
	.align 2, 0
_080AEC88: .4byte 0x08CE5DE4
_080AEC8C:
	cmp r6, #2
	beq _080AECA0
	b _080AECA8
_080AEC92:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080AECA6
_080AEC98:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080AECA6
_080AECA0:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080AECA6:
	str r0, [r1, #0x60]
_080AECA8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
