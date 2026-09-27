	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E1C0
sub_0807E1C0: @ 0x0807E1C0
	push {r4, r5, lr}
	ldr r5, _0807E240 @ =0x08CE08F8
	ldr r0, _0807E244 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r0, #0x27
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E248 @ =0x08CE0978
	bl FakeLoadUnit
	movs r0, #1
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E24C @ =0x08CE0998
	bl FakeLoadUnit
	movs r0, #1
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E250 @ =0x08CE0898
	bl FakeLoadUnit
	movs r0, #2
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E254 @ =0x08CE08B8
	bl FakeLoadUnit
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E258 @ =0x08CE08D8
	bl FakeLoadUnit
	movs r4, #1
_0807E216:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	bne _0807E224
	b _0807E32E
_0807E224:
	ldr r0, [r2]
	cmp r0, #0
	bne _0807E22C
	b _0807E32E
_0807E22C:
	ldrb r0, [r0, #4]
	subs r0, #1
	cmp r0, #0x2c
	bhi _0807E314
	lsls r0, r0, #2
	ldr r1, _0807E25C @ =_0807E260
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E240: .4byte 0x08CE08F8
_0807E244: .4byte 0x0202E3F4
_0807E248: .4byte 0x08CE0978
_0807E24C: .4byte 0x08CE0998
_0807E250: .4byte 0x08CE0898
_0807E254: .4byte 0x08CE08B8
_0807E258: .4byte 0x08CE08D8
_0807E25C: .4byte _0807E260
_0807E260: @ jump table
	.4byte _0807E32E @ case 0
	.4byte _0807E32E @ case 1
	.4byte _0807E314 @ case 2
	.4byte _0807E314 @ case 3
	.4byte _0807E314 @ case 4
	.4byte _0807E314 @ case 5
	.4byte _0807E314 @ case 6
	.4byte _0807E314 @ case 7
	.4byte _0807E314 @ case 8
	.4byte _0807E314 @ case 9
	.4byte _0807E314 @ case 10
	.4byte _0807E314 @ case 11
	.4byte _0807E314 @ case 12
	.4byte _0807E314 @ case 13
	.4byte _0807E314 @ case 14
	.4byte _0807E314 @ case 15
	.4byte _0807E314 @ case 16
	.4byte _0807E314 @ case 17
	.4byte _0807E314 @ case 18
	.4byte _0807E314 @ case 19
	.4byte _0807E314 @ case 20
	.4byte _0807E314 @ case 21
	.4byte _0807E314 @ case 22
	.4byte _0807E314 @ case 23
	.4byte _0807E314 @ case 24
	.4byte _0807E314 @ case 25
	.4byte _0807E314 @ case 26
	.4byte _0807E314 @ case 27
	.4byte _0807E314 @ case 28
	.4byte _0807E314 @ case 29
	.4byte _0807E314 @ case 30
	.4byte _0807E314 @ case 31
	.4byte _0807E314 @ case 32
	.4byte _0807E314 @ case 33
	.4byte _0807E314 @ case 34
	.4byte _0807E314 @ case 35
	.4byte _0807E314 @ case 36
	.4byte _0807E32E @ case 37
	.4byte _0807E32E @ case 38
	.4byte _0807E314 @ case 39
	.4byte _0807E314 @ case 40
	.4byte _0807E314 @ case 41
	.4byte _0807E314 @ case 42
	.4byte _0807E314 @ case 43
	.4byte _0807E32E @ case 44
_0807E314:
	ldr r0, [r2, #0xc]
	ldr r1, _0807E344 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807E32E
	adds r0, r5, #0
	adds r1, r2, #0
	bl FakeLoadUnit
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807E336
_0807E32E:
	adds r4, #1
	cmp r4, #0x3f
	bgt _0807E336
	b _0807E216
_0807E336:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E344: .4byte 0x0001000C
