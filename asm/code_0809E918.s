	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSaveReadAddr
GetSaveReadAddr: @ 0x0809E918
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	mov r0, sp
	bl ReadSaveBlockInfo
	mov r0, sp
	ldrh r0, [r0, #8]
	bl SramOffsetToAddr
	add sp, #0x10
	pop {r1}
	bx r1
	.align 2, 0
