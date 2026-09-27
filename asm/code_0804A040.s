	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearUi
ClearUi: @ 0x0804A040
	push {lr}
	ldr r0, _0804A05C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0804A060 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0804A05C: .4byte 0x02022C60
_0804A060: .4byte 0x02023460
