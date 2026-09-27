	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F6EC
sub_0805F6EC: @ 0x0805F6EC
	push {lr}
	ldr r0, _0805F708 @ =0x08BA37B4
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl StartSubSpell_efxLunaSCR2
	pop {r0}
	bx r0
	.align 2, 0
_0805F708: .4byte 0x08BA37B4
