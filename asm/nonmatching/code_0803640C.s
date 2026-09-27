	.include "macro.inc"

	.syntax unified

	thumb_func_start AiCountAlliedUnitsInRange
AiCountAlliedUnitsInRange: @ 0x0803640C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _08036478 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08036470
_0803641C:
	ldr r0, _08036478 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803646A
	lsls r5, r1, #2
_0803642C:
	ldr r0, _0803647C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08036464
	ldr r0, _08036480 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036464
	ldr r0, _08036484 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08036464
	adds r6, #1
_08036464:
	subs r4, #1
	cmp r4, #0
	bge _0803642C
_0803646A:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803641C
_08036470:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036478: .4byte 0x0202E3D8
_0803647C: .4byte 0x0202E3E8
_08036480: .4byte 0x0202E3DC
_08036484: .4byte 0x0202BD48
