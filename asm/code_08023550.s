	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023550
sub_08023550: @ 0x08023550
	push {r4, lr}
	ldr r1, _08023574 @ =0x0203A85C
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	ldr r4, _08023578 @ =0x03004690
	ldr r0, [r4]
	bl TryRemoveUnitFromBallista
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023574: .4byte 0x0203A85C
_08023578: .4byte 0x03004690
