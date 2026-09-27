	.include "macro.inc"

	.syntax unified

	thumb_func_start StartStoleItemPopup
StartStoleItemPopup: @ 0x0800EEF4
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	ldr r0, _0800EF1C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800EF24
	ldr r0, _0800EF20 @ =0x08B91D04
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	b _0800EF30
	.align 2, 0
_0800EF1C: .4byte 0x03004690
_0800EF20: .4byte 0x08B91D04
_0800EF24:
	ldr r0, _0800EF38 @ =0x08B91D5C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
_0800EF30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF38: .4byte 0x08B91D5C
