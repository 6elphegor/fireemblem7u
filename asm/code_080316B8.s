	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080316B8
sub_080316B8: @ 0x080316B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	cmp r0, #0x27
	bgt _080316DE
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #4
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x18
	b _080316EC
_080316DE:
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x10
_080316EC:
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #0x10
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
