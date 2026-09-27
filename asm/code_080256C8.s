	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitDisplayedSpritePalette
GetUnitDisplayedSpritePalette: @ 0x080256C8
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _080256DC
	movs r0, #0xb
	b _080256EE
_080256DC:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080256EC
	adds r0, r2, #0
	bl GetUnitSpritePalette
	b _080256EE
_080256EC:
	movs r0, #0xf
_080256EE:
	pop {r1}
	bx r1
	.align 2, 0
