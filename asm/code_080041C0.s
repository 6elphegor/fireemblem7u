	.include "macro.inc"

	.syntax unified

	thumb_func_start MusicProc4Exists
MusicProc4Exists: @ 0x080041C0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080041D4 @ =0x08B85864
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _080041D8
	movs r0, #1
	b _080041DC
	.align 2, 0
_080041D4: .4byte 0x08B85864
_080041D8:
	movs r0, #0
	b _080041DC
_080041DC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
