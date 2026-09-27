	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021E88
sub_08021E88: @ 0x08021E88
	push {r4, lr}
	ldr r2, _08021EB0 @ =0x0203A85C
	movs r0, #0x1a
	strb r0, [r2, #0x11]
	ldr r0, _08021EB4 @ =0x03004690
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_0802B678
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08021EB0: .4byte 0x0203A85C
_08021EB4: .4byte 0x03004690
