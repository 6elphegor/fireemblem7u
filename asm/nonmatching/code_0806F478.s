	.include "macro.inc"

	.syntax unified

	thumb_func_start GetFacingFromTo
GetFacingFromTo: @ 0x0806F478
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806F49E
	ldr r0, [r7, #8]
	ldr r2, [r7]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
	b _0806F4AA
_0806F49E:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	subs r1, r0, r2
	adds r0, r1, #0
	lsls r2, r0, #1
	adds r1, r2, #0
_0806F4AA:
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r0, #0
	blt _0806F4C0
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #4]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806F4CC
	b _0806F4E0
_0806F4C0:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	subs r0, r0, r2
	cmp r1, r0
	blt _0806F4CC
	b _0806F4E0
_0806F4CC:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0xc]
	cmp r0, r2
	bge _0806F4DA
	movs r0, #2
	b _0806F4F2
_0806F4D8:
	.byte 0x01, 0xE0
_0806F4DA:
	movs r0, #3
	b _0806F4F2
_0806F4DE:
	.byte 0x08, 0xE0
_0806F4E0:
	ldr r0, [r7]
	ldr r2, [r7, #8]
	cmp r0, r2
	bge _0806F4EE
	movs r0, #1
	b _0806F4F2
_0806F4EC:
	.byte 0x01, 0xE0
_0806F4EE:
	movs r0, #0
	b _0806F4F2
_0806F4F2:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
