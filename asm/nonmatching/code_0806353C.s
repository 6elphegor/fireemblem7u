	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806353C
sub_0806353C: @ 0x0806353C
	push {lr}
	ldr r0, _08063558 @ =0x08BA450C
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl NewEfxSRankWeaponEffectSCR2
	pop {r0}
	bx r0
	.align 2, 0
_08063558: .4byte 0x08BA450C
