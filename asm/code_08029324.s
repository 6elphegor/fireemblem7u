	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateHitTriangleAttack
BattleGenerateHitTriangleAttack: @ 0x08029324
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802938C
	ldr r4, _08029394 @ =0x0203A3D8
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _0802938C
	ldr r5, _08029398 @ =0x0203A50C
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	ands r1, r0
	cmp r1, #0
	beq _0802938C
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _0802938C
	movs r0, #0x20
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _0802938C
	adds r0, r2, #0
	adds r1, r3, #0
	bl BattleCheckTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802938C
	ldr r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x64
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
_0802938C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029394: .4byte 0x0203A3D8
_08029398: .4byte 0x0203A50C
