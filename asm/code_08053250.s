	.include "macro.inc"

	.syntax unified

	thumb_func_start FilterBattleAnimCharacterPalette
FilterBattleAnimCharacterPalette: @ 0x08053250
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8b
	bne _08053290
	adds r0, r1, #0
	bl GetItemIndex
	cmp r0, #0x35
	beq _08053280
	cmp r0, #0x35
	bgt _08053272
	cmp r0, #0x34
	beq _08053278
	b _08053290
_08053272:
	cmp r0, #0x36
	beq _08053288
	b _08053290
_08053278:
	ldr r0, _0805327C @ =0x081DA224
	b _08053292
	.align 2, 0
_0805327C: .4byte 0x081DA224
_08053280:
	ldr r0, _08053284 @ =0x081DA204
	b _08053292
	.align 2, 0
_08053284: .4byte 0x081DA204
_08053288:
	ldr r0, _0805328C @ =0x081DA244
	b _08053292
	.align 2, 0
_0805328C: .4byte 0x081DA244
_08053290:
	movs r0, #0
_08053292:
	pop {r1}
	bx r1
	.align 2, 0
