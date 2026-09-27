	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemReach
GetItemReach: @ 0x08016DB4
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016DD4 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	subs r0, #0x11
	cmp r0, #0x2e
	bhi _08016EB8
	lsls r0, r0, #2
	ldr r1, _08016DD8 @ =_08016DDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016DD4: .4byte 0x08BE222C
_08016DD8: .4byte _08016DDC
_08016DDC: @ jump table
	.4byte _08016E98 @ case 0
	.4byte _08016E9C @ case 1
	.4byte _08016EA0 @ case 2
	.4byte _08016EB8 @ case 3
	.4byte _08016EB8 @ case 4
	.4byte _08016EB8 @ case 5
	.4byte _08016EB8 @ case 6
	.4byte _08016EB8 @ case 7
	.4byte _08016EB8 @ case 8
	.4byte _08016EB8 @ case 9
	.4byte _08016EB8 @ case 10
	.4byte _08016EB8 @ case 11
	.4byte _08016EB8 @ case 12
	.4byte _08016EB8 @ case 13
	.4byte _08016EB8 @ case 14
	.4byte _08016EB8 @ case 15
	.4byte _08016EB8 @ case 16
	.4byte _08016EA4 @ case 17
	.4byte _08016EA8 @ case 18
	.4byte _08016EB8 @ case 19
	.4byte _08016EB8 @ case 20
	.4byte _08016EB8 @ case 21
	.4byte _08016EB8 @ case 22
	.4byte _08016EB8 @ case 23
	.4byte _08016EB8 @ case 24
	.4byte _08016EB8 @ case 25
	.4byte _08016EB8 @ case 26
	.4byte _08016EB8 @ case 27
	.4byte _08016EB8 @ case 28
	.4byte _08016EB8 @ case 29
	.4byte _08016EB8 @ case 30
	.4byte _08016EB8 @ case 31
	.4byte _08016EB8 @ case 32
	.4byte _08016EB8 @ case 33
	.4byte _08016EAC @ case 34
	.4byte _08016EB8 @ case 35
	.4byte _08016EB8 @ case 36
	.4byte _08016EB8 @ case 37
	.4byte _08016EB8 @ case 38
	.4byte _08016EB8 @ case 39
	.4byte _08016EB8 @ case 40
	.4byte _08016EB0 @ case 41
	.4byte _08016EB8 @ case 42
	.4byte _08016EB8 @ case 43
	.4byte _08016EB8 @ case 44
	.4byte _08016EB8 @ case 45
	.4byte _08016EB4 @ case 46
_08016E98:
	movs r0, #1
	b _08016EBA
_08016E9C:
	movs r0, #3
	b _08016EBA
_08016EA0:
	movs r0, #7
	b _08016EBA
_08016EA4:
	movs r0, #2
	b _08016EBA
_08016EA8:
	movs r0, #6
	b _08016EBA
_08016EAC:
	movs r0, #4
	b _08016EBA
_08016EB0:
	movs r0, #0xc
	b _08016EBA
_08016EB4:
	movs r0, #0x14
	b _08016EBA
_08016EB8:
	movs r0, #0
_08016EBA:
	bx lr
