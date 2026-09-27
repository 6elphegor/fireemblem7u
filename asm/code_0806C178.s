	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMuScripted
StartMuScripted: @ 0x0806C178
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	adds r2, r7, #2
	ldrh r1, [r2]
	adds r3, r7, #4
	ldrh r2, [r3]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl StartMuInternal
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C1B6
	movs r0, #0
	b _0806C1C6
_0806C1B6:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl SetMuMoveScript
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C1C6
_0806C1C6:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0
