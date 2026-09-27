	.include "macro.inc"

	.syntax unified

	thumb_func_start CgTextExists
CgTextExists: @ 0x08087D58
	push {lr}
	ldr r0, _08087D68 @ =0x08CC306C
	bl Proc_Find
	cmp r0, #0
	bne _08087D6C
	movs r0, #0
	b _08087D6E
	.align 2, 0
_08087D68: .4byte 0x08CC306C
_08087D6C:
	movs r0, #1
_08087D6E:
	pop {r1}
	bx r1
	.align 2, 0
