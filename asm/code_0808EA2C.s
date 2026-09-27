	.include "macro.inc"

	.syntax unified

	thumb_func_start CleanupPrepMenuScreen
CleanupPrepMenuScreen: @ 0x0808EA2C
	push {lr}
	ldr r0, _0808EA50 @ =0x02022DEA
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808EA54 @ =0x020235EA
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0808EA50: .4byte 0x02022DEA
_0808EA54: .4byte 0x020235EA
