	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_OverrideBgm
EvtCmd_OverrideBgm: @ 0x0800E420
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E446
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl OverrideBgm
	adds r0, r4, #0
	movs r1, #0x21
	bl StartTemporaryLock
	movs r0, #2
	b _0800E448
_0800E446:
	movs r0, #0
_0800E448:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
