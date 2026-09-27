	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC7B0
sub_080AC7B0: @ 0x080AC7B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x4c
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #1
	subs r4, r4, r0
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl WriteFadedPaletteFromArchive
	cmp r4, #0
	bne _080AC7E0
	adds r0, r5, #0
	bl Proc_Break
_080AC7E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
