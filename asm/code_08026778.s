	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitSupportNow
CanUnitSupportNow: @ 0x08026778
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080267DC @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080267D6
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080267D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl HasUnitGainedSupportLevel
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080267D6
	adds r0, r5, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _080267D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportUnit
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _080267D6
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	ldrb r7, [r0]
	ldr r4, _080267E0 @ =0x08B94184
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r7, #0xf1
	bne _080267E4
_080267D6:
	movs r0, #0
	b _080267EE
	.align 2, 0
_080267DC: .4byte 0x0202BBF8
_080267E0: .4byte 0x08B94184
_080267E4:
	movs r1, #0
	cmp r7, r0
	bne _080267EC
	movs r1, #1
_080267EC:
	adds r0, r1, #0
_080267EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
