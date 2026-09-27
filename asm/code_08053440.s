	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBattleScriptted
CheckBattleScriptted: @ 0x08053440
	ldr r0, _0805344C @ =0x0203E0EC
	ldr r0, [r0]
	cmp r0, #0
	beq _08053450
	movs r0, #1
	b _08053452
	.align 2, 0
_0805344C: .4byte 0x0203E0EC
_08053450:
	movs r0, #0
_08053452:
	bx lr
