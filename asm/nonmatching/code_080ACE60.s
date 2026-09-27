	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACE60
sub_080ACE60: @ 0x080ACE60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r0, _080ACEC4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080ACE76
	movs r7, #1
_080ACE76:
	cmp r0, #3
	bne _080ACE7C
	movs r7, #2
_080ACE7C:
	bl ResetUnitSprites
	movs r5, #1
	adds r6, #0x2b
	mov r8, r6
	ldr r6, _080ACEC8 @ =0x08CE5788
_080ACE88:
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080ACEEA
	ldr r3, [r2]
	cmp r3, #0
	beq _080ACEEA
	ldr r0, [r2, #0xc]
	ldr r1, _080ACECC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080ACEEA
	cmp r7, #0
	beq _080ACED0
	ldrb r0, [r3, #4]
	cmp r0, r7
	bne _080ACED0
	ldr r0, [r6]
	lsls r1, r4, #3
	adds r1, r1, r0
	str r2, [r1, #4]
	adds r4, #1
	adds r0, r2, #0
	bl GetUnitSMSId
	bl UseUnitSprite
	b _080ACEEA
	.align 2, 0
_080ACEC4: .4byte 0x0202BBF8
_080ACEC8: .4byte 0x08CE5788
_080ACECC: .4byte 0x00010004
_080ACED0:
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _080ACEEA
	ldr r0, [r6]
	lsls r1, r4, #3
	adds r1, r1, r0
	str r2, [r1, #4]
	adds r4, #1
	adds r0, r2, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_080ACEEA:
	adds r5, #1
	cmp r5, #0x3f
	ble _080ACE88
	mov r0, r8
	strb r4, [r0]
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
