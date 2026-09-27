	.include "macro.inc"

	.syntax unified

	thumb_func_start NullExpForChar100AndResetScreen
NullExpForChar100AndResetScreen: @ 0x0808F6B4
	push {lr}
	sub sp, #4
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _0808F6C8
	movs r0, #0xff
	strb r0, [r1, #9]
_0808F6C8:
	ldr r2, _0808F718 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r3, #0
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	subs r0, #0x12
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808F718: .4byte 0x03002870
