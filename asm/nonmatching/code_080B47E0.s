	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B47E0
sub_080B47E0: @ 0x080B47E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #0
_080B47E8:
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B47FA
	adds r0, r4, #0
	bl sub_080B4C28
_080B47FA:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B47E8
	movs r4, #0
	movs r5, #0
_080B4806:
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B4818
	adds r0, r4, #0
	bl sub_080B4D14
_080B4818:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #4
	ble _080B4806
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
