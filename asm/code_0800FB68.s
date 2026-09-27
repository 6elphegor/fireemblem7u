	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetKeyIgnore
EvtCmd_SetKeyIgnore: @ 0x0800FB68
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl SetkeyStIgnoredMask
	movs r0, #0
	pop {r1}
	bx r1
