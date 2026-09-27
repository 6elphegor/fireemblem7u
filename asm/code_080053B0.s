	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetText
ResetText: @ 0x080053B0
	push {lr}
	ldr r0, _080053C8 @ =0x02028D58
	ldr r1, _080053CC @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r1, _080053D0 @ =0x02028D78
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080053C8: .4byte 0x02028D58
_080053CC: .4byte 0x06001000
_080053D0: .4byte 0x02028D78
