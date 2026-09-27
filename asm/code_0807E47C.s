	.include "macro.inc"

	.syntax unified

	thumb_func_start EventDragonsSpritefx_End
EventDragonsSpritefx_End: @ 0x0807E47C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r4, #0x2c
	movs r5, #2
_0807E484:
	ldr r0, [r4]
	cmp r0, #0
	beq _0807E48E
	bl EndSpriteAnimProc
_0807E48E:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807E484
	pop {r4, r5}
	pop {r0}
	bx r0
