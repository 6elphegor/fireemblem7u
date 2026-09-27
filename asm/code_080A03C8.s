	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterCompletedPlaythrough
RegisterCompletedPlaythrough: @ 0x080A03C8
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0x14
	adds r2, r4, #0
_080A03D2:
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq _080A03F6
	adds r3, #1
	cmp r3, #0xb
	ble _080A03D2
	movs r3, #0
_080A03E2:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A03F0
	strb r1, [r2]
	movs r0, #1
	b _080A03F8
_080A03F0:
	adds r3, #1
	cmp r3, #0xb
	ble _080A03E2
_080A03F6:
	movs r0, #0
_080A03F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
