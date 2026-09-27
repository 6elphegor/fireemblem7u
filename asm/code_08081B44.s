	.include "macro.inc"

	.syntax unified

	thumb_func_start CloseHelpBox
CloseHelpBox: @ 0x08081B44
	push {r4, lr}
	ldr r0, _08081B64 @ =0x08CC2014
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08081B5E
	bl ClearHelpBoxText
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_08081B5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B64: .4byte 0x08CC2014
