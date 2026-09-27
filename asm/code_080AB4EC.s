	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB4EC
sub_080AB4EC: @ 0x080AB4EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x39
	ldrb r1, [r4]
	adds r3, r1, #1
	adds r0, r3, #0
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r3, r0
	adds r3, r4, #0
	ldr r4, _080AB534 @ =0x08CE538C
_080AB504:
	asrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x50]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB520
	ldrb r0, [r3]
	cmp r0, r2
	bne _080AB538
_080AB520:
	adds r2, #1
	adds r0, r2, #0
	cmp r2, #0
	bge _080AB52A
	adds r0, #0x7f
_080AB52A:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r2, r2, r0
	b _080AB504
	.align 2, 0
_080AB534: .4byte 0x08CE538C
_080AB538:
	strb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
