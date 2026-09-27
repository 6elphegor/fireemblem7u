	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseItemPrepScreen
CanUnitUseItemPrepScreen: @ 0x0802803C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08028052
	b _0802818C
_08028052:
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x5a
	cmp r0, #0x3c
	bls _08028060
	b _0802818C
_08028060:
	lsls r0, r0, #2
	ldr r1, _0802806C @ =_08028070
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802806C: .4byte _08028070
_08028070: @ jump table
	.4byte _08028164 @ case 0
	.4byte _08028164 @ case 1
	.4byte _08028164 @ case 2
	.4byte _08028164 @ case 3
	.4byte _08028164 @ case 4
	.4byte _08028164 @ case 5
	.4byte _08028164 @ case 6
	.4byte _08028164 @ case 7
	.4byte _08028164 @ case 8
	.4byte _0802816E @ case 9
	.4byte _0802816E @ case 10
	.4byte _0802816E @ case 11
	.4byte _0802816E @ case 12
	.4byte _0802816E @ case 13
	.4byte _0802818C @ case 14
	.4byte _0802818C @ case 15
	.4byte _0802818C @ case 16
	.4byte _0802818C @ case 17
	.4byte _0802818C @ case 18
	.4byte _0802818C @ case 19
	.4byte _0802818C @ case 20
	.4byte _0802818C @ case 21
	.4byte _0802818C @ case 22
	.4byte _0802818C @ case 23
	.4byte _0802818C @ case 24
	.4byte _0802818C @ case 25
	.4byte _0802818C @ case 26
	.4byte _0802818C @ case 27
	.4byte _0802818C @ case 28
	.4byte _0802818C @ case 29
	.4byte _0802818C @ case 30
	.4byte _0802818C @ case 31
	.4byte _0802818C @ case 32
	.4byte _0802818C @ case 33
	.4byte _0802818C @ case 34
	.4byte _0802818C @ case 35
	.4byte _0802818C @ case 36
	.4byte _0802818C @ case 37
	.4byte _0802818C @ case 38
	.4byte _0802818C @ case 39
	.4byte _0802818C @ case 40
	.4byte _0802818C @ case 41
	.4byte _0802818C @ case 42
	.4byte _0802818C @ case 43
	.4byte _0802818C @ case 44
	.4byte _0802816E @ case 45
	.4byte _0802817C @ case 46
	.4byte _0802816E @ case 47
	.4byte _0802818C @ case 48
	.4byte _0802816E @ case 49
	.4byte _0802818C @ case 50
	.4byte _0802818C @ case 51
	.4byte _0802818C @ case 52
	.4byte _0802818C @ case 53
	.4byte _0802818C @ case 54
	.4byte _0802818C @ case 55
	.4byte _0802818C @ case 56
	.4byte _0802818C @ case 57
	.4byte _0802818C @ case 58
	.4byte _0802818C @ case 59
	.4byte _0802816E @ case 60
_08028164:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStatGainItem
	b _08028176
_0802816E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08027400
_08028176:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802818E
_0802817C:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _0802818C
	movs r0, #1
	b _0802818E
_0802818C:
	movs r0, #0
_0802818E:
	pop {r4, r5}
	pop {r1}
	bx r1
