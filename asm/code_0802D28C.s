	.include "macro.inc"

	.syntax unified

	thumb_func_start BmVSync_TsImgAnim
BmVSync_TsImgAnim: @ 0x0802D28C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0802D2CA
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802D2A6
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _0802D2CA
_0802D2A6:
	ldr r2, [r4, #0x30]
	ldrh r0, [r2]
	strh r0, [r4, #0x34]
	ldr r0, [r2, #4]
	ldr r1, _0802D2D0 @ =0x0600A000
	ldrh r2, [r2, #2]
	lsrs r2, r2, #2
	bl CpuFastSet
	ldr r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _0802D2CA
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x30]
_0802D2CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D2D0: .4byte 0x0600A000
