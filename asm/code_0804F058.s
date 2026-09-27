	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxFlashBgBlack
NewEfxFlashBgBlack: @ 0x0804F058
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F084 @ =0x08B9AE4C
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [sp]
	ldr r1, _0804F088 @ =0x020165C8
	ldr r2, _0804F08C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F084: .4byte 0x08B9AE4C
_0804F088: .4byte 0x020165C8
_0804F08C: .4byte 0x01000100
