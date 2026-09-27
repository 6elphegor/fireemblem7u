	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxRedirectStatScreenSupports
HelpBoxRedirectStatScreenSupports: @ 0x08081738
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808175C @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _08081766
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _08081760
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
	b _08081766
	.align 2, 0
_0808175C: .4byte 0x0200310C
_08081760:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
_08081766:
	pop {r4}
	pop {r0}
	bx r0
