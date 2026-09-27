	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnitsPartyByMode
EvtCmd_LoadUnitsPartyByMode: @ 0x0800CF44
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CF7C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CF60
	adds r4, #2
_0800CF60:
	ldr r0, _0800CF80 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #1
	beq _0800CF84
	cmp r4, #1
	ble _0800CF96
	cmp r4, #2
	beq _0800CF8A
	cmp r4, #3
	beq _0800CF90
	b _0800CF96
	.align 2, 0
_0800CF7C: .4byte 0x0202BBF8
_0800CF80: .4byte 0x0202E3F4
_0800CF84:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CF9A
_0800CF8A:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CF9A
_0800CF90:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CF9A
_0800CF96:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CF9A:
	str r0, [r5, #0x44]
	adds r0, r5, #0
	bl EventLoadUnitsAsParty
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
