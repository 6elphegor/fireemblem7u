	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfxDeployed
EvtCmd_GotoIfxDeployed: @ 0x0800D8E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D900
	ldrb r0, [r1, #8]
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D90C
_0800D8FC:
	movs r0, #0
	b _0800D916
_0800D900:
	ldrb r0, [r1, #8]
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D8FC
_0800D90C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D916:
	pop {r4}
	pop {r1}
	bx r1
