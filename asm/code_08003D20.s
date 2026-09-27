	.include "macro.inc"

	.syntax unified

	thumb_func_start MusicVc_OnLoop
MusicVc_OnLoop: @ 0x08003D20
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x64
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r2, [r3, r5]
	ldr r0, [r7]
	adds r3, r0, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r0]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	ldr r4, [r7]
	adds r0, r4, #0
	adds r4, #0x6a
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetBgmVolume
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x68
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003DFC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bne _08003DDC
	bl GetCurrentBgmSong
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	bl m4aSongNumStop
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08003DD8 @ =0x02024E1C
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	b _08003DF0
	.align 2, 0
_08003DD8: .4byte 0x02024E1C
_08003DDC:
	ldr r0, _08003E04 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
_08003DF0:
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08003E08 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_08003DFC:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003E04: .4byte 0x02024E1C
_08003E08: .4byte 0x0300003C
