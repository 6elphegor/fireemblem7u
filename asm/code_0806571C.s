	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonTunkFace_Loop
EkrDragonTunkFace_Loop: @ 0x0806571C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x3a]
	strh r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065740
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08065740:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
