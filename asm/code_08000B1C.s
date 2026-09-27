	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBuildInfo
PutBuildInfo: @ 0x08000B1C
	sub sp, #0x10
	push {r4, lr}
	add r4, sp, #0x18
	str r4, [sp, #0xc]
	mov r4, pc
	str r4, [sp, #0x14]
	mov r4, fp
	str r4, [sp, #8]
	mov r4, lr
	str r4, [sp, #0x10]
	add r4, sp, #0x14
	mov fp, r4
	adds r4, r0, #0
	ldr r1, _08000B50 @ =0x080C57E0
	bl DebugPutStr
	subs r4, #0x40
	ldr r1, _08000B54 @ =0x080C57FC
	adds r0, r4, #0
	bl DebugPutStr
	pop {r4}
	pop {r0, r1, r2}
	mov fp, r1
	mov sp, r2
	bx r0
	.align 2, 0
_08000B50: .4byte 0x080C57E0
_08000B54: .4byte 0x080C57FC
