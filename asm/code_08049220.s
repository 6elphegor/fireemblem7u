	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049220
sub_08049220: @ 0x08049220
	push {r4, lr}
	ldr r0, _0804924C @ =0x084120A0
	ldr r4, _08049250 @ =0x0200118C
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08049254 @ =0x06016800
	adds r0, r4, #0
	movs r2, #6
	movs r3, #4
	bl sub_08047CB8
	ldr r0, _08049258 @ =0x084138F0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804924C: .4byte 0x084120A0
_08049250: .4byte 0x0200118C
_08049254: .4byte 0x06016800
_08049258: .4byte 0x084138F0
