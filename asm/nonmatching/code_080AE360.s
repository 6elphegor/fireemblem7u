	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AE360
sub_080AE360: @ 0x080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	cmp r0, #0xf
	bls _080AE36C
	b _080AE4C2
_080AE36C:
	lsls r0, r0, #2
	ldr r1, _080AE378 @ =_080AE37C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE378: .4byte _080AE37C
_080AE37C: @ jump table
	.4byte _080AE3BC @ case 0
	.4byte _080AE3F2 @ case 1
	.4byte _080AE400 @ case 2
	.4byte _080AE40C @ case 3
	.4byte _080AE41C @ case 4
	.4byte _080AE42C @ case 5
	.4byte _080AE438 @ case 6
	.4byte _080AE448 @ case 7
	.4byte _080AE458 @ case 8
	.4byte _080AE4C2 @ case 9
	.4byte _080AE468 @ case 10
	.4byte _080AE478 @ case 11
	.4byte _080AE488 @ case 12
	.4byte _080AE498 @ case 13
	.4byte _080AE4A8 @ case 14
	.4byte _080AE4B8 @ case 15
_080AE3BC:
	ldr r0, _080AE3D4 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080AE3EA
	cmp r0, #1
	bgt _080AE3D8
	cmp r0, #0
	beq _080AE3E2
	b _080AE3F2
	.align 2, 0
_080AE3D4: .4byte 0x0202BBF8
_080AE3D8:
	cmp r0, #2
	beq _080AE3EE
	cmp r0, #3
	beq _080AE3E6
	b _080AE3F2
_080AE3E2:
	movs r0, #0
	b _080AE4C4
_080AE3E6:
	movs r0, #1
	b _080AE4C4
_080AE3EA:
	movs r0, #2
	b _080AE4C4
_080AE3EE:
	movs r0, #3
	b _080AE4C4
_080AE3F2:
	ldr r0, _080AE3FC @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080AE4C0
	.align 2, 0
_080AE3FC: .4byte 0x0202BBF8
_080AE400:
	ldr r0, _080AE408 @ =0x0202BBF8
	adds r0, #0x40
	b _080AE45C
	.align 2, 0
_080AE408: .4byte 0x0202BBF8
_080AE40C:
	ldr r0, _080AE418 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	b _080AE4C0
	.align 2, 0
_080AE418: .4byte 0x0202BBF8
_080AE41C:
	ldr r0, _080AE428 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	b _080AE4C2
	.align 2, 0
_080AE428: .4byte 0x0202BBF8
_080AE42C:
	ldr r0, _080AE434 @ =0x0202BBF8
	adds r0, #0x40
	b _080AE47C
	.align 2, 0
_080AE434: .4byte 0x0202BBF8
_080AE438:
	ldr r0, _080AE444 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AE4C0
	.align 2, 0
_080AE444: .4byte 0x0202BBF8
_080AE448:
	ldr r0, _080AE454 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080AE4C0
	.align 2, 0
_080AE454: .4byte 0x0202BBF8
_080AE458:
	ldr r0, _080AE464 @ =0x0202BBF8
	adds r0, #0x41
_080AE45C:
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1e
	b _080AE4C2
	.align 2, 0
_080AE464: .4byte 0x0202BBF8
_080AE468:
	ldr r0, _080AE474 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r2, r0, #0x1e
	b _080AE4C2
	.align 2, 0
_080AE474: .4byte 0x0202BBF8
_080AE478:
	ldr r0, _080AE484 @ =0x0202BBF8
	adds r0, #0x41
_080AE47C:
	ldrb r0, [r0]
	lsrs r2, r0, #7
	b _080AE4C2
	.align 2, 0
_080AE484: .4byte 0x0202BBF8
_080AE488:
	ldr r0, _080AE494 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	b _080AE4C0
	.align 2, 0
_080AE494: .4byte 0x0202BBF8
_080AE498:
	ldr r0, _080AE4A4 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AE4C0
	.align 2, 0
_080AE4A4: .4byte 0x0202BBF8
_080AE4A8:
	ldr r0, _080AE4B4 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AE4C0
	.align 2, 0
_080AE4B4: .4byte 0x0202BBF8
_080AE4B8:
	ldr r0, _080AE4C8 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
_080AE4C0:
	lsrs r2, r0, #0x1f
_080AE4C2:
	adds r0, r2, #0
_080AE4C4:
	bx lr
	.align 2, 0
_080AE4C8: .4byte 0x0202BBF8
