	.include "macro.inc"

	.syntax unified

	thumb_func_start GetClassReelEntry
GetClassReelEntry: @ 0x080B02B0
	adds r3, r1, #0
	ldr r1, _080B02C8 @ =0x08CE6BDC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0
	beq _080B02E0
_080B02C0:
	cmp r3, #0
	bne _080B02CC
	ldr r0, [r1]
	b _080B02E2
	.align 2, 0
_080B02C8: .4byte 0x08CE6BDC
_080B02CC:
	subs r3, #1
	adds r1, #4
	ldr r0, [r1]
	cmp r0, #0
	bne _080B02DA
	adds r2, #4
	ldr r1, [r2]
_080B02DA:
	ldr r0, [r2]
	cmp r0, #0
	bne _080B02C0
_080B02E0:
	movs r0, #0
_080B02E2:
	bx lr
