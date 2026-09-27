	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemSellable
IsItemSellable: @ 0x080B1DB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetItemAttributes
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B1DD2
	movs r0, #0
	b _080B1DE8
_080B1DD2:
	ldr r0, [r7]
	bl GetItemSellPrice
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080B1DE4
	movs r0, #0
	b _080B1DE8
_080B1DE4:
	movs r0, #1
	b _080B1DE8
_080B1DE8:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
