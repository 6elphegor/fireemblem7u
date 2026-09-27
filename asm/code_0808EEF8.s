	.include "macro.inc"

	.syntax unified

	thumb_func_start HasConvoyAccess_
HasConvoyAccess_: @ 0x0808EEF8
	push {r4, lr}
	cmp r0, #0
	beq _0808EF04
	cmp r0, #1
	beq _0808EF34
	b _0808EF86
_0808EF04:
	movs r4, #1
_0808EF06:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808EF28
	ldr r1, [r0]
	cmp r1, #0
	beq _0808EF28
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808EF30
_0808EF28:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EF06
	b _0808EF86
_0808EF30:
	movs r0, #1
	b _0808EF88
_0808EF34:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EF86
	ldr r4, _0808EF90 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808EF52
	movs r1, #1
_0808EF52:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808EF86
	movs r4, #1
_0808EF5E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808EF80
	ldr r1, [r0]
	cmp r1, #0
	beq _0808EF80
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808EF30
_0808EF80:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EF5E
_0808EF86:
	movs r0, #0
_0808EF88:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808EF90: .4byte 0x0202BBF8
