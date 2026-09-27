	.include "macro.inc"

	.syntax unified

	thumb_func_start GetConvoyItemSlot
GetConvoyItemSlot: @ 0x0802E7E0
	push {r4, r5, lr}
	adds r2, r0, #0
	bl GetItemIndex
	adds r2, r0, #0
	movs r1, #0
	movs r4, #0xff
	ldr r3, _0802E800 @ =0x0203A720
_0802E7F0:
	adds r0, r4, #0
	ldrh r5, [r3]
	ands r0, r5
	cmp r2, r0
	bne _0802E804
	adds r0, r1, #0
	b _0802E810
	.align 2, 0
_0802E800: .4byte 0x0203A720
_0802E804:
	adds r3, #2
	adds r1, #1
	cmp r1, #0x63
	ble _0802E7F0
	movs r0, #1
	rsbs r0, r0, #0
_0802E810:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
