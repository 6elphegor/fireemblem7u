	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateHitScriptedDamage
BattleGenerateHitScriptedDamage: @ 0x0802A83C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0802A8A0 @ =0x0203A3D8
	movs r0, #0
	strh r0, [r2, #4]
	ldr r0, _0802A8A4 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #2
	ldrh r3, [r1]
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0802A89A
	ldrh r5, [r2, #6]
	ldrh r6, [r2, #8]
	subs r0, r5, r6
	strh r0, [r2, #4]
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802A874
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r2, #4]
_0802A874:
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0x7f
	ble _0802A880
	movs r0, #0x7f
	strh r0, [r2, #4]
_0802A880:
	movs r5, #4
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _0802A88A
	strh r3, [r2, #4]
_0802A88A:
	movs r6, #4
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0802A89A
	adds r1, r4, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802A89A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A8A0: .4byte 0x0203A3D8
_0802A8A4: .4byte 0x0203A50C
