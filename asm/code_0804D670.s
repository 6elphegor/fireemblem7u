	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804D670
sub_0804D670: @ 0x0804D670
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _0804D714 @ =0x02000000
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804D6D2
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0804D6D2
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D718 @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804D6D2
	movs r0, #1
	str r0, [r5, #0x58]
_0804D6D2:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804D774
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804D774
	ldr r4, _0804D71C @ =0x0203E05E
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D720 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _0804D768
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0804D724
	movs r0, #0
	b _0804D738
	.align 2, 0
_0804D714: .4byte 0x02000000
_0804D718: .4byte 0x0203E0B8
_0804D71C: .4byte 0x0203E05E
_0804D720: .4byte 0x02017780
_0804D724:
	ldr r4, _0804D748 @ =0x0203E09C
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0804D738:
	cmp r0, #1
	bne _0804D74C
	adds r0, r6, #0
	adds r1, r7, #0
	bl NewEfxDeadEvent
	b _0804D768
	.align 2, 0
_0804D748: .4byte 0x0203E09C
_0804D74C:
	bl PlayDeathSoundForArena
	adds r0, r6, #0
	adds r1, r7, #0
	bl NewEfxDead
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D770 @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0804D768:
	adds r0, r5, #0
	bl Proc_Break
	b _0804D780
	.align 2, 0
_0804D770: .4byte 0x0203E010
_0804D774:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804D780
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804D780:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
