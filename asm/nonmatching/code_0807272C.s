	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807272C
sub_0807272C: @ 0x0807272C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08072778 @ =0x083F4C08
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _0807277C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _08072780 @ =0x083F4E68
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_080752C8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072778: .4byte 0x083F4C08
_0807277C: .4byte 0x06002800
_08072780: .4byte 0x083F4E68
