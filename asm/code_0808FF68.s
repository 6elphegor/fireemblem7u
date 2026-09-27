	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPrepScreenMenuSelectedItem
SetPrepScreenMenuSelectedItem: @ 0x0808FF68
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _0808FF94 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FFA2
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_0808FF82:
	ldr r0, [r1]
	cmp r0, #0
	beq _0808FF9A
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _0808FF98
	strb r4, [r3]
	b _0808FFA2
	.align 2, 0
_0808FF94: .4byte 0x08CC416C
_0808FF98:
	adds r4, #1
_0808FF9A:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _0808FF82
_0808FFA2:
	pop {r4, r5}
	pop {r0}
	bx r0
