	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B440
sub_0809B440: @ 0x0809B440
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809B474
	movs r4, #1
_0809B450:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809B46C
	ldr r0, [r1]
	cmp r0, #0
	beq _0809B46C
	adds r0, r1, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_0809B46C:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809B450
	b _0809B49C
_0809B474:
	movs r4, #0
	ldr r0, _0809B4A8 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	bge _0809B49C
	movs r5, #0
_0809B480:
	ldr r0, _0809B4AC @ =0x08CC5798
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r5, #0x18
	adds r4, #1
	ldr r0, _0809B4A8 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	blt _0809B480
_0809B49C:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B4A8: .4byte 0x02012BF8
_0809B4AC: .4byte 0x08CC5798
