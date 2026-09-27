	.include "macro.inc"

	.syntax unified

	thumb_func_start StartStatScreenHelp
StartStatScreenHelp: @ 0x080814F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r1, _0808151C @ =0x0200310C
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0808153C
	cmp r4, #1
	beq _08081530
	cmp r4, #1
	bgt _08081520
	cmp r4, #0
	beq _08081526
	b _0808153C
	.align 2, 0
_0808151C: .4byte 0x0200310C
_08081520:
	cmp r4, #2
	beq _08081538
	b _0808153C
_08081526:
	ldr r0, _0808152C @ =0x08CC2140
	b _0808153A
	.align 2, 0
_0808152C: .4byte 0x08CC2140
_08081530:
	ldr r0, _08081534 @ =0x08CC231C
	b _0808153A
	.align 2, 0
_08081534: .4byte 0x08CC231C
_08081538:
	ldr r0, _0808154C @ =0x08CC24C0
_0808153A:
	str r0, [r1, #0x14]
_0808153C:
	ldr r0, _08081550 @ =0x0200310C
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl StartMovingHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808154C: .4byte 0x08CC24C0
_08081550: .4byte 0x0200310C
