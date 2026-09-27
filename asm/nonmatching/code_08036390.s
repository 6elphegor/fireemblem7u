	.include "macro.inc"

	.syntax unified

	thumb_func_start AiCountEnemyUnitsInRange
AiCountEnemyUnitsInRange: @ 0x08036390
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _080363FC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080363F2
_080363A0:
	ldr r0, _080363FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _080363EC
	lsls r5, r1, #2
_080363B0:
	ldr r0, _08036400 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080363E6
	ldr r0, _08036404 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080363E6
	ldr r0, _08036408 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080363E6
	adds r6, #1
_080363E6:
	subs r4, #1
	cmp r4, #0
	bge _080363B0
_080363EC:
	adds r1, r7, #0
	cmp r1, #0
	bge _080363A0
_080363F2:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080363FC: .4byte 0x0202E3D8
_08036400: .4byte 0x0202E3E8
_08036404: .4byte 0x0202E3DC
_08036408: .4byte 0x0202BD48
