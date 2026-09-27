	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMapMain
EndMapMain: @ 0x0802E3B0
	push {lr}
	movs r0, #1
	bl Proc_EndEachMarked
	ldr r0, _0802E3D0 @ =0x08B92AF8
	bl Proc_Find
	ldr r1, [r0, #0x54]
	adds r1, #0x28
	ldrb r2, [r1]
	subs r2, #1
	strb r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0802E3D0: .4byte 0x08B92AF8
