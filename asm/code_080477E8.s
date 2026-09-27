	.include "macro.inc"

	.syntax unified

	thumb_func_start SioWarp_Init
SioWarp_Init: @ 0x080477E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047828 @ =0x083F4C08
	ldr r1, _0804782C @ =0x06004400
	bl Decompress
	ldr r0, _08047830 @ =0x083F4E68
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08047820
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl StartPlayMuStepSe
_08047820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047828: .4byte 0x083F4C08
_0804782C: .4byte 0x06004400
_08047830: .4byte 0x083F4E68
