	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BAA38
sub_080BAA38: @ 0x080BAA38
	push {r4, r5, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	adds r4, #0x30
	movs r5, #5
_080BAA44:
	ldr r0, [r4]
	cmp r0, #0
	beq _080BAA4E
	bl EndSpriteAnimProc
_080BAA4E:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080BAA44
	bl EndEachSpriteAnimProc
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
