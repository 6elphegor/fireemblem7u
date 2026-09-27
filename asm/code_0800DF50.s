	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_RemovePid
EvtCmd_RemovePid: @ 0x0800DF50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DF76
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0800DF7C
_0800DF76:
	adds r0, r5, #0
	bl ClearUnit
_0800DF7C:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
