	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBoxDialogueSize
GetBoxDialogueSize: @ 0x080836D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	movs r5, #0
	movs r7, #0x10
	str r5, [r4]
	str r5, [r6]
_080836EA:
	ldrb r0, [r3]
	cmp r0, #7
	bgt _0808370C
	cmp r0, #4
	bge _0808372A
	cmp r0, #1
	beq _0808372E
	cmp r0, #1
	bgt _08083702
	cmp r0, #0
	beq _0808376E
	b _08083780
_08083702:
	cmp r0, #2
	beq _0808373C
	cmp r0, #3
	beq _08083752
	b _08083780
_0808370C:
	cmp r0, #0x19
	ble _08083716
	cmp r0, #0x80
	beq _08083724
	b _08083780
_08083716:
	cmp r0, #0x18
	bge _08083728
	cmp r0, #0x14
	bgt _08083780
	cmp r0, #0x12
	blt _08083780
	b _0808376E
_08083724:
	adds r3, #2
	b _080836EA
_08083728:
	movs r5, #0x40
_0808372A:
	adds r3, #1
	b _080836EA
_0808372E:
	adds r7, #0x10
	ldr r0, [r4]
	cmp r0, r5
	bge _08083738
	str r5, [r4]
_08083738:
	movs r5, #0
	b _0808372A
_0808373C:
	adds r3, #1
	ldr r0, [r6]
	cmp r0, r7
	bge _08083746
	str r7, [r6]
_08083746:
	movs r7, #0
	ldr r0, [r4]
	cmp r0, r5
	bge _0808376A
	str r5, [r4]
	b _0808376A
_08083752:
	adds r3, #1
	ldr r0, [r6]
	cmp r0, r7
	bge _0808375C
	str r7, [r6]
_0808375C:
	movs r7, #0
	adds r1, r5, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge _0808376A
	str r1, [r4]
_0808376A:
	movs r5, #0
	b _080836EA
_0808376E:
	ldr r0, [r4]
	cmp r0, r5
	bge _08083776
	str r5, [r4]
_08083776:
	ldr r0, [r6]
	cmp r0, r7
	bge _08083790
	str r7, [r6]
	b _08083790
_08083780:
	adds r0, r3, #0
	mov r1, sp
	bl GetCharTextLen
	adds r3, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080836EA
_08083790:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
