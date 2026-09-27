	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MenuOverrideDisable
EvtCmd_MenuOverrideDisable: @ 0x0800FBAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBD0 @ =MenuAlwaysDisabled
	movs r1, #1
	bl SetMenuOverride
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBD4 @ =Get8
	movs r1, #2
	bl SetMenuOverride
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800FBD0: .4byte MenuAlwaysDisabled
_0800FBD4: .4byte Get8
