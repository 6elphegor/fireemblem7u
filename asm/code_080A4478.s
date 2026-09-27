	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4478
sub_080A4478: @ 0x080A4478
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
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
	movs r1, #0xdc
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	ldrb r4, [r4]
	cmp r4, #0xe
	bne _080A44B8
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A44B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
