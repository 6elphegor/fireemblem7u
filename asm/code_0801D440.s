	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801D440
sub_0801D440: @ 0x0801D440
	push {r4, r5, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D476
	adds r5, r4, #0
	adds r5, #0x3c
	ldrb r0, [r5]
	cmp r0, #2
	beq _0801D45E
	ldr r0, [r4, #0x34]
	bl EndMu
_0801D45E:
	adds r0, r4, #0
	bl Proc_Break
	ldrb r5, [r5]
	cmp r5, #1
	bne _0801D476
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
_0801D476:
	pop {r4, r5}
	pop {r0}
	bx r0
