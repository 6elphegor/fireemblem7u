	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyUnitMapUiFramePal
ApplyUnitMapUiFramePal: @ 0x08084E28
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _08084E54
	cmp r0, #0x40
	bgt _08084E3C
	cmp r0, #0
	beq _08084E42
	b _08084E5C
_08084E3C:
	cmp r0, #0x80
	beq _08084E4C
	b _08084E5C
_08084E42:
	ldr r4, _08084E48 @ =0x0840453C
	b _08084E60
	.align 2, 0
_08084E48: .4byte 0x0840453C
_08084E4C:
	ldr r4, _08084E50 @ =0x0840455C
	b _08084E60
	.align 2, 0
_08084E50: .4byte 0x0840455C
_08084E54:
	ldr r4, _08084E58 @ =0x0840457C
	b _08084E60
	.align 2, 0
_08084E58: .4byte 0x0840457C
_08084E5C:
	bl nullsub_7
_08084E60:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
