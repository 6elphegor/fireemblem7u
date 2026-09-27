	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_SwitchIn
ItemMenu_SwitchIn: @ 0x080237A0
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080237B4
	movs r0, #5
	bl UpdateMenuItemPanel
	b _080237BE
_080237B4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl UpdateMenuItemPanel
_080237BE:
	pop {r1}
	bx r1
	.align 2, 0
