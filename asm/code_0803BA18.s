	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryDoSpecialItems
AiTryDoSpecialItems: @ 0x0803BA18
	push {r4, r5, r6, lr}
	ldr r1, _0803BA2C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803BA30
	movs r0, #0
	b _0803BAA2
	.align 2, 0
_0803BA2C: .4byte 0x0203A8EC
_0803BA30:
	movs r5, #0
	ldr r0, _0803BA90 @ =0x03004690
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0803BA7A
	ldr r6, _0803BA94 @ =0x081D3BE0
_0803BA3E:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0803BA64
	adds r0, r4, #0
	bl GetSpecialItemFuncIndex
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803BA64
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_0803BA64:
	adds r5, #1
	cmp r5, #4
	bgt _0803BA7A
	ldr r0, _0803BA90 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803BA3E
_0803BA7A:
	ldr r0, _0803BA98 @ =0x0203A8EC
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BAA0
	ldr r0, _0803BA9C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803BAA2
	.align 2, 0
_0803BA90: .4byte 0x03004690
_0803BA94: .4byte 0x081D3BE0
_0803BA98: .4byte 0x0203A8EC
_0803BA9C: .4byte 0x0203A97C
_0803BAA0:
	movs r0, #1
_0803BAA2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
