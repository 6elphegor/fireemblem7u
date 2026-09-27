	.include "macro.inc"

	.syntax unified

	thumb_func_start MusicFi_OnLoop
MusicFi_OnLoop: @ 0x080038CC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, _0800396C @ =0x03005B10
	ldr r1, _08003970 @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003974 @ =0x03005D20
	ldr r1, _08003970 @ =0x0000FFFF
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4c
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08003962
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08003978 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_08003962:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800396C: .4byte 0x03005B10
_08003970: .4byte 0x0000FFFF
_08003974: .4byte 0x03005D20
_08003978: .4byte 0x03000038
