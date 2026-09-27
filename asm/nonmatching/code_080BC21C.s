	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC21C
sub_080BC21C: @ 0x080BC21C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x70
	bl __modsi3
	movs r1, #8
	bl __divsi3
	cmp r4, #0x70
	bge _080BC246
	lsls r3, r0, #6
	str r4, [sp]
	movs r0, #2
	movs r1, #2
	movs r2, #8
	bl sub_080BCB34
	b _080BC25E
_080BC246:
	lsls r3, r0, #6
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r0, r4, #0
	subs r0, #0x70
	str r0, [sp]
	movs r0, #2
	movs r1, #2
	movs r2, #8
	bl sub_080BCB34
_080BC25E:
	movs r0, #0x70
	lsls r0, r0, #1
	ldr r1, [r5, #0x2c]
	cmp r1, r0
	bne _080BC274
	movs r0, #0
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	b _080BC278
_080BC274:
	adds r0, r1, #1
	str r0, [r5, #0x2c]
_080BC278:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
