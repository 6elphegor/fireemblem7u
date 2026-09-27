	.include "macro.inc"

	.syntax unified

	thumb_func_start MultiBootWaitSendDone
MultiBootWaitSendDone: @ 0x08049A58
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _08049A8C @ =0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08049A7C
	ldr r5, _08049A90 @ =0x0000795C
	movs r4, #0x80
_08049A6C:
	adds r2, #1
	cmp r2, r5
	bgt _08049A7C
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08049A6C
_08049A7C:
	movs r0, #0x96
	lsls r0, r0, #2
	bl MultiBootWaitCycles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049A8C: .4byte 0x04000128
_08049A90: .4byte 0x0000795C
