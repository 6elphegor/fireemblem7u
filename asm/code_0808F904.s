	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenSprite_OnDraw
PrepScreenSprite_OnDraw: @ 0x0808F904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F988
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808F930
	adds r2, r0, #0
	movs r3, #0xc7
	lsls r3, r3, #7
	movs r0, #0x70
	movs r1, #4
	bl sub_0808F808
_0808F930:
	movs r0, #0x32
	adds r0, r0, r7
	mov r8, r0
	ldr r6, _0808F97C @ =0x0000B680
	movs r5, #0x80
	movs r4, #2
_0808F93C:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _0808F980 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808F93C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808F968
	ldrh r7, [r7, #0x34]
	lsrs r0, r7, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F99A
_0808F968:
	ldr r3, _0808F984 @ =0x08CC482C
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
	b _0808F99A
	.align 2, 0
_0808F97C: .4byte 0x0000B680
_0808F980: .4byte 0x08B905F8
_0808F984: .4byte 0x08CC482C
_0808F988:
	ldr r3, _0808F9A8 @ =0x08CC4840
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
_0808F99A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F9A8: .4byte 0x08CC4840
