	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073354
sub_08073354: @ 0x08073354
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xfd
	bl PlaySeSpacial
	bl InitScanlineEffect
	bl sub_0807689C
	ldr r1, _08073420 @ =sub_08076A78
	adds r0, r1, #0
	bl SetOnHBlankA
	bl SetDefaultManimScreenConf
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073428 @ =0x02023C60
	ldr r1, _0807342C @ =0x02020140
	ldr r2, _08073430 @ =0x00004140
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #1
	ldr r3, [r7]
	bl sub_08073EF4
	ldr r1, _08073434 @ =0x08C9E98C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073420: .4byte sub_08076A78
_08073424: .4byte 0x03002870
_08073428: .4byte 0x02023C60
_0807342C: .4byte 0x02020140
_08073430: .4byte 0x00004140
_08073434: .4byte 0x08C9E98C
