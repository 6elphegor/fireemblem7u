	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnitsPartyIfScenario
EvtCmd_LoadUnitsPartyIfScenario: @ 0x0800CE80
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800CE94 @ =0x0202BBF8
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	beq _0800CE98
	movs r0, #0
	b _0800CEB0
	.align 2, 0
_0800CE94: .4byte 0x0202BBF8
_0800CE98:
	ldr r0, _0800CEB8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl EventLoadUnitsAsParty
	movs r0, #2
_0800CEB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CEB8: .4byte 0x0202E3F4
