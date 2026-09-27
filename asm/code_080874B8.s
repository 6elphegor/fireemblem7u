	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearCgTextFlag
ClearCgTextFlag: @ 0x080874B8
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _080874D4 @ =0x003FFFFF
	eors r0, r4
	ands r0, r1
	bl SetCgTextFlags
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080874D4: .4byte 0x003FFFFF
