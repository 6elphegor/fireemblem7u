	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawLinkArenaRankings
DrawLinkArenaRankings: @ 0x08041880
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08041914 @ =0x0203DB6C
	ldr r1, _08041918 @ =0x02023464
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x24
	add r1, sl
	mov sb, r1
	mov r8, r0
_0804189E:
	lsls r5, r6, #3
	ldr r0, _0804191C @ =0x0203DA10
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl DrawLinkArenaRankingRow
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl DrawLinkArenaRankIcon
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	ldrb r0, [r7]
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, sb
	bl DrawLinkArenaModeIcon
	adds r7, #0x10
	movs r1, #0x80
	add sb, r1
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	cmp r6, #9
	ble _0804189E
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041914: .4byte 0x0203DB6C
_08041918: .4byte 0x02023464
_0804191C: .4byte 0x0203DA10
