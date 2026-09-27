	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080643FC
sub_080643FC: @ 0x080643FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08064418 @ =0x08BA4880
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetActiveClassReelSpell
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064418: .4byte 0x08BA4880
