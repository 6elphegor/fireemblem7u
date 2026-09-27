	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxRedirectStatScreenItem
HelpBoxRedirectStatScreenItem: @ 0x08081668
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080816A8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _0808167C
	adds r0, r4, #0
	bl HelpBoxTryRelocateLeft
_0808167C:
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080816B6
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _080816A0
	cmp r0, #0x10
	beq _080816A0
	cmp r0, #0x40
	bne _080816AC
_080816A0:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
	b _080816B6
	.align 2, 0
_080816A8: .4byte 0x0200310C
_080816AC:
	cmp r0, #0x80
	bne _080816B6
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
_080816B6:
	pop {r4, r5}
	pop {r0}
	bx r0
