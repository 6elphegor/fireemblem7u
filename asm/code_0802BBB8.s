	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMapObstacles
InitMapObstacles: @ 0x0802BBB8
	push {r4, r5, r6, lr}
	ldr r0, _0802BBEC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802BC38
_0802BBC6:
	ldr r0, _0802BBEC @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0802BC32
_0802BBD4:
	ldr r0, _0802BBF0 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802BBF4
	cmp r0, #0x33
	beq _0802BC20
	b _0802BC2C
	.align 2, 0
_0802BBEC: .4byte 0x0202E3D8
_0802BBF0: .4byte 0x0202E3E0
_0802BBF4:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802BC2C
	ldr r0, _0802BC1C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl AddTrap
	b _0802BC2C
	.align 2, 0
_0802BC1C: .4byte 0x0202BBF8
_0802BC20:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0x14
	bl AddTrap
_0802BC2C:
	subs r4, #1
	cmp r4, #0
	bge _0802BBD4
_0802BC32:
	adds r5, r6, #0
	cmp r5, #0
	bge _0802BBC6
_0802BC38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
