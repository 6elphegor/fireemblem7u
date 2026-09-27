	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPopup_800EE4C
StartPopup_800EE4C: @ 0x0800EE4C
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupNumber
	ldr r0, _0800EE70 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800EE78
	ldr r0, _0800EE74 @ =0x08B91BE4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	b _0800EE84
	.align 2, 0
_0800EE70: .4byte 0x03004690
_0800EE74: .4byte 0x08B91BE4
_0800EE78:
	ldr r0, _0800EE8C @ =0x08B91C2C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
_0800EE84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE8C: .4byte 0x08B91C2C
