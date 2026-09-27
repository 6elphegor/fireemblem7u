	.include "macro.inc"

	.syntax unified

	thumb_func_start GeneratePopupText
GeneratePopupText: @ 0x0800A918
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	b _0800AA02
_0800A924:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #0xa
	bhi _0800AA00
	lsls r0, r0, #2
	ldr r1, _0800A938 @ =_0800A93C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A938: .4byte _0800A93C
_0800A93C: @ jump table
	.4byte _0800A9F8 @ case 0
	.4byte _0800A9BC @ case 1
	.4byte _0800A9CC @ case 2
	.4byte _0800A9DC @ case 3
	.4byte _0800A9A8 @ case 4
	.4byte _0800A994 @ case 5
	.4byte _0800A99E @ case 6
	.4byte _0800A98A @ case 7
	.4byte _0800A980 @ case 8
	.4byte _0800A980 @ case 9
	.4byte _0800A968 @ case 10
_0800A968:
	ldr r0, _0800A97C @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl NumberToStringAscii
	add r0, sp, #0x10
	mov r1, sp
	bl Text_DrawString
	b _0800AA00
	.align 2, 0
_0800A97C: .4byte 0x0300010C
_0800A980:
	add r0, sp, #0x10
	movs r1, #0x10
	bl Text_Skip
	b _0800AA00
_0800A98A:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_SetColor
	b _0800AA00
_0800A994:
	add r4, sp, #0x10
	ldr r0, [r5, #4]
	bl DecodeMsg
	b _0800A9E8
_0800A99E:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_DrawString
	b _0800AA00
_0800A9A8:
	add r4, sp, #0x10
	ldr r0, _0800A9B8 @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	b _0800A9E8
	.align 2, 0
_0800A9B8: .4byte 0x03000104
_0800A9BC:
	add r4, sp, #0x10
	ldr r0, _0800A9C8 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemName
	b _0800A9E8
	.align 2, 0
_0800A9C8: .4byte 0x03000108
_0800A9CC:
	add r4, sp, #0x10
	ldr r0, _0800A9D8 @ =0x03000108
	ldrh r0, [r0]
	movs r1, #1
	b _0800A9E4
	.align 2, 0
_0800A9D8: .4byte 0x03000108
_0800A9DC:
	add r4, sp, #0x10
	ldr r0, _0800A9F4 @ =0x03000108
	ldrh r0, [r0]
	movs r1, #0
_0800A9E4:
	bl GetItemNameWithArticle
_0800A9E8:
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	b _0800AA00
	.align 2, 0
_0800A9F4: .4byte 0x03000108
_0800A9F8:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_Skip
_0800AA00:
	adds r5, #8
_0800AA02:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A924
	movs r0, #3
	bl EnableBgSync
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
