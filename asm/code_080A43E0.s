	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A43E0
sub_080A43E0: @ 0x080A43E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	movs r0, #0xe
	ldrb r1, [r4]
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0x24
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A4422
	adds r0, r5, #0
	bl Proc_Break
_080A4422:
	pop {r4, r5}
	pop {r0}
	bx r0
