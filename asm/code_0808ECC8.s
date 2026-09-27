	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_ResetScreenEffect
AtMenu_ResetScreenEffect: @ 0x0808ECC8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	bl EndPrepSpecialCharEffect
	movs r0, #0
	bl InitBgs
	ldr r3, _0808ED2C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808ED30 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808ED24
	adds r0, r4, #0
	bl sub_0807CC38
_0808ED24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ED2C: .4byte 0x03002870
_0808ED30: .4byte 0x0000FFE0
