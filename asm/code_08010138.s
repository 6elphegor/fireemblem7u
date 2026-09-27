	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_PaletteFadeToBlack
EvtCmd_PaletteFadeToBlack: @ 0x08010138
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08010152
	movs r0, #0
	b _0801018A
_08010152:
	cmp r3, #1
	beq _08010172
	cmp r3, #1
	bgt _08010160
	cmp r3, #0
	beq _0801016A
	b _08010188
_08010160:
	cmp r3, #2
	beq _0801017A
	cmp r3, #3
	beq _08010182
	b _08010188
_0801016A:
	movs r0, #0x10
	bl StartLockingPaletteFadeToBlack
	b _08010188
_08010172:
	movs r0, #8
	bl StartLockingPaletteFadeToBlack
	b _08010188
_0801017A:
	movs r0, #4
	bl StartLockingPaletteFadeToBlack
	b _08010188
_08010182:
	movs r0, #2
	bl StartLockingPaletteFadeToBlack
_08010188:
	movs r0, #2
_0801018A:
	pop {r1}
	bx r1
	.align 2, 0
