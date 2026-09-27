	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056768
sub_08056768: @ 0x08056768
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080567AA
	ldr r0, [r4, #0x60]
	bl GetProperAnimSoundLocation
	adds r2, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r0, [r0, #2]
	adds r2, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xcd
	movs r3, #1
	bl PlaySFX
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt _080567AA
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
_080567AA:
	pop {r4}
	pop {r0}
	bx r0
