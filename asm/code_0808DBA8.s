	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenMenu_OnItems
PrepScreenMenu_OnItems: @ 0x0808DBA8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0
