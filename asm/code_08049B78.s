	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUiWindowFrame
PutUiWindowFrame: @ 0x08049B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r2, [sp, #0x34]
	ldr r6, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	ldr r1, _08049CE0 @ =0x08B9A824
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r0, [sp]
	adds r3, r0, r3
	subs r3, #1
	mov r8, r3
	ldr r1, [sp, #4]
	adds r2, r1, r2
	subs r2, #1
	mov sl, r2
	adds r4, r1, #0
	adds r4, #1
	cmp r4, sl
	bge _08049BFA
_08049BB0:
	ldr r3, [sp]
	adds r3, #1
	adds r2, r4, #2
	str r2, [sp, #0x10]
	cmp r3, r8
	bge _08049BF4
	lsls r1, r3, #0x10
	lsls r0, r4, #0x15
	adds r4, r1, r0
	movs r7, #0x80
	lsls r7, r7, #0xa
	mov ip, r7
_08049BC8:
	lsrs r0, r4, #0x10
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r5, #0xa]
	adds r1, r2, r6
	strh r1, [r0]
	ldrh r7, [r5, #0xc]
	adds r1, r7, r6
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r7, [r5, #0x12]
	adds r1, r7, r6
	strh r1, [r2]
	adds r0, #0x42
	ldrh r2, [r5, #0x14]
	adds r1, r2, r6
	strh r1, [r0]
	add r4, ip
	adds r3, #2
	cmp r3, r8
	blt _08049BC8
_08049BF4:
	ldr r4, [sp, #0x10]
	cmp r4, sl
	blt _08049BB0
_08049BFA:
	ldr r3, [sp]
	adds r3, #1
	ldr r2, [sp, #4]
	adds r2, #1
	ldr r4, [sp, #4]
	lsls r4, r4, #5
	str r4, [sp, #8]
	mov r7, sl
	lsls r7, r7, #5
	str r7, [sp, #0xc]
	cmp r3, r8
	bge _08049C46
	lsls r0, r3, #1
	mov r4, sl
	lsls r1, r4, #6
	add r1, sb
	adds r4, r0, r1
	ldr r7, [sp, #4]
	lsls r1, r7, #6
	add r1, sb
	adds r1, r0, r1
_08049C24:
	ldrh r7, [r5, #2]
	adds r0, r7, r6
	strh r0, [r1]
	ldrh r7, [r5, #4]
	adds r0, r7, r6
	strh r0, [r1, #2]
	ldrh r7, [r5, #0x1a]
	adds r0, r7, r6
	strh r0, [r4]
	ldrh r7, [r5, #0x1c]
	adds r0, r7, r6
	strh r0, [r4, #2]
	adds r4, #4
	adds r1, #4
	adds r3, #2
	cmp r3, r8
	blt _08049C24
_08049C46:
	adds r4, r2, #0
	cmp r4, sl
	bge _08049C96
	lsls r3, r4, #6
	mov r0, r8
	lsls r2, r0, #1
	mov r0, sb
	adds r0, #0x40
	adds r1, r2, r0
	adds r1, r1, r3
	mov ip, r1
	ldr r7, [sp]
	lsls r1, r7, #1
	adds r0, r1, r0
	adds r7, r3, r0
	add r2, sb
	adds r2, r3, r2
	add r1, sb
	adds r3, r3, r1
_08049C6C:
	ldrh r1, [r5, #8]
	adds r0, r1, r6
	strh r0, [r3]
	ldrh r1, [r5, #0xe]
	adds r0, r1, r6
	strh r0, [r2]
	ldrh r1, [r5, #0x10]
	adds r0, r1, r6
	strh r0, [r7]
	ldrh r1, [r5, #0x16]
	adds r0, r1, r6
	mov r1, ip
	strh r0, [r1]
	movs r0, #0x80
	add ip, r0
	adds r7, #0x80
	adds r2, #0x80
	adds r3, #0x80
	adds r4, #2
	cmp r4, sl
	blt _08049C6C
_08049C96:
	ldr r1, [sp, #8]
	ldr r2, [sp]
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r4, [r5]
	adds r1, r4, r6
	strh r1, [r0]
	ldr r0, [sp, #8]
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	ldrh r7, [r5, #6]
	adds r1, r7, r6
	strh r1, [r0]
	ldr r1, [sp, #0xc]
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r5, #0x18]
	adds r1, r2, r6
	strh r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	ldrh r5, [r5, #0x1e]
	adds r1, r5, r6
	strh r1, [r0]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049CE0: .4byte 0x08B9A824
