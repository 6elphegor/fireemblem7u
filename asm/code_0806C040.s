	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C040
sub_0806C040: @ 0x0806C040
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806C058 @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806C056
	movs r0, #1
_0806C056:
	b _0806C05C
	.align 2, 0
_0806C058: .4byte 0x08C9D00C
_0806C05C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
