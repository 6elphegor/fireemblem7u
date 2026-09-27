	.include "macro.inc"

	.syntax unified

	thumb_func_start PutManimWindowBarTile
PutManimWindowBarTile: @ 0x0806F650
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	ble _0806F66E
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	b _0806F674
_0806F66E:
	ldr r0, [r7, #4]
	ldr r1, [r0]
	str r1, [r7, #0x10]
_0806F674:
	ldr r0, [r7]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #8]
	adds r2, r3, #0
	lsls r3, r2, #0xc
	adds r2, r3, #0
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	ldr r2, [r7, #0xc]
	subs r1, r1, r2
	str r1, [r0]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	cmp r1, #0
	bge _0806F6AA
	ldr r0, [r7, #4]
	movs r1, #0
	str r1, [r0]
_0806F6AA:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
