	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawItemMenuLineNoColor
DrawItemMenuLineNoColor: @ 0x080165DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	bl Text_SetCursor
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801664C @ =0x08BE222C
	adds r5, r1, r0
	ldrh r0, [r5]
	bl DecodeMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r1, r7, #4
	adds r0, r4, #0
	bl PutText
	movs r0, #0x16
	adds r0, r0, r7
	mov r8, r0
	adds r0, r4, #0
	bl Text_GetColor
	adds r3, r0, #0
	ldr r0, [r5, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _08016638
	movs r2, #0xff
_08016638:
	mov r0, r8
	adds r1, r3, #0
	bl PutNumberOrBlank
	cmp r6, #0
	bne _08016650
	movs r1, #1
	rsbs r1, r1, #0
	b _08016652
	.align 2, 0
_0801664C: .4byte 0x08BE222C
_08016650:
	ldrb r1, [r5, #0x1d]
_08016652:
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
