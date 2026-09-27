	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808EF94
sub_0808EF94: @ 0x0808EF94
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r2, [r7, #0x5c]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x70
	movs r1, #4
	bl sub_0808F808
	movs r6, #0x8d
	lsls r6, r6, #7
	movs r5, #0x80
	movs r4, #2
_0808EFB0:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _0808EFF4 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808EFB0
	adds r2, r7, #0
	adds r2, #0x64
	ldrh r0, [r2]
	cmp r0, #1
	bne _0808EFEC
	ldr r0, _0808EFF8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808EFEC
	movs r0, #0
	strh r0, [r2]
	adds r0, r7, #0
	movs r1, #0x64
	bl Proc_Goto
_0808EFEC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EFF4: .4byte 0x08B905F8
_0808EFF8: .4byte 0x08B857F8
