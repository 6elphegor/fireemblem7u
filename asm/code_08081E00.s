	.include "macro.inc"

	.syntax unified

	thumb_func_start GetHelpBoxItemInfoKind
GetHelpBoxItemInfoKind: @ 0x08081E00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081E10 @ =0x0000FFFF
	cmp r4, r0
	bne _08081E14
	movs r0, #3
	b _08081E4A
	.align 2, 0
_08081E10: .4byte 0x0000FFFF
_08081E14:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08081E44
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08081E36
	movs r0, #1
	b _08081E4A
_08081E36:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08081E48
_08081E44:
	movs r0, #0
	b _08081E4A
_08081E48:
	movs r0, #2
_08081E4A:
	pop {r4}
	pop {r1}
	bx r1
