	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitInfoRequiresNoMovement
UnitInfoRequiresNoMovement: @ 0x0800CFE4
	adds r2, r0, #0
	ldr r0, _0800D010 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r2, #4]
	ands r1, r3
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r1, r0
	bne _0800D018
	ldr r0, _0800D014 @ =0x0202E3DC
	ldr r1, [r0]
	ldrb r3, [r2, #5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2, #4]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D018
	movs r0, #1
	b _0800D01A
	.align 2, 0
_0800D010: .4byte 0x0000FFFF
_0800D014: .4byte 0x0202E3DC
_0800D018:
	movs r0, #0
_0800D01A:
	bx lr
