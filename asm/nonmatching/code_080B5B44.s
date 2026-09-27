	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5B44
sub_080B5B44: @ 0x080B5B44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _080B5B64 @ =0x08CE77F0
	ldr r0, _080B5B68 @ =0x08CE76E8
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r4, #0
	bl Proc_Start
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B64: .4byte 0x08CE77F0
_080B5B68: .4byte 0x08CE76E8
