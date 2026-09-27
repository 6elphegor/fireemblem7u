	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMapChangeIdAt
GetMapChangeIdAt: @ 0x0802BD0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _0802BD2C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChanges
	adds r1, r0, #0
	cmp r1, #0
	beq _0802BD5E
	b _0802BD56
	.align 2, 0
_0802BD2C: .4byte 0x0202BBF8
_0802BD30:
	ldrb r0, [r1, #1]
	cmp r5, r0
	blt _0802BD54
	ldrb r2, [r1, #2]
	cmp r4, r2
	blt _0802BD54
	ldrb r3, [r1, #3]
	adds r0, r3, r0
	subs r0, #1
	cmp r0, r5
	blt _0802BD54
	ldrb r3, [r1, #4]
	adds r0, r3, r2
	subs r0, #1
	cmp r0, r4
	blt _0802BD54
	movs r6, #0
	ldrsb r6, [r1, r6]
_0802BD54:
	adds r1, #0xc
_0802BD56:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802BD30
_0802BD5E:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
