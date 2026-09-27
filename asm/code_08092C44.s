	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItem_DrawSMS
PrepItem_DrawSMS: @ 0x08092C44
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _08092CA4
_08092C4C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x32]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _08092CA2
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092C88
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08092C34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092CA2
_08092C88:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutUnitSprite
_08092CA2:
	adds r6, #1
_08092CA4:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08092C4C
	bl SyncUnitSpriteSheet
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
