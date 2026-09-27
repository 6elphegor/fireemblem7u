	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080985D4
sub_080985D4: @ 0x080985D4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809860C @ =sub_080985A0
	bl StartParallelWorker
	ldr r0, _08098610 @ =0x08CC4EB4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _08098614 @ =0x08CC4EBC
	ldr r1, [r1]
	bl DecodeMsgInBuffer
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	str r5, [sp]
	movs r1, #0xd
	movs r3, #1
	bl sub_080A9D1C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809860C: .4byte sub_080985A0
_08098610: .4byte 0x08CC4EB4
_08098614: .4byte 0x08CC4EBC
