	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_InitGfxMaybe
ModeSelect_InitGfxMaybe: @ 0x080A7C6C
	push {lr}
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080A7C7E
	bl sub_080A4E58
_080A7C7E:
	pop {r0}
	bx r0
	.align 2, 0
