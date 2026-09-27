	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F808
sub_0808F808: @ 0x0808F808
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0808F854
	subs r6, #4
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _0808F84C @ =0x08CC3FE6
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r0, _0808F850 @ =0x08CC4060
	ldr r3, [r0, #0x28]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _0808F874
	.align 2, 0
_0808F84C: .4byte 0x08CC3FE6
_0808F850: .4byte 0x08CC4060
_0808F854:
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _0808F8A0 @ =0x08CC3FCC
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r3, _0808F8A4 @ =0x08CC3FC4
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
_0808F874:
	ldr r3, _0808F8A8 @ =0x08CC3FB6
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	asrs r4, r4, #1
	mov sb, r4
	cmp r4, #9
	bgt _0808F8B0
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _0808F8AC @ =0x08CC4060
	ldr r3, [r0, #0x2c]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _0808F8D0
	.align 2, 0
_0808F8A0: .4byte 0x08CC3FCC
_0808F8A4: .4byte 0x08CC3FC4
_0808F8A8: .4byte 0x08CC3FB6
_0808F8AC: .4byte 0x08CC4060
_0808F8B0:
	adds r5, r6, #0
	adds r5, #0x28
	ldr r4, _0808F900 @ =0x08CC4060
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
_0808F8D0:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _0808F900 @ =0x08CC4060
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F900: .4byte 0x08CC4060
