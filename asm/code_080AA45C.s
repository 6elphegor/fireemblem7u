	.include "macro.inc"

	.syntax unified

	thumb_func_start WipeAllPalette
WipeAllPalette: @ 0x080AA45C
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080AA478 @ =0x02022860
	ldr r2, _080AA47C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AA478: .4byte 0x02022860
_080AA47C: .4byte 0x01000100
