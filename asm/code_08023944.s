	.include "macro.inc"

	.syntax unified

	thumb_func_start ForEachUnitInMovement
ForEachUnitInMovement: @ 0x08023944
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080239A4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0802399C
_08023954:
	ldr r0, _080239A4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023996
	lsls r5, r1, #2
_08023964:
	ldr r0, _080239A8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023990
	ldr r0, _080239AC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023990
	bl GetUnit
	bl sub_080BFC68
_08023990:
	subs r4, #1
	cmp r4, #0
	bge _08023964
_08023996:
	adds r1, r6, #0
	cmp r1, #0
	bge _08023954
_0802399C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080239A4: .4byte 0x0202E3D8
_080239A8: .4byte 0x0202E3E4
_080239AC: .4byte 0x0202E3DC
