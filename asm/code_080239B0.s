	.include "macro.inc"

	.syntax unified

	thumb_func_start ForEachUnitInRange
ForEachUnitInRange: @ 0x080239B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023A10 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08023A08
_080239C0:
	ldr r0, _08023A10 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023A02
	lsls r5, r1, #2
_080239D0:
	ldr r0, _08023A14 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080239FC
	ldr r0, _08023A18 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080239FC
	bl GetUnit
	bl sub_080BFC68
_080239FC:
	subs r4, #1
	cmp r4, #0
	bge _080239D0
_08023A02:
	adds r1, r6, #0
	cmp r1, #0
	bge _080239C0
_08023A08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A10: .4byte 0x0202E3D8
_08023A14: .4byte 0x0202E3E8
_08023A18: .4byte 0x0202E3DC
