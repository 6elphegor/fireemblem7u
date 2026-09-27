	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_HandleAutoEnd
PlayerPhase_HandleAutoEnd: @ 0x0801D3AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0801D3D8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0801D3D0
	ldrb r0, [r1, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801D3D0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0801D3D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D3D8: .4byte 0x0202BBF8
