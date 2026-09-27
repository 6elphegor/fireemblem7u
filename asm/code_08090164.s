	.include "macro.inc"

	.syntax unified

	thumb_func_start ShowPrepScreenMenuFrozenHand
ShowPrepScreenMenuFrozenHand: @ 0x08090164
	push {lr}
	ldr r0, _0809017C @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _08090176
	movs r1, #2
	bl Proc_Goto
_08090176:
	pop {r0}
	bx r0
	.align 2, 0
_0809017C: .4byte 0x08CC416C
