	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095C28
sub_08095C28: @ 0x08095C28
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08095C60 @ =sub_08095BF4
	bl StartParallelWorker
	ldr r0, _08095C64 @ =0x08CC4B7C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _08095C68 @ =0x08CC4B88
	ldr r1, [r1]
	bl DecodeMsgInBuffer
	adds r2, r0, #0
	movs r0, #0xf0
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
_08095C60: .4byte sub_08095BF4
_08095C64: .4byte 0x08CC4B7C
_08095C68: .4byte 0x08CC4B88
