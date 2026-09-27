	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC8F8
sub_080BC8F8: @ 0x080BC8F8
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r2, r0
	bne _080BC90E
	adds r0, r1, #0
	bl Proc_Break
	b _080BC942
_080BC90E:
	adds r0, r2, #1
	str r0, [r1, #0x2c]
	cmp r0, #0x8c
	ble _080BC942
	subs r0, #0x8c
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bgt _080BC942
	ldr r5, _080BC948 @ =0x02007018
	subs r0, r6, r0
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r0
	lsls r0, r4, #5
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0x10]
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0xc]
_080BC942:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC948: .4byte 0x02007018
