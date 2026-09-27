	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022C98
sub_08022C98: @ 0x08022C98
	push {r4, lr}
	ldr r4, _08022CB8 @ =0x0203A85C
	movs r0, #0x10
	strb r0, [r4, #0x11]
	ldr r0, _08022CBC @ =0x03004690
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	strb r1, [r4, #0xc]
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022CB8: .4byte 0x0203A85C
_08022CBC: .4byte 0x03004690
