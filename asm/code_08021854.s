	.include "macro.inc"

	.syntax unified

	thumb_func_start DropEffect
DropEffect: @ 0x08021854
	push {lr}
	ldr r0, _0802186C @ =0x03004690
	ldr r0, [r0]
	bl MakeDropTargetList
	ldr r0, _08021870 @ =0x08B95CF8
	bl StartMapSelect
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0802186C: .4byte 0x03004690
_08021870: .4byte 0x08B95CF8
