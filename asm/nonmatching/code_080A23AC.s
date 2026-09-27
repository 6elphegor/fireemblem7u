	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapDoorTileAt
GetMinimapDoorTileAt: @ 0x080A23AC
	ldr r2, _080A23C4 @ =0x0202E3E0
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	cmp r1, #0x1e
	bne _080A23C8
	movs r0, #0x16
	b _080A23D6
	.align 2, 0
_080A23C4: .4byte 0x0202E3E0
_080A23C8:
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080A23D4
	movs r0, #7
	b _080A23D6
_080A23D4:
	movs r0, #0x17
_080A23D6:
	bx lr
