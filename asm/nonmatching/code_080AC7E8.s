	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC7E8
sub_080AC7E8: @ 0x080AC7E8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080AC828 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r2, [r4, #0x58]
	str r2, [sp]
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	bl ArchiveCurrentPalettes
	movs r3, #0xff
	lsls r3, r3, #8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl WriteFadedPaletteFromArchive
	movs r0, #8
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC828: .4byte 0x02024460
