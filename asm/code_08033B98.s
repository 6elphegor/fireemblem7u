	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08033B98
sub_08033B98: @ 0x08033B98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08033C0C @ =0x081958BC
	ldr r1, _08033C10 @ =0x06004000
	bl Decompress
	ldr r0, _08033C14 @ =0x08195F04
	ldr r4, _08033C18 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08033C1C @ =0x06015D00
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl Copy2dChr
	ldr r0, _08033C20 @ =0x08195FB0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl ResetTextFont
	bl InitIcons
	bl InitBattleForecastIconPaletteBuffer
	bl InitBattleForecastLabels
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #7
	bl InitTextDb
	ldr r2, _08033C24 @ =0x0000FFFF
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033C0C: .4byte 0x081958BC
_08033C10: .4byte 0x06004000
_08033C14: .4byte 0x08195F04
_08033C18: .4byte 0x02020140
_08033C1C: .4byte 0x06015D00
_08033C20: .4byte 0x08195FB0
_08033C24: .4byte 0x0000FFFF
