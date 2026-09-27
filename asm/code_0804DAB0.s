	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804DAB0
sub_0804DAB0: @ 0x0804DAB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _0804DB88 @ =0x02000000
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
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
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804DB42
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0804DB42
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DB8C @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldr r4, _0804DB90 @ =0x00000395
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r7, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804DB42
	movs r0, #1
	str r0, [r5, #0x58]
_0804DB42:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804DBEC
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804DBEC
	ldr r4, _0804DB94 @ =0x0203E05E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DB98 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DBE0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0804DB9C
	movs r0, #0
	b _0804DBB0
	.align 2, 0
_0804DB88: .4byte 0x02000000
_0804DB8C: .4byte 0x0203E0B8
_0804DB90: .4byte 0x00000395
_0804DB94: .4byte 0x0203E05E
_0804DB98: .4byte 0x02017780
_0804DB9C:
	ldr r4, _0804DBC0 @ =0x0203E09C
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0804DBB0:
	cmp r0, #1
	bne _0804DBC4
	adds r0, r6, #0
	mov r1, r8
	bl NewEfxDeadEvent
	b _0804DBE0
	.align 2, 0
_0804DBC0: .4byte 0x0203E09C
_0804DBC4:
	bl PlayDeathSoundForArena
	adds r0, r6, #0
	mov r1, r8
	bl NewEfxDead
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804DBE8 @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0804DBE0:
	adds r0, r5, #0
	bl Proc_Break
	b _0804DBF8
	.align 2, 0
_0804DBE8: .4byte 0x0203E010
_0804DBEC:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804DBF8
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804DBF8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
