	.include "macro.inc"

	.syntax unified

	thumb_func_start ChangeActiveUnitFacing
ChangeActiveUnitFacing: @ 0x0801EC10
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0801EC3C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetFacingFromTo
	adds r0, #5
	ldr r1, _0801EC40 @ =0x02033E00
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r1, #0
	bl SetAutoMuMoveScript
	pop {r0}
	bx r0
	.align 2, 0
_0801EC3C: .4byte 0x03004690
_0801EC40: .4byte 0x02033E00
