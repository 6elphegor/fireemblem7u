	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096C60
sub_08096C60: @ 0x08096C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08096C7C
	ldr r0, _08096C94 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08096C9C
_08096C7C:
	ldr r0, _08096C98 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096C8A
	b _08096DAE
_08096C8A:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08096DAE
	.align 2, 0
_08096C94: .4byte 0x02012466
_08096C98: .4byte 0x0202BBF8
_08096C9C:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _08096D7C @ =0x020117E4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_0809120C
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_08096A98
	bl InitIcons
	ldr r0, _08096D80 @ =0x02022EA4
	ldr r4, _08096D84 @ =0x02012B78
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x28
	ldr r1, _08096D88 @ =0x02023C7E
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	ldr r0, _08096D8C @ =sub_08096C54
	movs r1, #1
	adds r2, r7, #0
	bl StartParallelFiniteLoop
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r6, r6, r0
	ldrh r6, [r6]
	lsls r1, r6, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r1, _08096D90 @ =0x0203A85C
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08096D9C
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08096D94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096DAE
	ldr r0, _08096D98 @ =0x0000038B
	bl m4aSongNumStart
	b _08096DAE
	.align 2, 0
_08096D7C: .4byte 0x020117E4
_08096D80: .4byte 0x02022EA4
_08096D84: .4byte 0x02012B78
_08096D88: .4byte 0x02023C7E
_08096D8C: .4byte sub_08096C54
_08096D90: .4byte 0x0203A85C
_08096D94: .4byte 0x0202BBF8
_08096D98: .4byte 0x0000038B
_08096D9C:
	ldr r0, _08096DB8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096DAE
	ldr r0, _08096DBC @ =0x0000038A
	bl m4aSongNumStart
_08096DAE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096DB8: .4byte 0x0202BBF8
_08096DBC: .4byte 0x0000038A
