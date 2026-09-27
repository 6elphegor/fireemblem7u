	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808EFFC
sub_0808EFFC: @ 0x0808EFFC
	push {r4, lr}
	movs r4, #1
_0808F000:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F024
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F024
	ldrb r1, [r1, #4]
	cmp r1, #0x23
	bne _0808F024
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F02A
	movs r0, #1
	b _0808F02C
_0808F024:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F000
_0808F02A:
	movs r0, #0
_0808F02C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
