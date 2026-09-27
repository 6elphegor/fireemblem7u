	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepScreenMenu
EndPrepScreenMenu: @ 0x080900B8
	push {r4, lr}
	ldr r0, _080900D8 @ =0x08CC416C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080900D2
	bl ResetPrepMenuScreen
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080900D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080900D8: .4byte 0x08CC416C
