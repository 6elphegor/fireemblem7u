	.include "macro.inc"

	.syntax unified

	thumb_func_start Decompress
Decompress: @ 0x08013168
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #0x18
	adds r1, r4, r0
	ldr r0, _080131A0 @ =0x00017FFF
	movs r2, #1
	cmp r1, r0
	bhi _0801317E
	movs r2, #0
_0801317E:
	ldr r0, _080131A4 @ =0x08B928BC
	movs r1, #0xf0
	ldrb r5, [r3]
	ands r1, r5
	lsrs r1, r1, #3
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080131A0: .4byte 0x00017FFF
_080131A4: .4byte 0x08B928BC
