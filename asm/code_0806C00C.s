	.include "macro.inc"

	.syntax unified

	thumb_func_start SetAutoMuMoveScript
SetAutoMuMoveScript: @ 0x0806C00C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806C028 @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806C02C
	b _0806C036
	.align 2, 0
_0806C028: .4byte 0x08C9D00C
_0806C02C:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	ldr r1, [r7]
	bl SetMuMoveScript
_0806C036:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
