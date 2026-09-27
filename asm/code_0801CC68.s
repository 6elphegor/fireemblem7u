	.include "macro.inc"

	.syntax unified

	thumb_func_start EnsureCameraOntoActiveUnitPosition
EnsureCameraOntoActiveUnitPosition: @ 0x0801CC68
	push {lr}
	ldr r1, _0801CC8C @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CC86
	movs r1, #1
_0801CC86:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801CC8C: .4byte 0x03004690
