	.include "macro.inc"

	.syntax unified

	thumb_func_start ParsePopupInstAndGetLen
ParsePopupInstAndGetLen: @ 0x0800A7E4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x2c]
	b _0800A906
_0800A7F0:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #0xb
	bls _0800A7FA
	b _0800A904
_0800A7FA:
	lsls r0, r0, #2
	ldr r1, _0800A804 @ =_0800A808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A804: .4byte _0800A808
_0800A808: @ jump table
	.4byte _0800A900 @ case 0
	.4byte _0800A8C4 @ case 1
	.4byte _0800A8D8 @ case 2
	.4byte _0800A8EC @ case 3
	.4byte _0800A8AC @ case 4
	.4byte _0800A898 @ case 5
	.4byte _0800A8A4 @ case 6
	.4byte _0800A904 @ case 7
	.4byte _0800A854 @ case 8
	.4byte _0800A874 @ case 9
	.4byte _0800A842 @ case 10
	.4byte _0800A838 @ case 11
_0800A838:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	b _0800A904
_0800A842:
	ldr r0, _0800A850 @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl NumberToStringAscii
	lsls r0, r0, #3
	b _0800A902
	.align 2, 0
_0800A850: .4byte 0x0300010C
_0800A854:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A870 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemIconId
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0
	b _0800A88A
	.align 2, 0
_0800A870: .4byte 0x03000108
_0800A874:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A894 @ =0x03000108
	ldrh r0, [r0]
	adds r0, #0x70
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #1
_0800A88A:
	bl ApplyIconPalette
	adds r4, #0x10
	b _0800A904
	.align 2, 0
_0800A894: .4byte 0x03000108
_0800A898:
	ldr r0, [r5, #4]
	bl DecodeMsg
	bl GetStringTextLen
	b _0800A902
_0800A8A4:
	ldr r0, [r5, #4]
	bl GetStringTextLen
	b _0800A902
_0800A8AC:
	ldr r0, _0800A8C0 @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	b _0800A902
	.align 2, 0
_0800A8C0: .4byte 0x03000104
_0800A8C4:
	ldr r0, _0800A8D4 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemName
	bl GetStringTextLen
	b _0800A902
	.align 2, 0
_0800A8D4: .4byte 0x03000108
_0800A8D8:
	ldr r0, _0800A8E8 @ =0x03000108
	ldrh r0, [r0]
	movs r1, #1
	bl GetItemNameWithArticle
	bl GetStringTextLen
	b _0800A902
	.align 2, 0
_0800A8E8: .4byte 0x03000108
_0800A8EC:
	ldr r0, _0800A8FC @ =0x03000108
	ldrh r0, [r0]
	movs r1, #0
	bl GetItemNameWithArticle
	bl GetStringTextLen
	b _0800A902
	.align 2, 0
_0800A8FC: .4byte 0x03000108
_0800A900:
	ldr r0, [r5, #4]
_0800A902:
	adds r4, r4, r0
_0800A904:
	adds r5, #8
_0800A906:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800A90E
	b _0800A7F0
_0800A90E:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
