	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateHitAttributes
BattleGenerateHitAttributes: @ 0x08029264
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802928C @ =0x0203A3D8
	movs r5, #0
	movs r0, #0
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	movs r1, #1
	bl BattleRoll2RN
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029294
	ldr r0, _08029290 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #2
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	b _08029314
	.align 2, 0
_0802928C: .4byte 0x0203A3D8
_08029290: .4byte 0x0203A50C
_08029294:
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #8]
	subs r0, r1, r2
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xc]
	movs r1, #0
	bl BattleRoll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080292EA
	ldrh r0, [r4, #0xe]
	movs r1, #0
	bl BattleRoll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080292D4
	ldr r0, _080292D0 @ =0x0203A50C
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x7f
	b _080292E8
	.align 2, 0
_080292D0: .4byte 0x0203A50C
_080292D4:
	ldr r0, _0802931C @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #1
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
_080292E8:
	strh r0, [r4, #4]
_080292EA:
	ldr r1, _08029320 @ =0x0203A3D8
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0x7f
	ble _080292F8
	movs r0, #0x7f
	strh r0, [r1, #4]
_080292F8:
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08029304
	movs r0, #0
	strh r0, [r1, #4]
_08029304:
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08029314
	adds r1, r6, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_08029314:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802931C: .4byte 0x0203A50C
_08029320: .4byte 0x0203A3D8
