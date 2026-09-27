	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNewPlaythroughId
GetNewPlaythroughId: @ 0x080A036C
	push {r4, lr}
	movs r4, #1
_080A0370:
	adds r0, r4, #0
	bl IsPlaythroughIdUnique
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0380
	adds r0, r4, #0
	b _080A0386
_080A0380:
	adds r4, #1
	cmp r4, #0xff
	ble _080A0370
_080A0386:
	pop {r4}
	pop {r1}
	bx r1
