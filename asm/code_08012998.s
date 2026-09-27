	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_CheckForGameEnded
GC_CheckForGameEnded: @ 0x08012998
	push {lr}
	adds r2, r0, #0
	ldr r1, _080129B4 @ =0x0202BBF8
	movs r0, #0x20
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080129B0
	adds r0, r2, #0
	movs r1, #0xe
	bl Proc_Goto
_080129B0:
	pop {r0}
	bx r0
	.align 2, 0
_080129B4: .4byte 0x0202BBF8
