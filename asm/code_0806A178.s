	.include "macro.inc"

	.syntax unified

	thumb_func_start PutEkrLvupStatGainLabelGfx1
PutEkrLvupStatGainLabelGfx1: @ 0x0806A178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _0806A1D4 @ =0x081E5FD0
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _0806A190
	rsbs r0, r4, #0
_0806A190:
	ldr r5, _0806A1D8 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _0806A1DC @ =0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	adds r0, r4, #0
	cmp r0, #0
	bge _0806A1B2
	rsbs r0, r0, #0
_0806A1B2:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1D4: .4byte 0x081E5FD0
_0806A1D8: .4byte 0x000003FF
_0806A1DC: .4byte 0x06010000
