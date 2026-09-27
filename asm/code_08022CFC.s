	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022CFC
sub_08022CFC: @ 0x08022CFC
	push {r4, lr}
	ldr r4, _08022D18 @ =0x0203A85C
	movs r0, #0x12
	strb r0, [r4, #0x11]
	ldr r0, _08022D1C @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022D18: .4byte 0x0203A85C
_08022D1C: .4byte 0x03004690
