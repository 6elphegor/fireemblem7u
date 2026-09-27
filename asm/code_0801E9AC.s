	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntro_EndIfNoUnits
PhaseIntro_EndIfNoUnits: @ 0x0801E9AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801E9C8 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801E9C2
	adds r0, r4, #0
	bl Proc_End
_0801E9C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E9C8: .4byte 0x0202BBF8
