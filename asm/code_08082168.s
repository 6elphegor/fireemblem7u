	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082168
sub_08082168: @ 0x08082168
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r2, #0
	str r3, [sp, #8]
	adds r0, r4, #0
	bl sub_080820CC
	movs r1, #0xff
	ands r1, r0
	str r1, [sp, #0xc]
	asrs r0, r0, #8
	lsls r0, r0, #4
	str r0, [sp, #0x10]
	lsls r4, r4, #3
	ldr r0, _08082198 @ =0x08CC2784
	adds r6, r4, r0
	ldrb r2, [r6, #6]
	b _0808220E
	.align 2, 0
_08082198: .4byte 0x08CC2784
_0808219C:
	movs r5, #0
	adds r1, r2, #1
	str r1, [sp, #0x14]
	ldrb r0, [r6, #5]
	cmp r5, r0
	bge _0808220C
	ldr r1, [sp, #0x10]
	adds r0, r1, r2
	asrs r1, r0, #3
	lsls r1, r1, #0xa
	mov sl, r1
	movs r7, #7
	ands r0, r7
	lsls r0, r0, #2
	mov sb, r0
	asrs r0, r2, #3
	lsls r0, r0, #0xa
	mov r8, r0
	ands r2, r7
	lsls r2, r2, #2
	mov ip, r2
_080821C6:
	ldr r2, [sp, #0xc]
	adds r0, r2, r5
	ldr r1, [sp, #8]
	adds r4, r1, r5
	asrs r1, r0, #3
	lsls r1, r1, #5
	ldr r2, [sp]
	adds r1, r2, r1
	add r1, sl
	add r1, sb
	ands r0, r7
	lsls r3, r0, #2
	movs r0, #0xf
	lsls r0, r3
	ldr r2, [r1]
	ands r2, r0
	cmp r2, #0
	beq _08082204
	asrs r0, r4, #3
	lsls r0, r0, #5
	ldr r1, [sp, #4]
	adds r0, r1, r0
	add r0, r8
	add r0, ip
	lsrs r2, r3
	ands r4, r7
	lsls r1, r4, #2
	lsls r2, r1
	ldr r1, [r0]
	orrs r1, r2
	str r1, [r0]
_08082204:
	adds r5, #1
	ldrb r2, [r6, #5]
	cmp r5, r2
	blt _080821C6
_0808220C:
	ldr r2, [sp, #0x14]
_0808220E:
	ldrb r0, [r6, #7]
	cmp r2, r0
	blt _0808219C
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
