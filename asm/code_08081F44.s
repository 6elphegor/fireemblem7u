	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxLockHelper_Loop
HelpBoxLockHelper_Loop: @ 0x08081F44
	push {lr}
	adds r2, r0, #0
	ldr r0, _08081F64 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081F5E
	adds r0, r2, #0
	bl Proc_Break
_08081F5E:
	pop {r0}
	bx r0
	.align 2, 0
_08081F64: .4byte 0x08B857F8
