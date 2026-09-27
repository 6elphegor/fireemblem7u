	.include "macro.inc"

	.syntax unified

	thumb_func_start BmBgfx_End
BmBgfx_End: @ 0x080AA6E4
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _080AA712
	adds r4, r1, #0
	adds r4, #0x34
	ldrb r0, [r4]
	ldr r1, [r1, #0x3c]
	bl SetBgChrOffset
	ldrb r0, [r4]
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl EnableBgSync
_080AA712:
	pop {r4}
	pop {r0}
	bx r0
