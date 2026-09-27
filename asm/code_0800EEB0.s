	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPopup_800EEB0
StartPopup_800EEB0: @ 0x0800EEB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	cmp r0, #0
	bne _0800EEDC
	ldr r0, _0800EED8 @ =0x08B91C64
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
	b _0800EEE8
	.align 2, 0
_0800EED8: .4byte 0x08B91C64
_0800EEDC:
	ldr r0, _0800EEF0 @ =0x08B91CBC
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
_0800EEE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEF0: .4byte 0x08B91CBC
