	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E184
sub_0803E184: @ 0x0803E184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, _0803E20C @ =0x08B98C9C
	ldr r0, _0803E210 @ =0x0203D90C
	mov sb, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _0803E214 @ =0x0203DA78
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r0, #0x7f
	ldrb r3, [r4, #0x13]
	ands r0, r3
	bl WipeMultiArenaSaveTeam
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReadMultiArenaSaveTeam
	ldr r0, _0803E218 @ =0x081D5228
	adds r1, r4, #0
	bl SioStrCpy
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x14]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	bl DrawLinkArenaTeamName
	bl sub_0803DF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E21C
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	bl sub_0803E358
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0803E230
	.align 2, 0
_0803E20C: .4byte 0x08B98C9C
_0803E210: .4byte 0x0203D90C
_0803E214: .4byte 0x0203DA78
_0803E218: .4byte 0x081D5228
_0803E21C:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E230
	mov r2, sb
	ldrb r0, [r2]
	adds r1, r7, #0
	bl sub_0803E358
_0803E230:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl UpdateLinkArenaMenuScrollBar
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
