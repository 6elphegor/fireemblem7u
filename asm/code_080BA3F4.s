	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetTitleBgAffin
ResetTitleBgAffin: @ 0x080BA3F4
	push {lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, sp
	strh r3, [r1, #8]
	strh r3, [r1, #0xa]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r1, #0xc]
	strh r2, [r1, #0xe]
	strh r3, [r1, #0x10]
	ldr r1, _080BA428 @ =0x030028C8
	cmp r0, #2
	bne _080BA41A
	subs r1, #0x10
_080BA41A:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080BA428: .4byte 0x030028C8
