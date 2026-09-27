	.include "macro.inc"

	.syntax unified

	thumb_func_start MapMenu_UnitCommand
MapMenu_UnitCommand: @ 0x08021594
	push {lr}
	ldr r0, _080215AC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl StartUnitListScreenField
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215AC: .4byte 0x08B93374
