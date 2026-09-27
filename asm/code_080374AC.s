	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080374AC
sub_080374AC: @ 0x080374AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _08037538 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803752C
_080374C0:
	ldr r0, _08037538 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _08037526
	lsls r5, r1, #2
_080374D2:
	ldr r0, _0803753C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08037520
	ldr r6, _08037540 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08037520
	ldr r0, _08037544 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037520
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	movs r1, #1
	ldrb r0, [r0, #0xa]
	ands r1, r0
	cmp r1, #0
	beq _08037520
	adds r7, #1
_08037520:
	subs r4, #1
	cmp r4, #0
	bge _080374D2
_08037526:
	mov r1, r8
	cmp r1, #0
	bge _080374C0
_0803752C:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08037538: .4byte 0x0202E3D8
_0803753C: .4byte 0x0202E3E8
_08037540: .4byte 0x0202E3DC
_08037544: .4byte 0x0202BD48
