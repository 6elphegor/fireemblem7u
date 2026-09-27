	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_EnablePid
EvtCmd_EnablePid: @ 0x0800E1A8
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r0, #0xc]
	ldr r2, _0800E1C0 @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E1C0: .4byte 0xFFBFFFFF
