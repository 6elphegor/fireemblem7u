	.include "macro.inc"

	.syntax unified

	thumb_func_start GetArticle
GetArticle: @ 0x08012DD4
	adds r3, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r2, r0, #0x1f
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _08012DF4
	ldr r0, _08012DF0 @ =0x08B928A4
	lsls r1, r2, #2
	adds r0, #0x10
	b _08012EF0
	.align 2, 0
_08012DF0: .4byte 0x08B928A4
_08012DF4:
	ldrb r0, [r3]
	subs r0, #0x41
	cmp r0, #0x34
	bhi _08012EEC
	lsls r0, r0, #2
	ldr r1, _08012E08 @ =_08012E0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012E08: .4byte _08012E0C
_08012E0C: @ jump table
	.4byte _08012EE0 @ case 0
	.4byte _08012EEC @ case 1
	.4byte _08012EEC @ case 2
	.4byte _08012EEC @ case 3
	.4byte _08012EE0 @ case 4
	.4byte _08012EEC @ case 5
	.4byte _08012EEC @ case 6
	.4byte _08012EEC @ case 7
	.4byte _08012EE0 @ case 8
	.4byte _08012EEC @ case 9
	.4byte _08012EEC @ case 10
	.4byte _08012EEC @ case 11
	.4byte _08012EEC @ case 12
	.4byte _08012EEC @ case 13
	.4byte _08012EE0 @ case 14
	.4byte _08012EEC @ case 15
	.4byte _08012EEC @ case 16
	.4byte _08012EEC @ case 17
	.4byte _08012EEC @ case 18
	.4byte _08012EEC @ case 19
	.4byte _08012EE0 @ case 20
	.4byte _08012EEC @ case 21
	.4byte _08012EEC @ case 22
	.4byte _08012EEC @ case 23
	.4byte _08012EEC @ case 24
	.4byte _08012EEC @ case 25
	.4byte _08012EEC @ case 26
	.4byte _08012EEC @ case 27
	.4byte _08012EEC @ case 28
	.4byte _08012EEC @ case 29
	.4byte _08012EEC @ case 30
	.4byte _08012EEC @ case 31
	.4byte _08012EE0 @ case 32
	.4byte _08012EEC @ case 33
	.4byte _08012EEC @ case 34
	.4byte _08012EEC @ case 35
	.4byte _08012EE0 @ case 36
	.4byte _08012EEC @ case 37
	.4byte _08012EEC @ case 38
	.4byte _08012EEC @ case 39
	.4byte _08012EE0 @ case 40
	.4byte _08012EEC @ case 41
	.4byte _08012EEC @ case 42
	.4byte _08012EEC @ case 43
	.4byte _08012EEC @ case 44
	.4byte _08012EEC @ case 45
	.4byte _08012EE0 @ case 46
	.4byte _08012EEC @ case 47
	.4byte _08012EEC @ case 48
	.4byte _08012EEC @ case 49
	.4byte _08012EEC @ case 50
	.4byte _08012EEC @ case 51
	.4byte _08012EE0 @ case 52
_08012EE0:
	ldr r0, _08012EE8 @ =0x08B928A4
	lsls r1, r2, #2
	adds r0, #8
	b _08012EF0
	.align 2, 0
_08012EE8: .4byte 0x08B928A4
_08012EEC:
	ldr r0, _08012EF8 @ =0x08B928A4
	lsls r1, r2, #2
_08012EF0:
	adds r1, r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08012EF8: .4byte 0x08B928A4
