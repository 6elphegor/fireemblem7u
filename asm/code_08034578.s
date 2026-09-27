	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecTrapAfterWarp
ExecTrapAfterWarp: @ 0x08034578
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034598 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08034598: .4byte 0x0203A85C
