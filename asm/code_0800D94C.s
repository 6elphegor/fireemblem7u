	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SkipNIfnFunc
EvtCmd_SkipNIfnFunc: @ 0x0800D94C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D968
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D968:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
