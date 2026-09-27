	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryDoStealAdjacent
AiTryDoStealAdjacent: @ 0x08039EFC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08039F50 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08039F4C
	ldr r4, _08039F54 @ =0x0202E3E4
	ldr r0, [r4]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl MapAddInRange
	bl AiAttemptStealActionWithinMovement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _08039F58
_08039F4C:
	movs r0, #0
	b _08039F5A
	.align 2, 0
_08039F50: .4byte 0x03004690
_08039F54: .4byte 0x0202E3E4
_08039F58:
	movs r0, #1
_08039F5A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
