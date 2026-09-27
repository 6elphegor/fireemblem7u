	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_AddPrepScreenSupportMenuItem
AtMenu_AddPrepScreenSupportMenuItem: @ 0x0808DF20
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r1, r0, #0
	adds r1, #0x2f
	strb r6, [r1]
	ldr r2, _0808DF50 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r3, [r2, #0x14]
	ands r0, r3
	cmp r0, #0
	bne _0808DF8C
	ldrb r2, [r2, #0x1b]
	cmp r2, #1
	bne _0808DF5C
	ldr r1, _0808DF54 @ =PrepScreenMenu_OnSupport
	ldr r3, _0808DF58 @ =0x00001146
	str r6, [sp]
	movs r0, #4
	movs r2, #1
	bl SetPrepScreenMenuItem
	b _0808DF8C
	.align 2, 0
_0808DF50: .4byte 0x0202BBF8
_0808DF54: .4byte PrepScreenMenu_OnSupport
_0808DF58: .4byte 0x00001146
_0808DF5C:
	movs r4, #0
	adds r5, r1, #0
_0808DF60:
	adds r0, r4, #0
	bl sub_080991F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DF76
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_0808DF76:
	adds r4, #1
	cmp r4, #3
	ble _0808DF60
	ldr r1, _0808DF94 @ =PrepScreenMenu_OnSupport
	ldr r3, _0808DF98 @ =0x00001146
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl SetPrepScreenMenuItem
_0808DF8C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DF94: .4byte PrepScreenMenu_OnSupport
_0808DF98: .4byte 0x00001146
