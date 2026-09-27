	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1D40
sub_080B1D40: @ 0x080B1D40
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl GetItemCost
	str r0, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x72
	bl UnitHasItem
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1D7A
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B1D86
_080B1D78:
	.byte 0x05, 0xE0
_080B1D7A:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _080B1D86
_080B1D86:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
