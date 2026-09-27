	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080782BC
sub_080782BC: @ 0x080782BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _080782F0 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080782F4
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080782F4
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _080782F6
	.align 2, 0
_080782F0: .4byte 0xFFFF0000
_080782F4:
	movs r0, #0
_080782F6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
