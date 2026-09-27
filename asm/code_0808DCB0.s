	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterSioPid
RegisterSioPid: @ 0x0808DCB0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _0808DCC8 @ =0x0203E788
_0808DCBA:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808DCCC
	strb r3, [r1]
	b _0808DCD2
	.align 2, 0
_0808DCC8: .4byte 0x0203E788
_0808DCCC:
	adds r2, #1
	cmp r2, #4
	ble _0808DCBA
_0808DCD2:
	pop {r4}
	pop {r0}
	bx r0
