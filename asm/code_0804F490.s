	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxHpBarColorChange_804FC6C
EfxHpBarColorChange_804FC6C: @ 0x0804F490
	ldr r0, _0804F49C @ =0x0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804F49C: .4byte 0x0201777C
