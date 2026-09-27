	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapTileAt
GetMinimapTileAt: @ 0x080A2454
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080A2478 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _080A246E
	b _080A263A
_080A246E:
	lsls r0, r0, #2
	ldr r1, _080A247C @ =_080A2480
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A2478: .4byte 0x0202E3E0
_080A247C: .4byte _080A2480
_080A2480: @ jump table
	.4byte _080A263A @ case 0
	.4byte _080A2584 @ case 1
	.4byte _080A2588 @ case 2
	.4byte _080A2594 @ case 3
	.4byte _080A2594 @ case 4
	.4byte _080A2594 @ case 5
	.4byte _080A2598 @ case 6
	.4byte _080A2598 @ case 7
	.4byte _080A259C @ case 8
	.4byte _080A263A @ case 9
	.4byte _080A25A0 @ case 10
	.4byte _080A25A4 @ case 11
	.4byte _080A25A8 @ case 12
	.4byte _080A25AC @ case 13
	.4byte _080A25B0 @ case 14
	.4byte _080A25B0 @ case 15
	.4byte _080A25B4 @ case 16
	.4byte _080A25C0 @ case 17
	.4byte _080A25C4 @ case 18
	.4byte _080A25C8 @ case 19
	.4byte _080A263A @ case 20
	.4byte _080A25DE @ case 21
	.4byte _080A25DE @ case 22
	.4byte _080A25EA @ case 23
	.4byte _080A25EA @ case 24
	.4byte _080A262A @ case 25
	.4byte _080A262A @ case 26
	.4byte _080A262A @ case 27
	.4byte _080A262A @ case 28
	.4byte _080A25EE @ case 29
	.4byte _080A25F2 @ case 30
	.4byte _080A25FC @ case 31
	.4byte _080A2600 @ case 32
	.4byte _080A2600 @ case 33
	.4byte _080A262A @ case 34
	.4byte _080A263A @ case 35
	.4byte _080A263A @ case 36
	.4byte _080A2604 @ case 37
	.4byte _080A260C @ case 38
	.4byte _080A2618 @ case 39
	.4byte _080A2618 @ case 40
	.4byte _080A2618 @ case 41
	.4byte _080A261C @ case 42
	.4byte _080A262A @ case 43
	.4byte _080A262A @ case 44
	.4byte _080A2620 @ case 45
	.4byte _080A262A @ case 46
	.4byte _080A25DE @ case 47
	.4byte _080A263A @ case 48
	.4byte _080A2636 @ case 49
	.4byte _080A263A @ case 50
	.4byte _080A25A8 @ case 51
	.4byte _080A25C8 @ case 52
	.4byte _080A25DE @ case 53
	.4byte _080A25DE @ case 54
	.4byte _080A25A4 @ case 55
	.4byte _080A2594 @ case 56
	.4byte _080A262A @ case 57
	.4byte _080A260C @ case 58
	.4byte _080A2608 @ case 59
	.4byte _080A25D2 @ case 60
	.4byte _080A262A @ case 61
	.4byte _080A25EA @ case 62
	.4byte _080A262A @ case 63
	.4byte _080A262A @ case 64
_080A2584:
	movs r0, #1
	b _080A263C
_080A2588:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapConnectKindAt
	adds r0, #0x40
	b _080A263C
_080A2594:
	movs r0, #2
	b _080A263C
_080A2598:
	movs r0, #3
	b _080A263C
_080A259C:
	movs r0, #4
	b _080A263C
_080A25A0:
	movs r0, #5
	b _080A263C
_080A25A4:
	movs r0, #6
	b _080A263C
_080A25A8:
	movs r0, #8
	b _080A263C
_080A25AC:
	movs r0, #9
	b _080A263C
_080A25B0:
	movs r0, #0xa
	b _080A263C
_080A25B4:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapRiverKindAt
	adds r0, #0x60
	b _080A263C
_080A25C0:
	movs r0, #0xb
	b _080A263C
_080A25C4:
	movs r0, #0x14
	b _080A263C
_080A25C8:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapBridgeKindAt
	b _080A263C
_080A25D2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapWaterKindAt
	adds r0, #0x30
	b _080A263C
_080A25DE:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapSeaKindAt
	adds r0, #0x30
	b _080A263C
_080A25EA:
	movs r0, #0xc
	b _080A263C
_080A25EE:
	movs r0, #0xd
	b _080A263C
_080A25F2:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapDoorTileAt
	b _080A263C
_080A25FC:
	movs r0, #0xe
	b _080A263C
_080A2600:
	movs r0, #0xf
	b _080A263C
_080A2604:
	movs r0, #0x1a
	b _080A263C
_080A2608:
	movs r0, #0x1b
	b _080A263C
_080A260C:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapCliffKindAt
	adds r0, #0x50
	b _080A263C
_080A2618:
	movs r0, #0x13
	b _080A263C
_080A261C:
	movs r0, #0x3a
	b _080A263C
_080A2620:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapStairTileAt
	b _080A263C
_080A262A:
	adds r0, r2, #0
	adds r1, r3, #0
	bl GetMinimapConnectKindAt
	adds r0, #0x20
	b _080A263C
_080A2636:
	movs r0, #0x19
	b _080A263C
_080A263A:
	movs r0, #0
_080A263C:
	pop {r1}
	bx r1
