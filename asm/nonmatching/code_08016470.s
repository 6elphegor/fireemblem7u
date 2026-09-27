	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawItemMenuLine
DrawItemMenuLine: @ 0x08016470
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r3, #0
	movs r3, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	cmp r2, #0
	bne _0801648A
	movs r3, #1
_0801648A:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl Text_SetParams
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080164F0 @ =0x08BE222C
	adds r4, r1, r0
	ldrh r0, [r4]
	bl DecodeMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r1, r7, #4
	adds r0, r5, #0
	bl PutText
	adds r3, r7, #0
	adds r3, #0x16
	movs r5, #1
	mov r0, r8
	cmp r0, #0
	beq _080164D0
	movs r5, #2
_080164D0:
	ldr r0, [r4, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _080164DE
	movs r2, #0xff
_080164DE:
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	cmp r6, #0
	bne _080164F4
	movs r1, #1
	rsbs r1, r1, #0
	b _080164F6
	.align 2, 0
_080164F0: .4byte 0x08BE222C
_080164F4:
	ldrb r1, [r4, #0x1d]
_080164F6:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl PutIcon
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
