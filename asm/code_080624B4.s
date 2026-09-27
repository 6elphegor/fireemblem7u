	.include "macro.inc"

	.syntax unified

	thumb_func_start efxDamageMojiEffectMain
efxDamageMojiEffectMain: @ 0x080624B4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080624D2
	ldr r0, [r1, #0x5c]
	adds r1, #0x29
	ldrb r1, [r1]
	bl NewEfxDamageMojiEffectOBJ
	b _080624DC
_080624D2:
	cmp r0, #0xa
	bne _080624DC
	adds r0, r1, #0
	bl Proc_Break
_080624DC:
	pop {r0}
	bx r0
