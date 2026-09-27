	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitList_DrawColumnNames
UnitList_DrawColumnNames: @ 0x0808ABC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808AC0C @ =0x0200D658
	mov r8, r0
	bl ClearText
	cmp r4, #5
	bne _0808AC10
	movs r5, #0
	adds r4, r6, #0
_0808ABF2:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble _0808ABF2
	b _0808AC74
	.align 2, 0
_0808AC0C: .4byte 0x0200D658
_0808AC10:
	movs r5, #1
	ldr r3, _0808AC88 @ =0x08CC3578
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov sb, r7
	cmp r0, #0
	beq _0808AC6C
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
_0808AC36:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl Text_SetCursor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt _0808AC6C
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0808AC36
_0808AC6C:
	ldr r0, _0808AC8C @ =0x0200D658
	mov r1, sb
	bl PutText
_0808AC74:
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC88: .4byte 0x08CC3578
_0808AC8C: .4byte 0x0200D658
