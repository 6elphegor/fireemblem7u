	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MenuOverrideEnable
EvtCmd_MenuOverrideEnable: @ 0x0800FBD8
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBEC @ =MenuAlwaysEnabled
	movs r1, #1
	bl SetMenuOverride
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FBEC: .4byte MenuAlwaysEnabled
