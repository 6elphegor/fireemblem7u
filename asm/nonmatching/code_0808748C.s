	.include "macro.inc"

	.syntax unified

	thumb_func_start SetCgTextFlag
SetCgTextFlag: @ 0x0808748C
	push {r4, lr}
	ldr r4, _080874AC @ =0x0203E738
	ldr r3, [r4, #0x48]
	lsrs r2, r3, #0xa
	ldr r1, _080874B0 @ =0x003FFFFF
	ands r1, r0
	orrs r2, r1
	lsls r2, r2, #0xa
	ldr r0, _080874B4 @ =0x000003FF
	ands r0, r3
	orrs r0, r2
	str r0, [r4, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080874AC: .4byte 0x0203E738
_080874B0: .4byte 0x003FFFFF
_080874B4: .4byte 0x000003FF
