	.include "macro.inc"

	.syntax unified

	thumb_func_start Minimap_AdjustCursorOnClose
Minimap_AdjustCursorOnClose: @ 0x080A3168
	push {lr}
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A3196
	ldr r1, _080A31A0 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080A3180
	adds r0, #0xf
_080A3180:
	asrs r0, r0, #4
	adds r0, #7
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bge _080A318E
	adds r1, #0xf
_080A318E:
	asrs r1, r1, #4
	adds r1, #5
	bl SetMapCursorPosition
_080A3196:
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080A31A0: .4byte 0x0202BBB8
