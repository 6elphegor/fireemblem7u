	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMapMain
StartMapMain: @ 0x0802E37C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802E3A8 @ =0x08B92AF8
	movs r1, #2
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x54]
	adds r4, #0x28
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl StartBmVSync
	ldr r0, _0802E3AC @ =0x08B961A8
	movs r1, #4
	bl Proc_Start
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802E3A8: .4byte 0x08B92AF8
_0802E3AC: .4byte 0x08B961A8
