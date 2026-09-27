	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_HidePosition
EvtCmd_HidePosition: @ 0x0800E100
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800E118
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800E11A
_0800E118:
	ldr r0, _0800E130 @ =0x0000FFFF
_0800E11A:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800E134
	adds r0, r2, #0
	b _0800E136
	.align 2, 0
_0800E130: .4byte 0x0000FFFF
_0800E134:
	ldr r0, _0800E164 @ =0x0000FFFF
_0800E136:
	lsls r2, r0, #0x10
	ldr r0, _0800E168 @ =0x0202E3DC
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0800E164: .4byte 0x0000FFFF
_0800E168: .4byte 0x0202E3DC
