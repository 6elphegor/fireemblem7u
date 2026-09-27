	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A793C
sub_080A793C: @ 0x080A793C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0xff
	ands r2, r0
	cmp r2, #0x80
	ble _080A7950
	adds r1, r2, #0
	subs r1, #0x80
	b _080A7954
_080A7950:
	movs r1, #0x80
	subs r1, r1, r2
_080A7954:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #7
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r3, #0
	bl sub_080A7890
	pop {r0}
	bx r0
	.align 2, 0
