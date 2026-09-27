	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_Is1stCommandAvailable
ItemMenu_Is1stCommandAvailable: @ 0x08023658
	push {lr}
	ldr r0, _08023670 @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForRefresh
	bl CountTargets
	cmp r0, #0
	beq _08023674
	movs r0, #1
	b _08023676
	.align 2, 0
_08023670: .4byte 0x03004690
_08023674:
	movs r0, #3
_08023676:
	pop {r1}
	bx r1
	.align 2, 0
