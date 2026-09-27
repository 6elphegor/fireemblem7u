	.include "macro.inc"

	.syntax unified

	thumb_func_start HBlank_Scanline_8078098
HBlank_Scanline_8078098: @ 0x080778C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077904 @ =0x04000006
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080778E8
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
_080778E8:
	ldr r0, _08077908 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807790C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077904: .4byte 0x04000006
_08077908: .4byte 0x0400001A
_0807790C: .4byte 0x0203E668
