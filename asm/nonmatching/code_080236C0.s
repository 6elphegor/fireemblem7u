	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_Select1stCommand
ItemMenu_Select1stCommand: @ 0x080236C0
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080236E4
	ldr r0, _080236DC @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForRefresh
	ldr r0, _080236E0 @ =0x08B95B98
	bl StartMapSelect
	movs r0, #0x27
	b _080236E6
	.align 2, 0
_080236DC: .4byte 0x03004690
_080236E0: .4byte 0x08B95B98
_080236E4:
	movs r0, #8
_080236E6:
	pop {r1}
	bx r1
	.align 2, 0
