	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUsePromotionItem
CanUnitUsePromotionItem: @ 0x08027400
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #9
	bgt _08027410
	b _0802756C
_08027410:
	adds r0, r1, #0
	bl GetItemIndex
	subs r0, #0x63
	cmp r0, #0x33
	bls _0802741E
	b _08027556
_0802741E:
	lsls r0, r0, #2
	ldr r1, _08027428 @ =_0802742C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027428: .4byte _0802742C
_0802742C: @ jump table
	.4byte _080274FC @ case 0
	.4byte _08027504 @ case 1
	.4byte _0802750C @ case 2
	.4byte _08027514 @ case 3
	.4byte _0802751C @ case 4
	.4byte _08027556 @ case 5
	.4byte _08027556 @ case 6
	.4byte _08027556 @ case 7
	.4byte _08027556 @ case 8
	.4byte _08027556 @ case 9
	.4byte _08027556 @ case 10
	.4byte _08027556 @ case 11
	.4byte _08027556 @ case 12
	.4byte _08027556 @ case 13
	.4byte _08027556 @ case 14
	.4byte _08027556 @ case 15
	.4byte _08027556 @ case 16
	.4byte _08027556 @ case 17
	.4byte _08027556 @ case 18
	.4byte _08027556 @ case 19
	.4byte _08027556 @ case 20
	.4byte _08027556 @ case 21
	.4byte _08027556 @ case 22
	.4byte _08027556 @ case 23
	.4byte _08027556 @ case 24
	.4byte _08027556 @ case 25
	.4byte _08027556 @ case 26
	.4byte _08027556 @ case 27
	.4byte _08027556 @ case 28
	.4byte _08027556 @ case 29
	.4byte _08027556 @ case 30
	.4byte _08027556 @ case 31
	.4byte _08027556 @ case 32
	.4byte _08027556 @ case 33
	.4byte _08027556 @ case 34
	.4byte _08027556 @ case 35
	.4byte _08027524 @ case 36
	.4byte _08027556 @ case 37
	.4byte _0802752C @ case 38
	.4byte _08027556 @ case 39
	.4byte _08027548 @ case 40
	.4byte _08027556 @ case 41
	.4byte _08027556 @ case 42
	.4byte _08027556 @ case 43
	.4byte _08027556 @ case 44
	.4byte _08027556 @ case 45
	.4byte _08027556 @ case 46
	.4byte _08027556 @ case 47
	.4byte _08027556 @ case 48
	.4byte _08027556 @ case 49
	.4byte _08027556 @ case 50
	.4byte _08027554 @ case 51
_080274FC:
	ldr r4, _08027500 @ =0x08C97EDD
	b _08027556
	.align 2, 0
_08027500: .4byte 0x08C97EDD
_08027504:
	ldr r4, _08027508 @ =0x08C97EE3
	b _08027556
	.align 2, 0
_08027508: .4byte 0x08C97EE3
_0802750C:
	ldr r4, _08027510 @ =0x08C97EE8
	b _08027556
	.align 2, 0
_08027510: .4byte 0x08C97EE8
_08027514:
	ldr r4, _08027518 @ =0x08C97EED
	b _08027556
	.align 2, 0
_08027518: .4byte 0x08C97EED
_0802751C:
	ldr r4, _08027520 @ =0x08C97EF1
	b _08027556
	.align 2, 0
_08027520: .4byte 0x08C97EF1
_08027524:
	ldr r4, _08027528 @ =0x08C97EFD
	b _08027556
	.align 2, 0
_08027528: .4byte 0x08C97EFD
_0802752C:
	ldr r0, _0802753C @ =0x0202BBF8
	ldr r4, _08027540 @ =0x08C97F16
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08027556
	ldr r4, _08027544 @ =0x08C97F21
	b _08027556
	.align 2, 0
_0802753C: .4byte 0x0202BBF8
_08027540: .4byte 0x08C97F16
_08027544: .4byte 0x08C97F21
_08027548:
	ldr r4, _0802754C @ =0x08C97F29
	b _08027556
	.align 2, 0
_0802754C: .4byte 0x08C97F29
_08027550:
	movs r0, #1
	b _0802756E
_08027554:
	ldr r4, _08027574 @ =0x08C97F24
_08027556:
	ldrb r1, [r4]
	cmp r1, #0
	beq _0802756C
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
_08027560:
	cmp r0, r1
	beq _08027550
	adds r4, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _08027560
_0802756C:
	movs r0, #0
_0802756E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027574: .4byte 0x08C97F24
