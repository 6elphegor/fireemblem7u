	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC084
sub_080AC084: @ 0x080AC084
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x3a
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AC0A4
	adds r0, #0x3f
_080AC0A4:
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_080ABD90
	ldrb r0, [r4]
	cmp r0, #0
	bne _080AC0CA
	adds r0, r5, #0
	bl sub_080AB5DC
	adds r0, r5, #0
	bl sub_080AB5AC
	adds r0, r5, #0
	bl Proc_Break
_080AC0CA:
	pop {r4, r5}
	pop {r0}
	bx r0
