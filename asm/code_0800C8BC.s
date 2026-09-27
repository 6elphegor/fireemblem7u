	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePositionInstant
EvtCmd_MovePositionInstant: @ 0x0800C8BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C8DC
	ldr r0, _0800C8D8 @ =0x0202E3DC
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	b _0800C8E2
	.align 2, 0
_0800C8D8: .4byte 0x0202E3DC
_0800C8DC:
	ldr r0, _0800C8FC @ =0x0202E3DC
	ldr r0, [r0]
	subs r0, #4
_0800C8E2:
	ldr r1, [r0]
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C904
	ldr r0, _0800C900 @ =0x0000FFFF
	ands r2, r0
	adds r0, r1, r2
	b _0800C906
	.align 2, 0
_0800C8FC: .4byte 0x0202E3DC
_0800C900: .4byte 0x0000FFFF
_0800C904:
	subs r0, r1, #1
_0800C906:
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _0800C950
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C92C
	ldr r3, _0800C928 @ =0x0000FFFF
	ands r3, r2
	b _0800C930
	.align 2, 0
_0800C928: .4byte 0x0000FFFF
_0800C92C:
	movs r3, #1
	rsbs r3, r3, #0
_0800C930:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C942
	adds r2, r1, #0
_0800C942:
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800C950:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
