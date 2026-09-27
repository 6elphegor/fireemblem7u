	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC82C
sub_080AC82C: @ 0x080AC82C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r4, [r1]
	adds r0, r4, #1
	strh r0, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0xc
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl WriteFadedPaletteFromArchive
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bne _080AC85A
	adds r0, r5, #0
	bl Proc_Break
_080AC85A:
	pop {r4, r5}
	pop {r0}
	bx r0
