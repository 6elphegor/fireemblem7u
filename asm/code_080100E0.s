	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_PaletteFadeFromBlack
EvtCmd_PaletteFadeFromBlack: @ 0x080100E0
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
	beq _080100FA
	movs r0, #0
	b _08010132
_080100FA:
	cmp r3, #1
	beq _0801011A
	cmp r3, #1
	bgt _08010108
	cmp r3, #0
	beq _08010112
	b _08010130
_08010108:
	cmp r3, #2
	beq _08010122
	cmp r3, #3
	beq _0801012A
	b _08010130
_08010112:
	movs r0, #0x10
	bl NewBlockedFadeIn
	b _08010130
_0801011A:
	movs r0, #8
	bl NewBlockedFadeIn
	b _08010130
_08010122:
	movs r0, #4
	bl NewBlockedFadeIn
	b _08010130
_0801012A:
	movs r0, #2
	bl NewBlockedFadeIn
_08010130:
	movs r0, #2
_08010132:
	pop {r1}
	bx r1
	.align 2, 0
