	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddToMineTargetList
TryAddToMineTargetList: @ 0x08024AE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024B50 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024B48
	ldr r0, _08024B54 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08024B10
	ldr r0, _08024B58 @ =0x0202E3EC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024B48
_08024B10:
	ldr r0, _08024B5C @ =0x02033E40
	ldr r0, [r0]
	ldr r1, _08024B60 @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024B48
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	cmp r0, #0
	beq _08024B3C
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne _08024B48
_08024B3C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024B48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B50: .4byte 0x0202E3DC
_08024B54: .4byte 0x0202BBF8
_08024B58: .4byte 0x0202E3EC
_08024B5C: .4byte 0x02033E40
_08024B60: .4byte 0x0202E3E0
