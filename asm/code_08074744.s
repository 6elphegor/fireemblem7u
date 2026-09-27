	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08074744
sub_08074744: @ 0x08074744
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0807488C @ =0x083F373C
	str r0, [r7, #0x18]
	ldr r1, _08074890 @ =0x08C9DE2C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0xc]
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08074894 @ =0x083EBE54
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x14]
	ldrh r3, [r1, #0x2c]
	movs r4, #0xf
	adds r1, r3, #0
	ands r1, r4
	adds r4, r1, #0
	lsls r3, r4, #0x10
	lsrs r1, r3, #0x10
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0xc]
	adds r1, r1, r3
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	movs r1, #5
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _08074894 @ =0x083EBE54
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x10]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #3
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _08074894 @ =0x083EBE54
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0xc]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #8]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074898 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074898 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807488C: .4byte 0x083F373C
_08074890: .4byte 0x08C9DE2C
_08074894: .4byte 0x083EBE54
_08074898: .4byte 0x06010000
