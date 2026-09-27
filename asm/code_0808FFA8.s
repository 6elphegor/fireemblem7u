	.include "macro.inc"

	.syntax unified

	thumb_func_start GetActivePrepMenuItemIndex
GetActivePrepMenuItemIndex: @ 0x0808FFA8
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _0808FFD8 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _0808FFE6
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_0808FFC2:
	ldr r1, [r2]
	cmp r1, #0
	beq _0808FFDE
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _0808FFDC
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _0808FFE8
	.align 2, 0
_0808FFD8: .4byte 0x08CC416C
_0808FFDC:
	adds r4, #1
_0808FFDE:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _0808FFC2
_0808FFE6:
	movs r0, #0
_0808FFE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
