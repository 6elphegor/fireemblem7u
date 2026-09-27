	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1CCC
sub_080B1CCC: @ 0x080B1CCC
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl IsItemDisplayUsable
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl DrawItemMenuLine
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_080B1DB8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1D1E
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl GetItemSellPrice
	lsls r1, r0, #0x10
	lsrs r2, r1, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	b _080B1D32
_080B1D1E:
	ldr r1, _080B1D3C @ =0x0000127E
	adds r0, r1, #0
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, [r7]
	movs r1, #0x5c
	movs r2, #2
	bl Text_InsertDrawString
_080B1D32:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D3C: .4byte 0x0000127E
