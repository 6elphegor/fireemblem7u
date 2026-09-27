	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonSpriteBlinking_Loop
DragonSpriteBlinking_Loop: @ 0x0807B228
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r2, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	cmp r2, #0
	beq _0807B25E
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _0807B25E
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807B25E
	eors r1, r3
	str r1, [r2, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0807B25E:
	pop {r4}
	pop {r0}
	bx r0
