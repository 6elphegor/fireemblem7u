	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037380
sub_08037380: @ 0x08037380
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r0, #0
	mov sb, r0
	ldr r0, _08037434 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803742A
_0803739C:
	ldr r0, _08037434 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _08037424
	lsls r7, r6, #2
_080373AE:
	ldr r0, _08037438 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803741E
	ldr r0, _0803743C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803741E
	ldr r0, _08037440 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _080373EA
	ldr r0, _08037444 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803741E
_080373EA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _08037448 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r1, _0803744C @ =0x7FFFFFFF
	adds r4, r4, r1
	cmp sb, r4
	bhs _0803741E
	mov r0, r8
	strh r5, [r0]
	strh r6, [r0, #2]
	mov sb, r4
_0803741E:
	subs r5, #1
	cmp r5, #0
	bge _080373AE
_08037424:
	mov r6, sl
	cmp r6, #0
	bge _0803739C
_0803742A:
	mov r1, sb
	cmp r1, #0
	bne _08037450
	movs r0, #0
	b _08037452
	.align 2, 0
_08037434: .4byte 0x0202E3D8
_08037438: .4byte 0x0202E3E4
_0803743C: .4byte 0x0202E3E8
_08037440: .4byte 0x0202E3DC
_08037444: .4byte 0x0202BD48
_08037448: .4byte 0x0202E3F4
_0803744C: .4byte 0x7FFFFFFF
_08037450:
	movs r0, #1
_08037452:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
