	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonTmCpyWithDistance
EkrDragonTmCpyWithDistance: @ 0x08064B98
	push {lr}
	ldr r0, _08064BB0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08064BBE
	cmp r0, #1
	bgt _08064BB4
	cmp r0, #0
	beq _08064BBA
	b _08064BD2
	.align 2, 0
_08064BB0: .4byte 0x0203E02C
_08064BB4:
	cmp r0, #2
	beq _08064BC8
	b _08064BD2
_08064BBA:
	movs r0, #0xf8
	b _08064BC0
_08064BBE:
	movs r0, #0xc0
_08064BC0:
	movs r1, #0
	bl EkrDragonTmCpyHFlip
	b _08064BD2
_08064BC8:
	movs r0, #0x10
	rsbs r0, r0, #0
	movs r1, #0
	bl EkrDragonTmCpyHFlip
_08064BD2:
	pop {r0}
	bx r0
	.align 2, 0
