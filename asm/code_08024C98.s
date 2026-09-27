	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyUnitSpritePalettes
ApplyUnitSpritePalettes: @ 0x08024C98
	push {lr}
	ldr r0, _08024CC0 @ =0x08194594
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r1, _08024CC4 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08024CCC
	ldr r0, _08024CC8 @ =0x08194614
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08024CD8
	.align 2, 0
_08024CC0: .4byte 0x08194594
_08024CC4: .4byte 0x0202BBB8
_08024CC8: .4byte 0x08194614
_08024CCC:
	ldr r0, _08024CDC @ =0x08194634
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
_08024CD8:
	pop {r0}
	bx r0
	.align 2, 0
_08024CDC: .4byte 0x08194634
