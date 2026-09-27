	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080218E0
sub_080218E0: @ 0x080218E0
	push {lr}
	ldr r0, _080218F8 @ =0x03004690
	ldr r0, [r0]
	bl MakeTakeTargetList
	ldr r0, _080218FC @ =0x08B95CD8
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080218F8: .4byte 0x03004690
_080218FC: .4byte 0x08B95CD8
