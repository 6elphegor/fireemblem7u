	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnitsByMode
EvtCmd_LoadUnitsByMode: @ 0x0800CEBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CEF4 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CED8
	adds r4, #2
_0800CED8:
	ldr r0, _0800CEF8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #1
	beq _0800CEFC
	cmp r4, #1
	ble _0800CF0E
	cmp r4, #2
	beq _0800CF02
	cmp r4, #3
	beq _0800CF08
	b _0800CF0E
	.align 2, 0
_0800CEF4: .4byte 0x0202BBF8
_0800CEF8: .4byte 0x0202E3F4
_0800CEFC:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CF12
_0800CF02:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CF12
_0800CF08:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CF12
_0800CF0E:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CF12:
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0800CF3A
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CF34
	ldr r0, _0800CF30 @ =EventUnitLoadWait
	str r0, [r5, #0x40]
	movs r0, #2
	b _0800CF3C
	.align 2, 0
_0800CF30: .4byte EventUnitLoadWait
_0800CF34:
	adds r0, r5, #0
	bl EventUnitLoadWait
_0800CF3A:
	movs r0, #0
_0800CF3C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
