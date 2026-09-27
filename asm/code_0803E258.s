	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E258
sub_0803E258: @ 0x0803E258
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r6, [r0, #0x40]
	adds r0, #0x53
	ldrb r7, [r0]
	ldr r2, _0803E2C4 @ =0x0203DA78
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0x7f
	adds r0, r1, #0
	ldrb r3, [r5, #0x13]
	ands r0, r3
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r2
	ldrb r2, [r4, #0x13]
	ands r1, r2
	bl sub_080A1D90
	ldrb r1, [r5, #0x14]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0x14]
	strb r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r7
	adds r0, #1
	bl GetUnit
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r5, #0
	bl sub_080A1E8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E2CC
	ldr r0, _0803E2C8 @ =0x081D5228
	adds r1, r5, #0
	bl SioStrCpy
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r1, r3, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r5, #0x13]
	b _0803E2CE
	.align 2, 0
_0803E2C4: .4byte 0x0203DA78
_0803E2C8: .4byte 0x081D5228
_0803E2CC:
	strb r7, [r5, #0x13]
_0803E2CE:
	lsls r0, r6, #2
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r3, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0803E30C @ =0x0203DA78
	adds r4, r0, r1
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r4, #0
	bl sub_080A1E8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E314
	ldr r0, _0803E310 @ =0x081D5228
	adds r1, r4, #0
	bl SioStrCpy
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0x13]
	b _0803E316
	.align 2, 0
_0803E30C: .4byte 0x0203DA78
_0803E310: .4byte 0x081D5228
_0803E314:
	strb r6, [r4, #0x13]
_0803E316:
	adds r0, r6, #0
	bl DrawLinkArenaTeamName
	adds r0, r7, #0
	bl DrawLinkArenaTeamName
	mov r1, r8
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08048C50
	mov r2, r8
	ldr r0, [r2, #0x30]
	bl Proc_End
	mov r1, r8
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
