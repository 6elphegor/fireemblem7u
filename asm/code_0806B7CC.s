	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecEkrHenseiEnd
ExecEkrHenseiEnd: @ 0x0806B7CC
	push {lr}
	bl AnimClearAll
	bl NewEkrHenseiEnd
	ldr r0, _0806B7E0 @ =MainUpdate_8055C68
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_0806B7E0: .4byte MainUpdate_8055C68
