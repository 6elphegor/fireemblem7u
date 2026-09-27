	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnitsParty
EvtCmd_LoadUnitsParty: @ 0x0800CE58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CE7C @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl EventLoadUnitsAsParty
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CE7C: .4byte 0x0202E3F4
