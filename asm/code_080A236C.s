	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapStairTileAt
GetMinimapStairTileAt: @ 0x080A236C
	adds r2, r0, #0
	ldr r0, _080A23A4 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldr r0, [r1, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldr r0, [r1]
	adds r1, r2, r0
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A239E
	ldrb r1, [r1, #1]
	cmp r1, #0x2d
	bne _080A23A8
_080A239E:
	movs r0, #0x12
	b _080A23AA
	.align 2, 0
_080A23A4: .4byte 0x0202E3E0
_080A23A8:
	movs r0, #0x11
_080A23AA:
	bx lr
