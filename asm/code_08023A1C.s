	.include "macro.inc"

	.syntax unified

	thumb_func_start ForEachPosInRange
ForEachPosInRange: @ 0x08023A1C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023A6C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08023A64
_08023A2C:
	ldr r0, _08023A6C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08023A5E
_08023A3A:
	ldr r0, _08023A70 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023A58
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080BFC68
_08023A58:
	subs r4, #1
	cmp r4, #0
	bge _08023A3A
_08023A5E:
	adds r5, r6, #0
	cmp r5, #0
	bge _08023A2C
_08023A64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A6C: .4byte 0x0202E3D8
_08023A70: .4byte 0x0202E3E8
