	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C7A4
sub_0806C7A4: @ 0x0806C7A4
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806C7BC @ =0x08C9CEA0
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806C7BA
	movs r0, #1
_0806C7BA:
	b _0806C7C0
	.align 2, 0
_0806C7BC: .4byte 0x08C9CEA0
_0806C7C0:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
