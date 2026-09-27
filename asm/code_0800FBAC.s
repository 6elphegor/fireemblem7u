	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MenuOverrideDisable
EvtCmd_MenuOverrideDisable: @ 0x0800FBAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBD0 @ =sub_0804A8FC
	movs r1, #1
	bl SetMenuOverride
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBD4 @ =sub_0801B244
	movs r1, #2
	bl SetMenuOverride
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800FBD0: .4byte sub_0804A8FC
_0800FBD4: .4byte sub_0801B244
