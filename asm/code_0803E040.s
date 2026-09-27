	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawLinkArenaTeamName
DrawLinkArenaTeamName: @ 0x0803E040
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, _0803E0A8 @ =0x0203D918
	adds r0, r0, r6
	mov sb, r0
	bl ClearText
	mov r0, sb
	movs r1, #0
	bl Text_SetColor
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0803E0AC @ =0x0203DA78
	adds r4, r4, r0
	mov r0, sb
	adds r1, r4, #0
	bl Text_DrawString
	subs r6, #0xc
	add r8, r6
	ldr r1, _0803E0B0 @ =0x00000FFF
	mov r2, r8
	ldrh r2, [r2, #0xc]
	ands r1, r2
	movs r0, #0xf
	ldrb r4, [r4, #0x14]
	ands r0, r4
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, _0803E0B4 @ =0x02023476
	adds r5, r5, r0
	mov r0, sb
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E0A8: .4byte 0x0203D918
_0803E0AC: .4byte 0x0203DA78
_0803E0B0: .4byte 0x00000FFF
_0803E0B4: .4byte 0x02023476
