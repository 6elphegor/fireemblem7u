	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080891D4
sub_080891D4: @ 0x080891D4
	push {lr}
	bl sub_08089794
	ldr r2, _080891FC @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080891FC: .4byte 0x03002870
