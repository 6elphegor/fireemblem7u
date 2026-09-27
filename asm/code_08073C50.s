	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073C50
sub_08073C50: @ 0x08073C50
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_080769CC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08073CFA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08073D04 @ =0x083ECCFC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08073D08 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _08073D04 @ =0x083ECCFC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08073D08 @ =0x000041C0
	movs r4, #1
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_08073CFA:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D04: .4byte 0x083ECCFC
_08073D08: .4byte 0x000041C0
