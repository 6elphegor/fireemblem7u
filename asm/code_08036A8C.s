	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetChestUnlockItemSlot
AiGetChestUnlockItemSlot: @ 0x08036A8C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, _08036AAC @ =0x03004690
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08036AB4
	ldr r1, [r4]
	movs r0, #8
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	b _08036AF6
	.align 2, 0
_08036AAC: .4byte 0x03004690
_08036AB0:
	movs r0, #1
	b _08036AF8
_08036AB4:
	movs r5, #0
	adds r7, r4, #0
_08036AB8:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _08036AF6
	strb r5, [r6]
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x68
	beq _08036AB0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6a
	bne _08036AF0
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne _08036AB0
_08036AF0:
	adds r5, #1
	cmp r5, #4
	ble _08036AB8
_08036AF6:
	movs r0, #0
_08036AF8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
