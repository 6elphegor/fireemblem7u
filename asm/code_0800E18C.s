	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_DisablePid
EvtCmd_DisablePid: @ 0x0800E18C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	ldr r2, _0800E1A4 @ =0x04010000
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E1A4: .4byte 0x04010000
