	.include "macro.inc"

	.syntax unified

	thumb_func_start AiCountNearbyEnemyUnits
AiCountNearbyEnemyUnits: @ 0x08036514
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _0803659C @ =0x08B97034
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _080365A0 @ =0x0000270F
	cmp r0, r2
	beq _0803658E
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _080365A4 @ =0x0202E3D8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
_08036542:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _08036586
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _08036586
	ldr r0, _080365A8 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036586
	ldr r0, _080365AC @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036586
	adds r6, #1
_08036586:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, sb
	bne _08036542
_0803658E:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803659C: .4byte 0x08B97034
_080365A0: .4byte 0x0000270F
_080365A4: .4byte 0x0202E3D8
_080365A8: .4byte 0x0202E3DC
_080365AC: .4byte 0x0202BD48
