	.include "macro.inc"

	.syntax unified

	thumb_func_start EndActiveClassReelBgColorProc
EndActiveClassReelBgColorProc: @ 0x08064010
	push {r4, lr}
	ldr r4, _08064028 @ =0x0203E0F8
	ldr r0, [r4]
	cmp r0, #0
	beq _08064022
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08064022:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064028: .4byte 0x0203E0F8
