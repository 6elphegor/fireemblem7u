	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawAtMenuUpfx
DrawAtMenuUpfx: @ 0x0808E680
	push {r4, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0808E6C0 @ =0x0840DDA4
	ldr r1, _0808E6C4 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _0808E6C8 @ =0x0840E058
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	str r0, [sp]
	adds r4, #1
	lsls r4, r4, #5
	ldr r0, _0808E6CC @ =0x02022A60
	adds r4, r4, r0
	ldr r2, _0808E6D0 @ =0x01000008
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E6C0: .4byte 0x0840DDA4
_0808E6C4: .4byte 0x06010000
_0808E6C8: .4byte 0x0840E058
_0808E6CC: .4byte 0x02022A60
_0808E6D0: .4byte 0x01000008
