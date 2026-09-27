	.include "macro.inc"

	.syntax unified

	thumb_func_start MU_SetDefaultFacing_Auto
MU_SetDefaultFacing_Auto: @ 0x0806BFE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _0806BFF8 @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _0806BFFC
	b _0806C002
	.align 2, 0
_0806BFF8: .4byte 0x08C9D00C
_0806BFFC:
	ldr r0, [r7]
	bl sub_0806BFA4
_0806C002:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
