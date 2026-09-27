	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnitSpritesOam
PutUnitSpritesOam: @ 0x08025910
	push {r4, r5, r6, lr}
	ldr r0, _08025984 @ =0x02039F1C
	ldr r6, [r0]
	bl PutUnitSpriteIconsOam
	cmp r6, #0
	bne _08025920
	b _08025A92
_08025920:
	movs r3, #0
	movs r0, #4
	ldrsh r1, [r6, r0]
	ldr r2, _08025988 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r5, #6
	ldrsh r1, [r6, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08025946
	b _08025A8A
_08025946:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bls _08025950
	b _08025A8A
_08025950:
	movs r0, #0x80
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	beq _0802595C
	b _08025A8A
_0802595C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802596E
	bl GetGameTime
	adds r3, r0, #0
	movs r0, #2
	ands r3, r0
_0802596E:
	movs r0, #0xf
	ldrb r2, [r6, #0xb]
	ands r0, r2
	cmp r0, #5
	bls _0802597A
	b _08025A8A
_0802597A:
	lsls r0, r0, #2
	ldr r1, _0802598C @ =_08025990
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025984: .4byte 0x02039F1C
_08025988: .4byte 0x0202BBB8
_0802598C: .4byte _08025990
_08025990: @ jump table
	.4byte _080259A8 @ case 0
	.4byte _080259D0 @ case 1
	.4byte _080259F4 @ case 2
	.4byte _08025A1C @ case 3
	.4byte _08025A3C @ case 4
	.4byte _08025A64 @ case 5
_080259A8:
	adds r0, r4, r3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r1, _080259C8 @ =0x000001FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080259CC @ =0x08B905B8
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_080259C8: .4byte 0x000001FF
_080259CC: .4byte 0x08B905B8
_080259D0:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080259F0 @ =0x08B905D8
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_080259F0: .4byte 0x08B905D8
_080259F4:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A18 @ =0x08B905C0
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_08025A18: .4byte 0x08B905C0
_08025A1C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A38 @ =0x08B905B8
	b _08025A52
	.align 2, 0
_08025A38: .4byte 0x08B905B8
_08025A3C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A60 @ =0x08B905D8
_08025A52:
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
_08025A58:
	adds r3, r4, r5
	bl PutOamHiRam
	b _08025A8A
	.align 2, 0
_08025A60: .4byte 0x08B905D8
_08025A64:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A98 @ =0x08B905C0
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
	adds r3, r4, r5
	bl PutOamHiRam
_08025A8A:
	ldr r6, [r6]
	cmp r6, #0
	beq _08025A92
	b _08025920
_08025A92:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025A98: .4byte 0x08B905C0
