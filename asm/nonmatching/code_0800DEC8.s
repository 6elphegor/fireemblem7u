	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_RemovePosition
EvtCmd_RemovePosition: @ 0x0800DEC8
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DEE0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DEE2
_0800DEE0:
	ldr r0, _0800DEF8 @ =0x0000FFFF
_0800DEE2:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DEFC
	adds r0, r2, #0
	b _0800DEFE
	.align 2, 0
_0800DEF8: .4byte 0x0000FFFF
_0800DEFC:
	ldr r0, _0800DF30 @ =0x0000FFFF
_0800DEFE:
	lsls r2, r0, #0x10
	ldr r0, _0800DF34 @ =0x0202E3DC
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DF38
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DF3E
	.align 2, 0
_0800DF30: .4byte 0x0000FFFF
_0800DF34: .4byte 0x0202E3DC
_0800DF38:
	adds r0, r4, #0
	bl ClearUnit
_0800DF3E:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
