	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnitsFiltered
EvtCmd_LoadUnitsFiltered: @ 0x0800CDEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r1, _0800CE38 @ =0xFFFF0000
	ands r0, r1
	ldr r1, _0800CE3C @ =0x0202BBF8
	cmp r0, #0
	beq _0800CE08
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800CE4E
_0800CE08:
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bne _0800CE4E
	ldr r0, _0800CE40 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CE48
	ldr r0, _0800CE44 @ =EventUnitLoadWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CE50
	.align 2, 0
_0800CE38: .4byte 0xFFFF0000
_0800CE3C: .4byte 0x0202BBF8
_0800CE40: .4byte 0x0202E3F4
_0800CE44: .4byte EventUnitLoadWait
_0800CE48:
	adds r0, r4, #0
	bl EventUnitLoadWait
_0800CE4E:
	movs r0, #0
_0800CE50:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
