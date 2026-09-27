	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079214
sub_08079214: @ 0x08079214
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _08079248 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventInfo
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	cmp r0, #0x27
	bne _08079232
	bl sub_0807D7E0
_08079232:
	ldrb r0, [r5, #0x1b]
	cmp r0, #3
	bne _08079250
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _0807924C
	ldr r0, [r4, #0x24]
	b _0807925C
	.align 2, 0
_08079248: .4byte 0x0202BBF8
_0807924C:
	ldr r0, [r4, #0x20]
	b _0807925C
_08079250:
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08079264
	ldr r0, [r4, #0x1c]
_0807925C:
	str r0, [sp, #4]
	bl LoadUnits
	b _0807926C
_08079264:
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	bl LoadUnits
_0807926C:
	bl sub_080799C8
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
