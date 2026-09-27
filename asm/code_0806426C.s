	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806426C
sub_0806426C: @ 0x0806426C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064288 @ =0x08BA47F8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064288: .4byte 0x08BA47F8
