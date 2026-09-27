	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098DCC
sub_08098DCC: @ 0x08098DCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _08098E14 @ =sub_0809871C
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl SetUiCursorHandConfig
	ldrb r5, [r5]
	lsls r0, r5, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
	movs r0, #1
	adds r1, r4, #0
	bl sub_080985D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098E14: .4byte sub_0809871C
