	.include "macro.inc"

	.syntax unified

	thumb_func_start EndActiveClassReelSpell
EndActiveClassReelSpell: @ 0x08063FF4
	push {r4, lr}
	ldr r4, _0806400C @ =0x0203E0F4
	ldr r0, [r4]
	cmp r0, #0
	beq _08064006
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08064006:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806400C: .4byte 0x0203E0F4
