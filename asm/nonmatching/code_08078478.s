	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078478
sub_08078478: @ 0x08078478
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r2, #8]
	ldrb r5, [r2, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r6, r0, #8
	ldr r1, [r2, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080784B6
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _080784A2
	cmp r5, #0
	bne _080784B6
_080784A2:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _080784B6
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _080784B8
_080784B6:
	movs r0, #0
_080784B8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
