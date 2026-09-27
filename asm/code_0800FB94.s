	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MenuOverrideHide
EvtCmd_MenuOverrideHide: @ 0x0800FB94
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBA8 @ =MenuAlwaysNotShown
	movs r1, #1
	bl SetMenuOverride
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FBA8: .4byte MenuAlwaysNotShown
