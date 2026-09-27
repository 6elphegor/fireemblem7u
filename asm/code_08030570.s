	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030570
sub_08030570: @ 0x08030570
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _080305A0 @ =0xFF00FFF0
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0xc0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080305A0: .4byte 0xFF00FFF0
