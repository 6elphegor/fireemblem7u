	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyWeaponTriangleEffect
BattleApplyWeaponTriangleEffect: @ 0x0802A170
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0802A17C @ =0x08B9426C
	b _0802A1C0
	.align 2, 0
_0802A17C: .4byte 0x08B9426C
_0802A180:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0802A1BE
	adds r0, r5, #0
	adds r0, #0x50
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _0802A1BE
	ldrb r0, [r2, #2]
	adds r1, r4, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r1, [r2, #3]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldrb r1, [r2, #2]
	rsbs r0, r1, #0
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r2, [r2, #3]
	rsbs r1, r2, #0
	adds r0, r5, #0
	adds r0, #0x54
	strb r1, [r0]
	b _0802A1C8
_0802A1BE:
	adds r2, #4
_0802A1C0:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0802A180
_0802A1C8:
	ldr r0, [r4, #0x4c]
	movs r6, #0x80
	lsls r6, r6, #1
	ands r0, r6
	cmp r0, #0
	beq _0802A1DC
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyReaverEffect
_0802A1DC:
	ldr r0, [r5, #0x4c]
	ands r0, r6
	cmp r0, #0
	beq _0802A1EC
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyReaverEffect
_0802A1EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
