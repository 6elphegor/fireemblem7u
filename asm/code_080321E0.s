	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080321E0
sub_080321E0: @ 0x080321E0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	bl StartUnitRescueInfoWindowsCore
	ldr r0, _08032214 @ =0x08B905B8
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartSpriteRefresher
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032214: .4byte 0x08B905B8
