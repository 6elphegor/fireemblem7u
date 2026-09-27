	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB604
sub_080AB604: @ 0x080AB604
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldrh r1, [r2, #0x2a]
	subs r0, r0, r1
	cmp r0, #0
	bge _080AB61A
	adds r0, #0xf
_080AB61A:
	asrs r4, r0, #4
	cmp r1, #0
	beq _080AB62A
	cmp r4, #0
	bgt _080AB62A
	movs r0, #1
	rsbs r0, r0, #0
	b _080AB64E
_080AB62A:
	ldrh r1, [r2, #0x2a]
	lsrs r0, r1, #4
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	subs r0, r1, #1
	cmp r0, #0
	bge _080AB63E
	adds r0, r1, #2
_080AB63E:
	asrs r0, r0, #2
	cmp r3, r0
	bgt _080AB64C
	cmp r4, #3
	ble _080AB64C
	movs r0, #1
	b _080AB64E
_080AB64C:
	movs r0, #0
_080AB64E:
	pop {r4}
	pop {r1}
	bx r1
