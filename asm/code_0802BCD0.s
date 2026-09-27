	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMapChange
GetMapChange: @ 0x0802BCD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802BCE8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChanges
	adds r1, r0, #0
	cmp r1, #0
	bne _0802BCFA
	b _0802BD02
	.align 2, 0
_0802BCE8: .4byte 0x0202BBF8
_0802BCEC:
	adds r0, r1, #0
	b _0802BD04
_0802BCF0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	beq _0802BCEC
	adds r1, #0xc
_0802BCFA:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802BCF0
_0802BD02:
	movs r0, #0
_0802BD04:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
