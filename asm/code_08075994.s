	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075994
sub_08075994: @ 0x08075994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _080759EE
	adds r3, r0, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _080759EC
	subs r3, #0x10
_080759EC:
	b _080759F4
_080759EE:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_080759F4:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08075A56
	adds r3, r1, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08075A54
	subs r3, #0x10
_08075A54:
	b _08075A5C
_08075A56:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_08075A5C:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
