	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3B70
sub_080B3B70: @ 0x080B3B70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080B3BE4 @ =0x08CE7630
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B3BD2
	movs r0, #0x2b
	adds r0, r0, r5
	mov sl, r0
	adds r0, r5, #0
	adds r0, #0x2c
	str r0, [sp]
	movs r0, #0x2a
	adds r0, r0, r5
	mov sb, r0
	movs r0, #0x29
	adds r0, r0, r5
	mov r8, r0
	movs r7, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r6, #3
_080B3BA8:
	ldr r0, [r4]
	cmp r0, #0
	beq _080B3BB4
	bl EndSpriteAnimProc
	str r7, [r4]
_080B3BB4:
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _080B3BA8
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2e]
	mov r0, sl
	strb r1, [r0]
	ldr r0, [sp]
	strb r1, [r0]
	mov r0, sb
	strb r1, [r0]
	mov r0, r8
	strb r1, [r0]
_080B3BD2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BE4: .4byte 0x08CE7630
