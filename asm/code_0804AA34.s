	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuFrozenHelpBox
MenuFrozenHelpBox: @ 0x0804AA34
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0804AA64 @ =0x08B9A900
	bl Proc_GotoScript
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804AA64: .4byte 0x08B9A900
