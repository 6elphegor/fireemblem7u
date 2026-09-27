	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_NinianDragonTrembling
EventCall_NinianDragonTrembling: @ 0x0807D954
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	cmp r6, #0
	bne _0807D9AA
	movs r0, #0xda
	bl GetUnitFromCharId
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldr r2, _0807D9B4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	lsls r5, r5, #4
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	subs r5, r5, r0
	ldr r0, _0807D9B8 @ =0x081BE108
	ldr r1, _0807D9BC @ =0x06013000
	bl Decompress
	ldr r0, _0807D9C0 @ =0x081BE4D8
	ldr r3, _0807D9C4 @ =0x0000C180
	str r6, [sp]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartSpriteAnimProc
	ldr r0, _0807D9C8 @ =EventCall_HideNinianDragonSMS
	movs r1, #1
	bl CallDelayed
_0807D9AA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9B4: .4byte 0x0202BBB8
_0807D9B8: .4byte 0x081BE108
_0807D9BC: .4byte 0x06013000
_0807D9C0: .4byte 0x081BE4D8
_0807D9C4: .4byte 0x0000C180
_0807D9C8: .4byte EventCall_HideNinianDragonSMS
