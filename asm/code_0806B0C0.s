	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeBattlePopupTileMapFromTSA
MakeBattlePopupTileMapFromTSA: @ 0x0806B0C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r6, _0806B1A0 @ =0x02019784
	ldrh r1, [r6]
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r1, r2
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x40
	ldrh r7, [r6, #0x30]
	adds r0, r7, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r6, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r6, #0
	adds r0, #0x90
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r1]
	movs r0, #0
	mov r8, r0
	cmp r8, sb
	bhs _0806B154
	adds r3, #0xc2
	str r3, [sp]
	mov r5, ip
	adds r5, #0x82
	adds r4, r6, #0
	adds r4, #0x62
	subs r3, #0x80
	mov r2, ip
	adds r2, #2
	adds r1, r6, #2
_0806B120:
	ldrh r7, [r1]
	movs r0, #0x88
	lsls r0, r0, #5
	adds r7, r7, r0
	strh r7, [r2]
	ldrh r7, [r1, #0x30]
	adds r7, r7, r0
	strh r7, [r3]
	ldrh r7, [r4]
	adds r7, r7, r0
	strh r7, [r5]
	ldrh r7, [r4, #0x30]
	adds r7, r7, r0
	ldr r0, [sp]
	strh r7, [r0]
	adds r0, #2
	str r0, [sp]
	adds r5, #2
	adds r4, #2
	adds r3, #2
	adds r2, #2
	adds r1, #2
	movs r7, #1
	add r8, r7
	cmp r8, sb
	blo _0806B120
_0806B154:
	mov r1, r8
	lsls r0, r1, #1
	mov r2, ip
	adds r1, r0, r2
	ldrh r3, [r6, #0x2e]
	movs r7, #0x88
	lsls r7, r7, #5
	adds r0, r3, r7
	strh r0, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x42
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	adds r3, r7, #0
	adds r0, r0, r3
	strh r0, [r2]
	adds r2, #0x40
	adds r0, r6, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r2]
	adds r1, #0xc2
	adds r0, r6, #0
	adds r0, #0xbe
	ldrh r0, [r0]
	adds r0, r0, r3
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1A0: .4byte 0x02019784
