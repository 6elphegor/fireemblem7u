	.include "macro.inc"

	.syntax unified

	thumb_func_start IsBattleDeamonActive
IsBattleDeamonActive: @ 0x0804B1EC
	ldr r0, _0804B1F8 @ =0x0203E000
	ldr r0, [r0]
	cmp r0, #1
	beq _0804B1FC
	movs r0, #0
	b _0804B1FE
	.align 2, 0
_0804B1F8: .4byte 0x0203E000
_0804B1FC:
	movs r0, #1
_0804B1FE:
	bx lr
