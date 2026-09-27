	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPalBlackInOut
EfxPalBlackInOut: @ 0x08066EE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _08066F58
	mov r8, r0
	movs r0, #0x1f
	mov ip, r0
_08066F0C:
	lsls r0, r4, #5
	adds r7, r4, #1
	mov r1, sb
	adds r5, r1, r0
	movs r4, #0xf
_08066F16:
	ldrh r1, [r5]
	movs r2, #0x1f
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, ip
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	adds r0, r2, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r3, r3, r0
	adds r0, r1, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08066F16
	adds r4, r7, #0
	cmp r4, r8
	blt _08066F0C
_08066F58:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
