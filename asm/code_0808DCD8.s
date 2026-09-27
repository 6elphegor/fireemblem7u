	.include "macro.inc"

	.syntax unified

	thumb_func_start RemoveSioPid
RemoveSioPid: @ 0x0808DCD8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _0808DD08 @ =0x0203E788
	adds r4, r3, #0
_0808DCE4:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0808DD0C
	adds r2, r1, #0
	cmp r1, #3
	bgt _0808DD00
	adds r1, r1, r4
_0808DCF4:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble _0808DCF4
_0808DD00:
	movs r0, #0
	strb r0, [r3, #4]
	b _0808DD12
	.align 2, 0
_0808DD08: .4byte 0x0203E788
_0808DD0C:
	adds r1, #1
	cmp r1, #4
	ble _0808DCE4
_0808DD12:
	pop {r4}
	pop {r0}
	bx r0
