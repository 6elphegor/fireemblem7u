	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSemiCenteredOrphanMenu
StartSemiCenteredOrphanMenu: @ 0x0804AB00
	push {r4, r5, r6, r7, lr}
	bl StartAdjustedMenu
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #6
	bls _0804AB4A
	adds r2, r4, #0
	adds r2, #0x2d
	ldr r5, _0804AB54 @ =0x08B9A920
	ldrb r3, [r1]
	adds r0, r3, r5
	ldrb r7, [r2]
	ldrb r0, [r0]
	subs r0, r7, r0
	strb r0, [r2]
	movs r3, #0
	ldrb r0, [r1]
	cmp r3, r0
	bge _0804AB4A
	adds r6, r5, #0
	adds r2, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
_0804AB34:
	ldm r5!, {r0}
	ldrb r7, [r2]
	adds r1, r7, r6
	ldrh r7, [r0, #0x2c]
	ldrb r1, [r1]
	subs r1, r7, r1
	strh r1, [r0, #0x2c]
	adds r3, #1
	ldrb r0, [r2]
	cmp r3, r0
	blt _0804AB34
_0804AB4A:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804AB54: .4byte 0x08B9A920
