	.include "macro.inc"

	.syntax unified

	thumb_func_start Proc_Find
Proc_Find: @ 0x080046A8
	adds r3, r0, #0
	ldr r1, _080046B8 @ =0x02024E28
	movs r2, #0
_080046AE:
	ldr r0, [r1]
	cmp r0, r3
	bne _080046BC
	adds r0, r1, #0
	b _080046C6
	.align 2, 0
_080046B8: .4byte 0x02024E28
_080046BC:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080046AE
	movs r0, #0
_080046C6:
	bx lr

	thumb_func_start Proc_FindNonBlocked
Proc_FindNonBlocked: @ 0x080046C8
	adds r3, r0, #0
	ldr r1, _080046E4 @ =0x02024E28
	movs r2, #0
_080046CE:
	ldr r0, [r1]
	cmp r0, r3
	bne _080046E8
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _080046E8
	adds r0, r1, #0
	b _080046F2
	.align 2, 0
_080046E4: .4byte 0x02024E28
_080046E8:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080046CE
	movs r0, #0
_080046F2:
	bx lr

	thumb_func_start sub_080046F4
sub_080046F4: @ 0x080046F4
	adds r3, r0, #0
	ldr r1, _08004710 @ =0x02024E28
	movs r2, #0
_080046FA:
	ldr r0, [r1]
	cmp r0, #0
	beq _08004714
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r3
	bne _08004714
	adds r0, r1, #0
	b _0800471E
	.align 2, 0
_08004710: .4byte 0x02024E28
_08004714:
	adds r2, #1
	adds r1, #0x6c
	cmp r2, #0x3f
	ble _080046FA
	movs r0, #0
_0800471E:
	bx lr

	thumb_func_start Proc_Goto
Proc_Goto: @ 0x08004720
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	ldr r2, [r1]
	ldrh r3, [r2]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	beq _08004752
	movs r5, #0
_08004734:
	cmp r3, #0xb
	bne _08004746
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _08004746
	str r2, [r1, #4]
	str r5, [r1, #0xc]
	b _08004752
_08004746:
	adds r2, #8
	ldrh r3, [r2]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bne _08004734
_08004752:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Proc_GotoScript
Proc_GotoScript: @ 0x08004758
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start Proc_Mark
Proc_Mark: @ 0x08004760
	adds r0, #0x26
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start Proc_SetEndCb
Proc_SetEndCb: @ 0x08004768
	str r1, [r0, #8]
	bx lr

	thumb_func_start Proc_ForAll
Proc_ForAll: @ 0x0800476C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08004790 @ =0x02024E28
	movs r5, #0x3f
_08004774:
	ldr r0, [r4]
	cmp r0, #0
	beq _08004780
	adds r0, r4, #0
	bl _call_via_r6
_08004780:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _08004774
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004790: .4byte 0x02024E28

	thumb_func_start Proc_ForEach
Proc_ForEach: @ 0x08004794
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _080047B8 @ =0x02024E28
	movs r5, #0x3f
_0800479E:
	ldr r0, [r4]
	cmp r0, r7
	bne _080047AA
	adds r0, r4, #0
	bl _call_via_r6
_080047AA:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _0800479E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080047B8: .4byte 0x02024E28

	thumb_func_start Proc_ForEachMarked
Proc_ForEachMarked: @ 0x080047BC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _080047E4 @ =0x02024E28
	movs r5, #0x3f
_080047C6:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r7
	bne _080047D6
	adds r0, r4, #0
	bl _call_via_r6
_080047D6:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _080047C6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080047E4: .4byte 0x02024E28

	thumb_func_start Proc_LockEachMarked
Proc_LockEachMarked: @ 0x080047E8
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _08004808 @ =0x02024E28
	adds r1, r0, #0
	adds r1, #0x26
_080047F2:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080047FE
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
_080047FE:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _080047F2
	bx lr
	.align 2, 0
_08004808: .4byte 0x02024E28

	thumb_func_start Proc_UnblockEachMarked
Proc_UnblockEachMarked: @ 0x0800480C
	adds r3, r0, #0
	movs r2, #0x3f
	ldr r0, _08004830 @ =0x02024E28
	adds r1, r0, #0
	adds r1, #0x26
_08004816:
	ldrb r0, [r1]
	cmp r0, r3
	bne _08004826
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08004826
	subs r0, #1
	strb r0, [r1, #2]
_08004826:
	subs r2, #1
	adds r1, #0x6c
	cmp r2, #0
	bge _08004816
	bx lr
	.align 2, 0
_08004830: .4byte 0x02024E28

	thumb_func_start Proc_EndEachMarked
Proc_EndEachMarked: @ 0x08004834
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0800485C @ =0x02024E28
	movs r5, #0x3f
_0800483C:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, r6
	bne _0800484C
	adds r0, r4, #0
	bl Proc_End
_0800484C:
	subs r5, #1
	adds r4, #0x6c
	cmp r5, #0
	bge _0800483C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800485C: .4byte 0x02024E28

	thumb_func_start EndProc
EndProc: @ 0x08004860
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Proc_EndEach
Proc_EndEach: @ 0x0800486C
	push {lr}
	ldr r1, _08004878 @ =EndProc
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_08004878: .4byte EndProc

	thumb_func_start ClearNativeCallback
ClearNativeCallback: @ 0x0800487C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Proc_BreakEach
Proc_BreakEach: @ 0x08004888
	push {lr}
	ldr r1, _08004894 @ =ClearNativeCallback
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_08004894: .4byte ClearNativeCallback

	thumb_func_start ForAllFollowingProcs
ForAllFollowingProcs: @ 0x08004898
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _080048A8
	bl ForAllFollowingProcs
_080048A8:
	adds r0, r4, #0
	bl _call_via_r5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080048BA
	adds r1, r5, #0
	bl ForAllFollowingProcs
_080048BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080048C0
sub_080048C0: @ 0x080048C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl _call_via_r5
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _080048D6
	adds r1, r5, #0
	bl ForAllFollowingProcs
_080048D6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080048DC
sub_080048DC: @ 0x080048DC
	push {lr}
	bl Proc_End
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_SET_NAME
ProcCmd_SET_NAME: @ 0x080048E8
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0x10]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start ProcCmd_CALL_ROUTINE
ProcCmd_CALL_ROUTINE: @ 0x080048F8
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl _call_via_r2
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_CALL_ROUTINE_2
ProcCmd_CALL_ROUTINE_2: @ 0x0800490C
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl _call_via_r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProcCmd_CALL_ROUTINE_ARG
ProcCmd_CALL_ROUTINE_ARG: @ 0x08004924
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #4]
	ldrh r0, [r2, #2]
	ldr r3, [r2, #4]
	adds r2, #8
	str r2, [r1, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl _call_via_r3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProcCmd_WHILE_ROUTINE
ProcCmd_WHILE_ROUTINE: @ 0x08004944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, #8
	str r0, [r4, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08004962
	movs r0, #1
	b _0800496A
_08004962:
	ldr r0, [r4, #4]
	subs r0, #8
	str r0, [r4, #4]
	movs r0, #0
_0800496A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_LOOP_ROUTINE
ProcCmd_LOOP_ROUTINE: @ 0x08004970
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #0xc]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start ProcCmd_SET_DESTRUCTOR
ProcCmd_SET_DESTRUCTOR: @ 0x08004980
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl Proc_SetEndCb
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_NEW_CHILD
ProcCmd_NEW_CHILD: @ 0x0800499C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl SpawnProc
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_NEW_CHILD_BLOCKING
ProcCmd_NEW_CHILD_BLOCKING: @ 0x080049B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl SpawnProcLocking
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_NEW_MAIN_BUGGED
ProcCmd_NEW_MAIN_BUGGED: @ 0x080049D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl SpawnProc
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProcCmd_WHILE_EXISTS
ProcCmd_WHILE_EXISTS: @ 0x080049F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _08004A12
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	b _08004A14
_08004A12:
	movs r0, #0
_08004A14:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004A1C
sub_08004A1C: @ 0x08004A1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Proc_EndEach
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004A38
sub_08004A38: @ 0x08004A38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Proc_BreakEach
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08004A54
sub_08004A54: @ 0x08004A54
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start ProcCmd_JUMP
ProcCmd_JUMP: @ 0x08004A60
	push {lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	bl Proc_GotoScript
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start ProcCmd_GOTO
ProcCmd_GOTO: @ 0x08004A70
	push {lr}
	ldr r1, [r0, #4]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UpdateSleep
UpdateSleep: @ 0x08004A84
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x24]
	subs r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08004A9A
	adds r0, r1, #0
	bl Proc_Break
_08004A9A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08004AA0
sub_08004AA0: @ 0x08004AA0
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08004AB4
	strh r2, [r1, #0x24]
	ldr r0, _08004AC0 @ =UpdateSleep
	str r0, [r1, #0xc]
_08004AB4:
	ldr r0, [r1, #4]
	adds r0, #8
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0
_08004AC0: .4byte UpdateSleep

	thumb_func_start ProcCmd_SET_MARK
ProcCmd_SET_MARK: @ 0x08004AC4
	ldr r1, [r0, #4]
	ldrh r1, [r1, #2]
	adds r2, r0, #0
	adds r2, #0x26
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr

	thumb_func_start sub_08004AD8
sub_08004AD8: @ 0x08004AD8
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_08004AE4
sub_08004AE4: @ 0x08004AE4
	movs r0, #0
	bx lr

	thumb_func_start ProcCmd_END_IF_DUPLICATE
ProcCmd_END_IF_DUPLICATE: @ 0x08004AE8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08004B14 @ =0x02024E28
	movs r4, #0
	ldr r5, [r3]
	movs r1, #0x3f
_08004AF4:
	ldr r0, [r2]
	cmp r0, r5
	bne _08004AFC
	adds r4, #1
_08004AFC:
	subs r1, #1
	adds r2, #0x6c
	cmp r1, #0
	bge _08004AF4
	cmp r4, #1
	bgt _08004B18
	ldr r0, [r3, #4]
	adds r0, #8
	str r0, [r3, #4]
	movs r0, #1
	b _08004B20
	.align 2, 0
_08004B14: .4byte 0x02024E28
_08004B18:
	adds r0, r3, #0
	bl Proc_End
	movs r0, #0
_08004B20:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProcCmd_END_DUPLICATES
ProcCmd_END_DUPLICATES: @ 0x08004B28
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08004B34 @ =0x02024E28
	movs r3, #0
	b _08004B3C
	.align 2, 0
_08004B34: .4byte 0x02024E28
_08004B38:
	adds r3, #1
	adds r2, #0x6c
_08004B3C:
	cmp r3, #0x3f
	bgt _08004B52
	cmp r2, r4
	beq _08004B38
	ldr r1, [r2]
	ldr r0, [r4]
	cmp r1, r0
	bne _08004B38
	adds r0, r2, #0
	bl Proc_End
_08004B52:
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08004B60
sub_08004B60: @ 0x08004B60
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_08004B6C
sub_08004B6C: @ 0x08004B6C
	adds r2, r0, #0
	adds r2, #0x27
	movs r1, #4
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start RunProcessScript
RunProcessScript: @ 0x08004B84
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08004BC6
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08004BC6
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _08004BC6
	ldr r5, _08004BA4 @ =0x08B858A4
	b _08004BAE
	.align 2, 0
_08004BA4: .4byte 0x08B858A4
_08004BA8:
	ldr r0, [r4]
	cmp r0, #0
	beq _08004BC6
_08004BAE:
	ldr r0, [r4, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08004BA8
_08004BC6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start nullsub_2
nullsub_2: @ 0x08004BCC
	bx lr
	.align 2, 0

	thumb_func_start PrintProcessNameRecursive
PrintProcessNameRecursive: @ 0x08004BD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _08004BE0
	bl PrintProcessNameRecursive
_08004BE0:
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08004C00
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	adds r0, r1, #0
	adds r1, r5, #0
	bl PrintProcessNameRecursive
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
_08004C00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrintProcessTree
PrintProcessTree: @ 0x08004C08
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	bl nullsub_2
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _08004C32
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sp
	bl PrintProcessNameRecursive
	ldr r0, [sp]
	subs r0, #2
	str r0, [sp]
_08004C32:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_22
nullsub_22: @ 0x08004C3C
	bx lr
	.align 2, 0

	thumb_func_start Proc_SetRepeatCb
Proc_SetRepeatCb: @ 0x08004C40
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start Proc_BlockSemaphore
Proc_BlockSemaphore: @ 0x08004C44
	adds r0, #0x28
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start Proc_WakeSemaphore
Proc_WakeSemaphore: @ 0x08004C50
	adds r0, #0x28
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start Proc_FindAfter
Proc_FindAfter: @ 0x08004C5C
	adds r3, r0, #0
	cmp r1, #0
	bne _08004C70
	ldr r1, _08004C68 @ =0x02024E28
	b _08004C72
	.align 2, 0
_08004C68: .4byte 0x02024E28
_08004C6C:
	adds r0, r1, #0
	b _08004C88
_08004C70:
	adds r1, #0x6c
_08004C72:
	ldr r0, _08004C8C @ =0x02026928
	cmp r1, r0
	bhs _08004C86
	adds r2, r0, #0
_08004C7A:
	ldr r0, [r1]
	cmp r0, r3
	beq _08004C6C
	adds r1, #0x6c
	cmp r1, r2
	blo _08004C7A
_08004C86:
	movs r0, #0
_08004C88:
	bx lr
	.align 2, 0
_08004C8C: .4byte 0x02026928

	thumb_func_start Proc_FindAfterWithParent
Proc_FindAfterWithParent: @ 0x08004C90
	adds r2, r0, #0
	cmp r2, #0
	bne _08004CA4
	ldr r2, _08004C9C @ =0x02024E28
	b _08004CA6
	.align 2, 0
_08004C9C: .4byte 0x02024E28
_08004CA0:
	adds r0, r2, #0
	b _08004CBC
_08004CA4:
	adds r2, #0x6c
_08004CA6:
	ldr r0, _08004CC0 @ =0x02026928
	cmp r2, r0
	bhs _08004CBA
	adds r3, r0, #0
_08004CAE:
	ldr r0, [r2, #0x14]
	cmp r0, r1
	beq _08004CA0
	adds r2, #0x6c
	cmp r2, r3
	blo _08004CAE
_08004CBA:
	movs r0, #0
_08004CBC:
	bx lr
	.align 2, 0
_08004CC0: .4byte 0x02026928

	thumb_func_start sub_08004CC4
sub_08004CC4: @ 0x08004CC4
	movs r2, #0x40
	ldr r1, _08004CE0 @ =0x02024E28
	ldr r0, _08004CE4 @ =0x00001A94
	adds r3, r1, r0
_08004CCC:
	ldr r0, [r1]
	cmp r0, #0
	beq _08004CD4
	subs r2, #1
_08004CD4:
	adds r1, #0x6c
	cmp r1, r3
	ble _08004CCC
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08004CE0: .4byte 0x02024E28
_08004CE4: .4byte 0x00001A94

	thumb_func_start InitIcons
InitIcons: @ 0x08004CE8
	push {lr}
	bl ClearIcons
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ClearIcons
ClearIcons: @ 0x08004CF4
	push {r4, lr}
	sub sp, #4
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _08004D1C @ =0x02026A50
	ldr r2, _08004D20 @ =0x01000160
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _08004D24 @ =0x02026D10
	ldr r2, _08004D28 @ =0x01000010
	bl CpuSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004D1C: .4byte 0x02026A50
_08004D20: .4byte 0x01000160
_08004D24: .4byte 0x02026D10
_08004D28: .4byte 0x01000010

	thumb_func_start ApplyIconPalettes
ApplyIconPalettes: @ 0x08004D2C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08004D40 @ =0x080CBEA4
	lsls r1, r1, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08004D40: .4byte 0x080CBEA4

	thumb_func_start ApplyIconPalette
ApplyIconPalette: @ 0x08004D44
	push {lr}
	lsls r0, r0, #5
	ldr r2, _08004D58 @ =0x080CBEA4
	adds r0, r0, r2
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08004D58: .4byte 0x080CBEA4

	thumb_func_start sub_08004D5C
sub_08004D5C: @ 0x08004D5C
	movs r2, #0
	movs r1, #0x1f
	ldr r3, _08004D78 @ =0x02026D10
_08004D62:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08004D6C
	adds r2, #1
_08004D6C:
	subs r1, #1
	cmp r1, #0
	bge _08004D62
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08004D78: .4byte 0x02026D10

	thumb_func_start IconSlot2Chr
IconSlot2Chr: @ 0x08004D7C
	adds r1, r0, #0
	lsls r1, r1, #2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0

	thumb_func_start GetNewIconSlot
GetNewIconSlot: @ 0x08004D90
	push {r4, lr}
	movs r2, #0
	ldr r4, _08004DA8 @ =0x02026D10
	adds r3, r0, #1
_08004D98:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004DAC
	strb r3, [r1]
	adds r0, r2, #0
	b _08004DB6
	.align 2, 0
_08004DA8: .4byte 0x02026D10
_08004DAC:
	adds r2, #1
	cmp r2, #0x1f
	ble _08004D98
	movs r0, #1
	rsbs r0, r0, #0
_08004DB6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetIconChr
GetIconChr: @ 0x08004DBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08004DD8 @ =0x02026A50
	lsls r1, r4, #2
	adds r5, r1, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _08004DDC
	ldrb r0, [r5]
	cmp r0, #0xfe
	bhi _08004E10
	adds r0, #1
	strb r0, [r5]
	b _08004E10
	.align 2, 0
_08004DD8: .4byte 0x02026A50
_08004DDC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	bl GetNewIconSlot
	adds r0, #1
	strb r0, [r5, #1]
	lsls r4, r4, #7
	ldr r0, _08004E20 @ =0x080C5EA4
	adds r4, r4, r0
	ldrb r0, [r5, #1]
	bl IconSlot2Chr
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	ldr r0, _08004E24 @ =0x0001FFE0
	ands r1, r0
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x80
	bl RegisterDataMove
_08004E10:
	ldrb r0, [r5, #1]
	bl IconSlot2Chr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004E20: .4byte 0x080C5EA4
_08004E24: .4byte 0x0001FFE0

	thumb_func_start PutIcon
PutIcon: @ 0x08004E28
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bge _08004E44
	movs r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r1, #2
	b _08004E70
_08004E44:
	bl GetIconChr
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	strh r1, [r4]
	lsrs r1, r0, #0x10
	adds r0, r0, r2
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x40
	lsrs r1, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	strh r1, [r2]
	adds r1, r4, #0
	adds r1, #0x42
_08004E70:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ClearIcon
ClearIcon: @ 0x08004E78
	ldr r2, _08004E90 @ =0x02026D10
	ldr r1, _08004E94 @ =0x02026A50
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	subs r1, #1
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
_08004E90: .4byte 0x02026D10
_08004E94: .4byte 0x02026A50

	thumb_func_start PutIconObjImg
PutIconObjImg: @ 0x08004E98
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08004EC4 @ =0x06010000
	ldr r0, _08004EC8 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r5, r0, r5
	cmp r2, #0
	bge _08004ECC
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataFill
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #0
	movs r2, #0x40
	bl RegisterDataFill
	b _08004EEC
	.align 2, 0
_08004EC4: .4byte 0x06010000
_08004EC8: .4byte 0x000003FF
_08004ECC:
	ldr r4, _08004EF4 @ =0x080C5EA4
	lsls r0, r2, #7
	adds r4, r0, r4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r4, #0x40
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	adds r0, r4, #0
	movs r2, #0x40
	bl RegisterDataMove
_08004EEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004EF4: .4byte 0x080C5EA4

	thumb_func_start DebugInitBg
DebugInitBg: @ 0x08004EF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	bne _08004F06
	movs r6, #0xb0
	lsls r6, r6, #7
_08004F06:
	adds r0, r5, #0
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r5, #0
	movs r1, #0
	bl SetBgScreenSize
	ldr r0, _08004F5C @ =0x08B8590C
	ldr r1, _08004F60 @ =0x0001FFFF
	ands r1, r6
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r1, _08004F64 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08004F68 @ =0x00007FFF
	strh r0, [r1, #4]
	bl EnablePalSync
	adds r0, r5, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _08004F6C @ =0x02026D30
	strh r5, [r4, #4]
	str r6, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetBgChrId
	strh r0, [r4, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004F5C: .4byte 0x08B8590C
_08004F60: .4byte 0x0001FFFF
_08004F64: .4byte 0x02022860
_08004F68: .4byte 0x00007FFF
_08004F6C: .4byte 0x02026D30

	thumb_func_start DebugPutStr
DebugPutStr: @ 0x08004F70
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrb r0, [r1]
	ldr r5, _08004F90 @ =0x02026D30
	cmp r0, #0
	beq _08004FAE
	adds r3, r5, #0
	ldr r4, _08004F94 @ =0x0000FFC0
_08004F80:
	cmp r0, #0x60
	bls _08004F98
	ldrh r6, [r3, #6]
	adds r0, r6, r4
	ldrb r7, [r1]
	adds r0, r7, r0
	b _08004FA2
	.align 2, 0
_08004F90: .4byte 0x02026D30
_08004F94: .4byte 0x0000FFC0
_08004F98:
	ldrh r6, [r3, #6]
	ldr r7, _08004FBC @ =0x0000FFE0
	adds r0, r6, r7
	ldrb r6, [r1]
	adds r0, r6, r0
_08004FA2:
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004F80
_08004FAE:
	movs r7, #4
	ldrsh r0, [r5, r7]
	bl EnableBgSyncById
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004FBC: .4byte 0x0000FFE0

	thumb_func_start sub_08004FC0
sub_08004FC0: @ 0x08004FC0
	push {r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r1, sp
	bl DebugPutStr
	add sp, #0x100
	pop {r3}
	add sp, #0xc
	bx r3

	thumb_func_start sub_08004FD4
sub_08004FD4: @ 0x08004FD4
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r2, _08005010 @ =0x02026D30
	ldr r6, _08005014 @ =0x02023C60
	movs r5, #0xff
	adds r4, r2, #0
	adds r4, #0x14
	movs r3, #0
_08004FE4:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r4
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0xff
	ble _08004FE4
	movs r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005010: .4byte 0x02026D30
_08005014: .4byte 0x02023C60

	thumb_func_start sub_08005018
sub_08005018: @ 0x08005018
	push {r0, r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r0, sp
	bl sub_08005134
	add sp, #0x100
	pop {r3}
	add sp, #0x10
	bx r3

	thumb_func_start sub_0800502C
sub_0800502C: @ 0x0800502C
	ldr r1, _0800503C @ =0x02028D44
	ldr r0, _08005040 @ =0x20202020
	stm r1!, {r0}
	str r0, [r1]
	ldr r1, _0800503C @ =0x02028D44
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_0800503C: .4byte 0x02028D44
_08005040: .4byte 0x20202020

	thumb_func_start sub_08005044
sub_08005044: @ 0x08005044
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0800502C
	movs r6, #7
	b _08005056
_08005050:
	subs r6, #1
	cmp r6, #0
	blt _08005074
_08005056:
	ldr r4, _0800507C @ =0x02028D44
	adds r4, r6, r4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _08005050
_08005074:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800507C: .4byte 0x02028D44

	thumb_func_start sub_08005080
sub_08005080: @ 0x08005080
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0800502C
	cmp r4, #0xff
	beq _08005094
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080050A4
_08005094:
	ldr r1, _080050A0 @ =0x02028D44
	movs r0, #0x3a
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _080050AA
	.align 2, 0
_080050A0: .4byte 0x02028D44
_080050A4:
	adds r0, r4, #0
	bl sub_08005044
_080050AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080050B0
sub_080050B0: @ 0x080050B0
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08005044
	ldr r0, _080050C8 @ =0x02028D4C
	subs r0, r0, r4
	bl sub_08005134
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080050C8: .4byte 0x02028D4C

	thumb_func_start sub_080050CC
sub_080050CC: @ 0x080050CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0800502C
	movs r2, #7
	ldr r1, _08005110 @ =0x02028D44
	ldr r3, _08005114 @ =0x08193D8C
	movs r0, #0xf
	ands r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1, #7]
	asrs r4, r4, #4
	cmp r4, #0
	beq _08005108
	adds r6, r1, #0
	adds r5, r3, #0
	movs r3, #0xf
_080050F0:
	subs r2, #1
	cmp r2, #0
	blt _08005108
	adds r0, r2, r6
	adds r1, r4, #0
	ands r1, r3
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	asrs r4, r4, #4
	cmp r4, #0
	bne _080050F0
_08005108:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005110: .4byte 0x02028D44
_08005114: .4byte 0x08193D8C

	thumb_func_start sub_08005118
sub_08005118: @ 0x08005118
	push {r4, lr}
	adds r4, r1, #0
	bl sub_080050CC
	ldr r0, _08005130 @ =0x02028D4C
	subs r0, r0, r4
	bl sub_08005134
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005130: .4byte 0x02028D4C

	thumb_func_start sub_08005134
sub_08005134: @ 0x08005134
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldr r1, _08005150 @ =0x02026D30
	mov ip, r1
	cmp r0, #0
	beq _08005186
	mov r3, ip
_08005144:
	ldrb r2, [r4]
	ldr r0, [r3, #8]
	cmp r0, #0x30
	bne _08005154
	movs r2, #0
	b _08005156
	.align 2, 0
_08005150: .4byte 0x02026D30
_08005154:
	adds r4, #1
_08005156:
	cmp r2, #0xa
	bne _0800515C
	movs r2, #0
_0800515C:
	ldrb r0, [r3, #0xc]
	lsls r1, r0, #5
	ldr r0, [r3, #8]
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x14
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3, #8]
	adds r0, #1
	str r0, [r3, #8]
	cmp r2, #0
	bne _08005180
	mov r1, ip
	str r2, [r1, #8]
	ldr r0, [r1, #0xc]
	adds r0, #1
	str r0, [r1, #0xc]
_08005180:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005144
_08005186:
	mov r2, ip
	ldr r0, [r2, #0x10]
	adds r0, #0x14
	ldr r1, [r2, #0xc]
	cmp r1, r0
	bls _08005198
	adds r0, r1, #0
	subs r0, #0x14
	str r0, [r2, #0x10]
_08005198:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080051A0
sub_080051A0: @ 0x080051A0
	push {r4, r5, r6, r7, lr}
	ldr r0, _080051E8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r3, #0
	ldr r7, _080051EC @ =0x02026D30
	movs r0, #0x14
	adds r0, r0, r7
	mov ip, r0
	movs r6, #0xff
_080051B6:
	lsls r1, r3, #6
	ldr r0, _080051E8 @ =0x02023C60
	adds r2, r1, r0
	ldr r0, [r7, #0x10]
	adds r0, r3, r0
	ands r0, r6
	lsls r0, r0, #5
	add r0, ip
	ldrb r0, [r0]
	adds r5, r3, #1
	cmp r0, #0
	beq _08005206
	ldr r4, _080051EC @ =0x02026D30
	ldr r0, [r4, #0x10]
	adds r0, r3, r0
	ands r0, r6
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r0, r1
_080051DE:
	ldrb r0, [r1]
	cmp r0, #0x60
	bls _080051F0
	subs r0, #0x40
	b _080051F2
	.align 2, 0
_080051E8: .4byte 0x02023C60
_080051EC: .4byte 0x02026D30
_080051F0:
	subs r0, #0x20
_080051F2:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #6]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080051DE
_08005206:
	adds r3, r5, #0
	cmp r3, #0x13
	ble _080051B6
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08005218
sub_08005218: @ 0x08005218
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800522E
	movs r0, #0
	b _08005272
_0800522E:
	bl sub_080051A0
	ldr r3, _08005278 @ =0x02026D30
	ldr r0, [r3, #0xc]
	ldr r2, _0800527C @ =0xFFFFFF00
	adds r1, r0, r2
	cmp r1, #0
	bge _08005240
	movs r1, #0
_08005240:
	adds r2, r0, #0
	subs r2, #0x14
	cmp r2, #0
	bge _0800524A
	movs r2, #0
_0800524A:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0800525C
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bhs _0800525C
	subs r0, #1
	str r0, [r3, #0x10]
_0800525C:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _08005270
	ldr r1, _08005278 @ =0x02026D30
	ldr r0, [r1, #0x10]
	cmp r2, r0
	bls _08005270
	adds r0, #1
	str r0, [r1, #0x10]
_08005270:
	movs r0, #1
_08005272:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005278: .4byte 0x02026D30
_0800527C: .4byte 0xFFFFFF00

	thumb_func_start SetupDebugFontForOBJ
SetupDebugFontForOBJ: @ 0x08005280
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bge _0800528E
	movs r2, #0xc0
	lsls r2, r2, #6
_0800528E:
	ldr r0, _080052F0 @ =0x0000FFFF
	ands r2, r0
	ldr r1, _080052F4 @ =0x02028D50
	adds r0, r2, #0
	asrs r0, r0, #5
	str r0, [r1]
	ldr r1, _080052F8 @ =0x02028D54
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	str r0, [r1]
	ldr r0, _080052FC @ =0x08B8590C
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r2, r3
	ldr r2, _08005300 @ =0x0001FFFF
	ands r1, r2
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r3, _08005304 @ =0x02022860
	adds r1, r4, #0
	adds r1, #0x10
	lsls r0, r1, #5
	adds r0, r0, r3
	movs r2, #0
	strh r2, [r0]
	lsls r1, r1, #4
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0xf8
	lsls r2, r2, #7
	strh r2, [r0]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldr r0, _08005308 @ =0x00007FFF
	strh r0, [r1]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080052F0: .4byte 0x0000FFFF
_080052F4: .4byte 0x02028D50
_080052F8: .4byte 0x02028D54
_080052FC: .4byte 0x08B8590C
_08005300: .4byte 0x0001FFFF
_08005304: .4byte 0x02022860
_08005308: .4byte 0x00007FFF

	thumb_func_start sub_0800530C
sub_0800530C: @ 0x0800530C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	b _0800533E
_08005316:
	cmp r0, #0x60
	bls _0800531E
	subs r0, #0x40
	b _08005320
_0800531E:
	subs r0, #0x20
_08005320:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0800534C @ =0x02028D50
	ldr r3, [r0]
	adds r3, r1, r3
	ldr r0, _08005350 @ =0x02028D54
	ldr r0, [r0]
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _08005354 @ =0x08B905B0
	bl PutOamHiRam
	adds r5, #8
	adds r4, #1
_0800533E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005316
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800534C: .4byte 0x02028D50
_08005350: .4byte 0x02028D54
_08005354: .4byte 0x08B905B0

	thumb_func_start sub_08005358
sub_08005358: @ 0x08005358
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl sub_08005044
	ldr r2, _08005378 @ =0x02028D4C
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800530C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005378: .4byte 0x02028D4C

	thumb_func_start sub_0800537C
sub_0800537C: @ 0x0800537C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl sub_080050CC
	ldr r2, _0800539C @ =0x02028D4C
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800530C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800539C: .4byte 0x02028D4C

	thumb_func_start GetLang
GetLang: @ 0x080053A0
	movs r0, #0
	bx lr

	thumb_func_start SetLang
SetLang: @ 0x080053A4
	ldr r1, _080053AC @ =0x02028D74
	strb r0, [r1]
	bx lr
	.align 2, 0
_080053AC: .4byte 0x02028D74

	thumb_func_start ResetText
ResetText: @ 0x080053B0
	push {lr}
	ldr r0, _080053C8 @ =0x02028D58
	ldr r1, _080053CC @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r1, _080053D0 @ =0x02028D78
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080053C8: .4byte 0x02028D58
_080053CC: .4byte 0x06001000
_080053D0: .4byte 0x02028D78

	thumb_func_start InitTextFont
InitTextFont: @ 0x080053D4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080053DE
	ldr r4, _08005408 @ =0x02028D58
_080053DE:
	str r1, [r4]
	ldr r0, _0800540C @ =GetTextDrawDest
	str r0, [r4, #0xc]
	movs r1, #0
	strh r3, [r4, #0x14]
	lsls r0, r3, #0xc
	adds r0, r2, r0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl GetLang
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	bl InitSystemTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005408: .4byte 0x02028D58
_0800540C: .4byte GetTextDrawDest

	thumb_func_start SetTextFontGlyphs
SetTextFontGlyphs: @ 0x08005410
	cmp r0, #0
	bne _08005424
	ldr r0, _0800541C @ =0x02028D70
	ldr r1, [r0]
	ldr r0, _08005420 @ =0x08B896B0
	b _0800542A
	.align 2, 0
_0800541C: .4byte 0x02028D70
_08005420: .4byte 0x08B896B0
_08005424:
	ldr r0, _08005430 @ =0x02028D70
	ldr r1, [r0]
	ldr r0, _08005434 @ =0x08B8B5B0
_0800542A:
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08005430: .4byte 0x02028D70
_08005434: .4byte 0x08B8B5B0

	thumb_func_start ResetTextFont
ResetTextFont: @ 0x08005438
	ldr r0, _08005448 @ =0x02028D70
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, _0800544C @ =0x02028D78
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_08005448: .4byte 0x02028D70
_0800544C: .4byte 0x02028D78

	thumb_func_start SetTextFont
SetTextFont: @ 0x08005450
	adds r1, r0, #0
	cmp r1, #0
	bne _08005468
	ldr r1, _08005460 @ =0x02028D70
	ldr r0, _08005464 @ =0x02028D58
	str r0, [r1]
	b _0800546C
	.align 2, 0
_08005460: .4byte 0x02028D70
_08005464: .4byte 0x02028D58
_08005468:
	ldr r0, _08005470 @ =0x02028D70
	str r1, [r0]
_0800546C:
	bx lr
	.align 2, 0
_08005470: .4byte 0x02028D70

	thumb_func_start InitText
InitText: @ 0x08005474
	push {r4, lr}
	ldr r2, _08005498 @ =0x02028D70
	ldr r4, [r2]
	ldrh r3, [r4, #0x12]
	movs r2, #0
	strh r3, [r0]
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r2, [r4, #0x12]
	adds r1, r2, r1
	strh r1, [r4, #0x12]
	bl ClearText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005498: .4byte 0x02028D70

	thumb_func_start InitTextDb
InitTextDb: @ 0x0800549C
	push {r4, lr}
	ldr r2, _080054C0 @ =0x02028D70
	ldr r3, [r2]
	ldrh r2, [r3, #0x12]
	movs r4, #0
	strh r2, [r0]
	strb r1, [r0, #4]
	strb r4, [r0, #6]
	movs r2, #1
	strb r2, [r0, #5]
	strb r4, [r0, #7]
	lsls r1, r1, #1
	ldrh r0, [r3, #0x12]
	adds r1, r0, r1
	strh r1, [r3, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080054C0: .4byte 0x02028D70

	thumb_func_start InitTextList
InitTextList: @ 0x080054C4
	push {r4, lr}
	adds r4, r0, #0
	b _080054D4
_080054CA:
	ldr r0, [r4]
	ldrb r1, [r4, #4]
	bl InitText
	adds r4, #8
_080054D4:
	ldr r0, [r4]
	cmp r0, #0
	bne _080054CA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ClearText
ClearText: @ 0x080054E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	str r0, [sp]
	ldr r0, _08005514 @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldrb r4, [r4, #4]
	lsls r2, r4, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005514: .4byte 0x02028D70

	thumb_func_start ClearTextPart
ClearTextPart: @ 0x08005518
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _08005554 @ =0x02028D70
	ldr r4, [r3]
	ldrb r5, [r0, #4]
	ldrb r6, [r0, #6]
	adds r3, r5, #0
	muls r3, r6, r3
	ldrh r0, [r0]
	adds r3, r0, r3
	adds r3, r3, r1
	lsls r3, r3, #6
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08005558 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005554: .4byte 0x02028D70
_08005558: .4byte 0x001FFFFF

	thumb_func_start Text_GetChrOffset
Text_GetChrOffset: @ 0x0800555C
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #1
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start Text_GetCursor
Text_GetCursor: @ 0x08005570
	ldrb r0, [r0, #2]
	bx lr

	thumb_func_start Text_SetCursor
Text_SetCursor: @ 0x08005574
	strb r1, [r0, #2]
	bx lr

	thumb_func_start Text_Skip
Text_Skip: @ 0x08005578
	ldrb r2, [r0, #2]
	adds r1, r2, r1
	strb r1, [r0, #2]
	bx lr

	thumb_func_start Text_SetColor
Text_SetColor: @ 0x08005580
	strb r1, [r0, #3]
	bx lr

	thumb_func_start Text_GetColor
Text_GetColor: @ 0x08005584
	ldrb r0, [r0, #3]
	bx lr

	thumb_func_start Text_SetParams
Text_SetParams: @ 0x08005588
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0

	thumb_func_start PutText
PutText: @ 0x08005590
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _080055DC @ =0x02028D70
	ldr r1, [r0]
	ldrb r3, [r4, #4]
	ldrb r5, [r4, #6]
	adds r0, r5, #0
	muls r0, r3, r0
	ldrh r5, [r4]
	adds r0, r5, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	cmp r3, #0
	beq _080055C4
_080055B0:
	strh r1, [r2]
	adds r1, #1
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080055B0
_080055C4:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080055D4
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_080055D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080055DC: .4byte 0x02028D70

	thumb_func_start PutBlankText
PutBlankText: @ 0x080055E0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080055FA
	movs r3, #0
	adds r2, r0, #0
_080055EA:
	strh r3, [r1]
	adds r0, r1, #0
	adds r0, #0x40
	strh r3, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080055EA
_080055FA:
	bx lr

	thumb_func_start GetStringTextLen
GetStringTextLen: @ 0x080055FC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _08005618 @ =0x02028D70
	ldr r1, [r0]
	adds r5, r0, #0
	ldrb r1, [r1, #0x16]
	cmp r1, #5
	beq _08005644
	adds r0, r2, #0
	bl sub_08005C00
	b _0800564C
	.align 2, 0
_08005618: .4byte 0x02028D70
_0800561C:
	ldrb r3, [r2]
	adds r2, #1
	cmp r3, #0x1f
	bls _08005644
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r5]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08005654 @ =0xFFFFFF00
	adds r0, r0, r1
_08005634:
	ldr r0, [r0]
	cmp r0, #0
	beq _08005644
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _08005634
	ldrb r0, [r0, #5]
	adds r4, r0, r4
_08005644:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _0800561C
	adds r0, r4, #0
_0800564C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005654: .4byte 0xFFFFFF00

	thumb_func_start GetCharTextLen
GetCharTextLen: @ 0x08005658
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08005674 @ =0x02028D70
	ldr r1, [r0]
	ldrb r0, [r1, #0x16]
	cmp r0, #5
	beq _08005678
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_08005BD0
	b _0800569C
	.align 2, 0
_08005674: .4byte 0x02028D70
_08005678:
	ldrb r3, [r2]
	adds r2, #1
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080056A4 @ =0xFFFFFF00
	adds r0, r0, r1
_0800568A:
	ldr r0, [r0]
	cmp r0, #0
	beq _0800569A
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _0800568A
	ldrb r0, [r0, #5]
	str r0, [r4]
_0800569A:
	adds r0, r2, #0
_0800569C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080056A4: .4byte 0xFFFFFF00

	thumb_func_start GetStringTextCenteredPos
GetStringTextCenteredPos: @ 0x080056A8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetStringTextBox
GetStringTextBox: @ 0x080056C4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0
	str r0, [r6]
	str r0, [r5]
	bl MsgExpand
	adds r4, r0, #0
	b _080056DA
_080056D8:
	adds r4, #1
_080056DA:
	ldrb r0, [r4]
	cmp r0, #1
	bls _08005704
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r0, r1
	bge _080056F0
	str r1, [r6]
_080056F0:
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r0, r4, #0
	bl GetStringLineEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _080056D8
_08005704:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetStringLineEnd
GetStringLineEnd: @ 0x0800570C
	b _08005710
_0800570E:
	adds r0, #1
_08005710:
	ldrb r1, [r0]
	cmp r1, #1
	bhi _0800570E
	bx lr

	thumb_func_start Text_DrawString
Text_DrawString: @ 0x08005718
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _08005730 @ =0x02028D70
	ldr r0, [r0]
	ldrb r0, [r0, #0x16]
	cmp r0, #5
	beq _08005734
	adds r0, r6, #0
	bl sub_08005B60
	b _08005786
	.align 2, 0
_08005730: .4byte 0x02028D70
_08005734:
	ldrb r0, [r4]
	cmp r0, #1
	bls _08005786
_0800573A:
	ldrb r3, [r4]
	adds r4, #1
	cmp r3, #0x1f
	bls _08005780
	ldrb r2, [r4]
	adds r4, #1
	ldr r5, _0800575C @ =0x02028D70
_08005748:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08005760 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08005780
	b _08005770
	.align 2, 0
_0800575C: .4byte 0x02028D70
_08005760: .4byte 0xFFFFFF00
_08005764:
	ldr r1, [r1]
	cmp r1, #0
	bne _08005770
	movs r3, #0x81
	movs r2, #0xa7
	b _08005748
_08005770:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005764
	ldr r0, [r5]
	ldr r2, [r0, #8]
	adds r0, r6, #0
	bl _call_via_r2
_08005780:
	ldrb r1, [r4]
	cmp r1, #1
	bhi _0800573A
_08005786:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Text_DrawNumber
Text_DrawNumber: @ 0x0800578C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _080057A4
	ldr r1, _080057A0 @ =0x08193DA0
	bl Text_DrawCharacter
	b _080057CE
	.align 2, 0
_080057A0: .4byte 0x08193DA0
_080057A4:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sp
	bl Text_DrawCharacter
	ldrb r0, [r5, #2]
	subs r0, #0xf
	strb r0, [r5, #2]
	cmp r4, #0
	bne _080057A4
_080057CE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Text_DrawNumberOrBlank
Text_DrawNumberOrBlank: @ 0x080057D8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xff
	beq _080057E8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08005808
_080057E8:
	movs r1, #8
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl Text_Skip
	ldr r0, _08005804 @ =0x0000127C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	b _0800580E
	.align 2, 0
_08005804: .4byte 0x0000127C
_08005808:
	adds r0, r4, #0
	bl Text_DrawNumber
_0800580E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Text_DrawCharacter
Text_DrawCharacter: @ 0x08005814
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08005830 @ =0x02028D70
	ldr r1, [r0]
	adds r6, r0, #0
	ldrb r1, [r1, #0x16]
	cmp r1, #5
	beq _08005834
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawCharacterAscii
	b _08005876
	.align 2, 0
_08005830: .4byte 0x02028D70
_08005834:
	ldrb r3, [r4]
	adds r4, #1
	ldrb r2, [r4]
	adds r4, #1
_0800583C:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _0800584C @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08005852
	.align 2, 0
_0800584C: .4byte 0xFFFFFF00
_08005850:
	ldr r1, [r1]
_08005852:
	cmp r1, #0
	bne _08005864
	movs r3, #0x81
	movs r2, #0xa7
	ldr r6, _08005860 @ =0x02028D70
	b _0800583C
	.align 2, 0
_08005860: .4byte 0x02028D70
_08005864:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005850
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
_08005876:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetTextDrawDest
GetTextDrawDest: @ 0x0800587C
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0800589C @ =0x02028D70
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0800589C: .4byte 0x02028D70

	thumb_func_start GetColorLut
GetColorLut: @ 0x080058A0
	ldr r1, _080058AC @ =0x08B8610C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080058AC: .4byte 0x08B8610C

	thumb_func_start DrawTextGlyph
DrawTextGlyph: @ 0x080058B0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080058FC @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r5, #0
	bl _call_via_r1
	mov r8, r0
	movs r4, #7
	ldrb r0, [r5, #2]
	ands r4, r0
	mov r6, sb
	adds r6, #8
	ldrb r0, [r5, #3]
	bl GetColorLut
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl DrawGlyphRam
	ldrb r2, [r5, #2]
	mov r1, sb
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	strb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080058FC: .4byte 0x02028D70

	thumb_func_start DrawTextGlyphNoClear
DrawTextGlyphNoClear: @ 0x08005900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005A3C @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0x14]
	movs r0, #9
	bl GetColorLut
	mov sl, r0
	ldr r6, [sp]
	ldrb r0, [r6, #3]
	bl GetColorLut
	mov sb, r0
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r7, [sp, #0xc]
	adds r7, #0x40
_08005948:
	ldr r2, [sp, #0x14]
	ldm r2!, {r0}
	str r2, [sp, #0x14]
	movs r1, #0
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	bl sub_080BFC18
	movs r5, #0xff
	ands r5, r0
	lsls r5, r5, #1
	adds r6, r5, #0
	add r6, sl
	mov r8, r6
	lsls r6, r1, #0x18
	lsrs r4, r0, #8
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r6, [sp, #0xc]
	ldr r3, [r6]
	ands r3, r2
	str r3, [r6]
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	stm r6!, {r3}
	str r6, [sp, #0xc]
	lsls r5, r1, #0x10
	lsrs r4, r0, #0x10
	adds r2, r5, #0
	orrs r2, r4
	movs r5, #0xff
	ands r5, r2
	lsls r5, r5, #1
	adds r2, r5, #0
	add r2, sl
	mov r8, r2
	lsls r6, r1, #8
	lsrs r4, r0, #0x18
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r3, [r7]
	ands r3, r2
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	str r3, [r7]
	adds r2, r1, #0
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r2, sl
	adds r5, r4, r2
	lsrs r2, r1, #8
	movs r1, #0xff
	ands r1, r2
	lsls r1, r1, #1
	mov r3, sl
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	ldrh r5, [r5]
	orrs r0, r5
	ldr r2, [r7, #0x40]
	ands r2, r0
	add r4, sb
	add r1, sb
	ldrh r1, [r1]
	lsls r0, r1, #0x10
	ldrh r4, [r4]
	orrs r0, r4
	orrs r2, r0
	str r2, [r7, #0x40]
	adds r7, #4
	ldr r6, [sp, #8]
	subs r6, #1
	str r6, [sp, #8]
	cmp r6, #0
	bge _08005948
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005A3C: .4byte 0x02028D70

	thumb_func_start InitSystemTextFont
InitSystemTextFont: @ 0x08005A40
	push {r4, lr}
	ldr r0, _08005A70 @ =0x08194674
	ldr r4, _08005A74 @ =0x02028D70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08005A78 @ =0x02022860
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005A7C @ =DrawTextGlyph
	str r0, [r2, #8]
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005A70: .4byte 0x08194674
_08005A74: .4byte 0x02028D70
_08005A78: .4byte 0x02022860
_08005A7C: .4byte DrawTextGlyph

	thumb_func_start InitTalkTextFont
InitTalkTextFont: @ 0x08005A80
	push {r4, lr}
	ldr r0, _08005AB0 @ =0x08194694
	ldr r4, _08005AB4 @ =0x02028D70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08005AB8 @ =0x02022860
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005ABC @ =DrawTextGlyph
	str r0, [r2, #8]
	movs r0, #1
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005AB0: .4byte 0x08194694
_08005AB4: .4byte 0x02028D70
_08005AB8: .4byte 0x02022860
_08005ABC: .4byte DrawTextGlyph

	thumb_func_start SetTextDrawNoClear
SetTextDrawNoClear: @ 0x08005AC0
	ldr r0, _08005ACC @ =0x02028D70
	ldr r1, [r0]
	ldr r0, _08005AD0 @ =DrawTextGlyphNoClear
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08005ACC: .4byte 0x02028D70
_08005AD0: .4byte DrawTextGlyphNoClear

	thumb_func_start PutDrawText
PutDrawText: @ 0x08005AD4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _08005AEE
	mov r4, sp
	mov r0, sp
	ldr r1, [sp, #0x1c]
	bl InitText
_08005AEE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Text_InsertDrawString
Text_InsertDrawString: @ 0x08005B18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Text_InsertDrawNumberOrBlank
Text_InsertDrawNumberOrBlank: @ 0x08005B3C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumberOrBlank
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08005B60
sub_08005B60: @ 0x08005B60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	b _08005B8A
_08005B68:
	ldr r0, _08005B98 @ =0x02028D70
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005B82
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005B82:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
_08005B8A:
	ldrb r0, [r4]
	cmp r0, #1
	bhi _08005B68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08005B98: .4byte 0x02028D70

	thumb_func_start Text_DrawCharacterAscii
Text_DrawCharacterAscii: @ 0x08005B9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08005BCC @ =0x02028D70
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005BBC
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005BBC:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005BCC: .4byte 0x02028D70

	thumb_func_start sub_08005BD0
sub_08005BD0: @ 0x08005BD0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _08005BFC @ =0x02028D70
	ldr r0, [r0]
	ldr r3, [r0, #4]
	ldrb r4, [r2]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r2, #1
	cmp r0, #0
	bne _08005BEE
	adds r0, r3, #0
	adds r0, #0xfc
	ldr r0, [r0]
_08005BEE:
	ldrb r0, [r0, #5]
	str r0, [r1]
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005BFC: .4byte 0x02028D70

	thumb_func_start sub_08005C00
sub_08005C00: @ 0x08005C00
	push {r4, lr}
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #1
	bls _08005C26
	ldr r0, _08005C30 @ =0x02028D70
	ldr r0, [r0]
	ldr r3, [r0, #4]
_08005C12:
	ldrb r4, [r1]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, #1
	ldrb r0, [r0, #5]
	adds r2, r0, r2
	ldrb r0, [r1]
	cmp r0, #1
	bhi _08005C12
_08005C26:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005C30: .4byte 0x02028D70

	thumb_func_start sub_08005C34
sub_08005C34: @ 0x08005C34
	bx lr
	.align 2, 0

	thumb_func_start InitSpriteTextFont
InitSpriteTextFont: @ 0x08005C38
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, _08005C6C @ =GetSpriteTextDrawDest
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r2, r0
	adds r2, #0x10
	movs r0, #0
	strh r2, [r4, #0x14]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	strh r1, [r4, #0x10]
	strh r0, [r4, #0x12]
	bl GetLang
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	ldr r0, _08005C70 @ =DrawSpriteTextGlyph
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005C6C: .4byte GetSpriteTextDrawDest
_08005C70: .4byte DrawSpriteTextGlyph

	thumb_func_start InitSpriteText
InitSpriteText: @ 0x08005C74
	ldr r1, _08005C94 @ =0x02028D70
	ldr r3, [r1]
	ldrh r1, [r3, #0x12]
	movs r2, #0
	strh r1, [r0]
	movs r1, #0x20
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r1, [r3, #0x12]
	adds r1, #0x40
	strh r1, [r3, #0x12]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_08005C94: .4byte 0x02028D70

	thumb_func_start SpriteText_DrawBackground
SpriteText_DrawBackground: @ 0x08005C98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _08005CE2
	movs r0, #0
	strb r0, [r7, #2]
	ldr r4, _08005CEC @ =0x44444444
	str r4, [sp]
	ldr r5, _08005CF0 @ =0x02028D70
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldr r6, _08005CF4 @ =0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
_08005CE2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005CEC: .4byte 0x44444444
_08005CF0: .4byte 0x02028D70
_08005CF4: .4byte 0x010000D8

	thumb_func_start SpriteText_DrawBackgroundExt
SpriteText_DrawBackgroundExt: @ 0x08005CF8
	push {lr}
	sub sp, #4
	movs r2, #0
	strb r2, [r0, #2]
	str r1, [sp]
	ldr r1, _08005D1C @ =0x02028D70
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	adds r1, r0, #0
	ldr r2, _08005D20 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08005D1C: .4byte 0x02028D70
_08005D20: .4byte 0x01000200

	thumb_func_start GetSpriteTextDrawDest
GetSpriteTextDrawDest: @ 0x08005D24
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08005D44 @ =0x02028D70
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08005D44: .4byte 0x02028D70

	thumb_func_start DrawSpriteTextGlyph
DrawSpriteTextGlyph: @ 0x08005D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005EF4 @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	adds r7, r0, #0
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0xc]
	ldrb r0, [r1, #3]
	bl GetColorLut
	mov r8, r0
	movs r0, #0xff
	mov sb, r0
	ldr r1, [sp, #8]
	lsls r1, r1, #1
	str r1, [sp, #0x10]
	movs r2, #7
	mov sl, r2
_08005D8C:
	ldr r3, [sp, #0xc]
	ldm r3!, {r0}
	str r3, [sp, #0xc]
	movs r1, #0
	ldr r3, [sp, #8]
	lsls r2, r3, #1
	bl sub_080BFC18
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08005D8C
	ldr r0, _08005EF4 @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r0, r2
	movs r3, #0xff
	mov sb, r3
	movs r0, #7
	mov sl, r0
_08005E3E:
	ldr r2, [sp, #0xc]
	ldm r2!, {r0}
	str r2, [sp, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x10]
	bl sub_080BFC18
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08005E3E
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005EF4: .4byte 0x02028D70

	thumb_func_start sub_08005EF8
sub_08005EF8: @ 0x08005EF8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08005F66
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x36
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r5, r1
	bge _08005F66
_08005F24:
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	blt _08005F54
	cmp r2, #1
	ble _08005F38
	cmp r2, #4
	beq _08005F46
	b _08005F54
_08005F38:
	ldr r1, [r4, #0x2c]
	movs r0, #0
	strb r0, [r1, #7]
	adds r0, r4, #0
	bl Proc_Break
	b _08005F66
_08005F46:
	adds r0, r1, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl Text_Skip
	b _08005F5C
_08005F54:
	ldr r0, [r4, #0x2c]
	bl Text_DrawCharacter
	str r0, [r4, #0x30]
_08005F5C:
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r5, r0
	blt _08005F24
_08005F66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08005F6C
sub_08005F6C: @ 0x08005F6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r7, #0
	bne _08005F7E
	bl Text_DrawString
_08005F7E:
	cmp r4, #0
	bne _08005F84
	movs r4, #1
_08005F84:
	ldr r0, _08005FB0 @ =0x08B86140
	movs r1, #3
	bl SpawnProc
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r4, [r0]
	subs r0, #2
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r6, #0
	bl GetStringLineEnd
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005FB0: .4byte 0x08B86140

	thumb_func_start sub_08005FB4
sub_08005FB4: @ 0x08005FB4
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	thumb_func_start sub_08005FBC
sub_08005FBC: @ 0x08005FBC
	push {lr}
	ldr r0, _08005FC8 @ =0x08B86140
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08005FC8: .4byte 0x08B86140

	thumb_func_start sub_08005FCC
sub_08005FCC: @ 0x08005FCC
	push {lr}
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _08005FEC @ =0x02022860
	lsls r0, r0, #1
	ldr r1, _08005FF0 @ =0x08194734
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08005FEC: .4byte 0x02022860
_08005FF0: .4byte 0x08194734

	thumb_func_start StartGreenText
StartGreenText: @ 0x08005FF4
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08006008
	ldr r0, _08006004 @ =0x08B86150
	bl SpawnProc
	b _08006010
	.align 2, 0
_08006004: .4byte 0x08B86150
_08006008:
	ldr r0, _08006014 @ =0x08B86150
	movs r1, #3
	bl SpawnProc
_08006010:
	pop {r0}
	bx r0
	.align 2, 0
_08006014: .4byte 0x08B86150

	thumb_func_start EndGreenText
EndGreenText: @ 0x08006018
	push {lr}
	ldr r0, _08006024 @ =0x08B86150
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08006024: .4byte 0x08B86150

	thumb_func_start sub_08006028
sub_08006028: @ 0x08006028
	push {r4, r5, lr}
	adds r4, r0, #0
	mov ip, r1
	adds r5, r2, #0
	ldr r0, _0800604C @ =0x02028D70
	ldr r1, [r0]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #6]
	adds r0, r3, #0
	muls r0, r2, r0
	ldrh r3, [r4]
	adds r0, r3, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	movs r3, #0
	b _08006062
	.align 2, 0
_0800604C: .4byte 0x02028D70
_08006050:
	mov r0, ip
	strh r1, [r0]
	adds r1, #1
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	movs r0, #2
	add ip, r0
	adds r3, #1
_08006062:
	cmp r3, r2
	bge _0800606A
	cmp r3, r5
	blt _08006050
_0800606A:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0800607A
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_0800607A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08006080
sub_08006080: @ 0x08006080
	bx lr
	.align 2, 0

	thumb_func_start sub_08006084
sub_08006084: @ 0x08006084
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080060DC @ =0x02028D70
	ldr r3, [r3]
	lsls r0, r0, #6
	ldr r3, [r3]
	adds r3, r3, r0
	mov r8, r3
	adds r7, r2, #0
	adds r7, #8
	adds r0, r1, #0
	bl GetColorLut
	adds r2, r0, #0
	movs r6, #0xff
	movs r3, #0xf
_080060A6:
	ldm r7!, {r0}
	adds r1, r0, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r4, [r1]
	lsrs r0, r0, #8
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r0, r0, r4
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080060A6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080060DC: .4byte 0x02028D70

	thumb_func_start sub_080060E0
sub_080060E0: @ 0x080060E0
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5]
	strb r2, [r5, #1]
	ldr r0, _08006114 @ =0x02028D70
	ldr r3, [r0]
	ldrh r4, [r3, #0x12]
	adds r0, r4, #1
	strh r0, [r3, #0x12]
	strh r4, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #4]
	movs r3, #2
	ldrsh r0, [r5, r3]
	ldr r3, _08006118 @ =0x08B901B0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_08006084
	movs r1, #2
	ldrsh r0, [r5, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006114: .4byte 0x02028D70
_08006118: .4byte 0x08B901B0

	thumb_func_start GetSpecialCharChr
GetSpecialCharChr: @ 0x0800611C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, _08006138 @ =0x02028D78
_08006124:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0800613C
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_080060E0
	b _08006156
	.align 2, 0
_08006138: .4byte 0x02028D78
_0800613C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _08006152
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08006152
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08006156
_08006152:
	adds r1, #4
	b _08006124
_08006156:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PutSpecialChar
PutSpecialChar: @ 0x0800615C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	cmp r1, #0xff
	bne _08006174
	movs r1, #0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	b _0800618C
_08006174:
	bl GetSpecialCharChr
	lsls r0, r0, #1
	ldr r1, _08006194 @ =0x02028D70
	ldr r1, [r1]
	ldrh r1, [r1, #0x10]
	adds r0, r1, r0
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	adds r0, #1
	strh r0, [r1]
_0800618C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006194: .4byte 0x02028D70

	thumb_func_start PutNumberExt
PutNumberExt: @ 0x08006198
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _080061AE
	adds r2, r6, #0
	bl PutSpecialChar
	b _080061D2
_080061AE:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutSpecialChar
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bne _080061AE
_080061D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start PutNumber
PutNumber: @ 0x080061D8
	push {lr}
	movs r3, #0
	bl PutNumberExt
	pop {r0}
	bx r0

	thumb_func_start PutNumberOrBlank
PutNumberOrBlank: @ 0x080061E4
	push {lr}
	cmp r2, #0
	blt _080061EE
	cmp r2, #0xff
	bne _080061FA
_080061EE:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080061FE
_080061FA:
	bl PutNumber
_080061FE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutNumberTwoChr
PutNumberTwoChr: @ 0x08006204
	push {lr}
	cmp r2, #0x64
	bne _08006216
	subs r0, #2
	movs r2, #0x28
	movs r3, #0x29
	bl PutTwoSpecialChar
	b _0800622E
_08006216:
	cmp r2, #0
	blt _0800621E
	cmp r2, #0xff
	bne _0800622A
_0800621E:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0800622E
_0800622A:
	bl PutNumber
_0800622E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutNumberSmall
PutNumberSmall: @ 0x08006234
	push {lr}
	movs r3, #0xa
	bl PutNumberExt
	pop {r0}
	bx r0

	thumb_func_start PutNumberBonus
PutNumberBonus: @ 0x08006240
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _08006264
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl PutSpecialChar
	adds r0, r4, #2
	cmp r5, #9
	ble _0800625C
	adds r0, r4, #4
_0800625C:
	movs r1, #4
	adds r2, r5, #0
	bl PutNumberSmall
_08006264:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800626C
sub_0800626C: @ 0x0800626C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #0
	ldr r1, _080062B4 @ =0x02022C60
	mov r8, r1
_0800627E:
	adds r7, r0, #1
	lsls r4, r0, #7
	movs r6, #0x1d
_08006284:
	mov r1, r8
	adds r0, r4, r1
	movs r2, #1
	ands r2, r5
	adds r5, #1
	movs r1, #0
	bl PutSpecialChar
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08006284
	adds r0, r7, #0
	cmp r0, #9
	ble _0800627E
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080062B4: .4byte 0x02022C60

	thumb_func_start PutTime
PutTime: @ 0x080062B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	mov r4, sp
	adds r4, #2
	add r1, sp, #4
	mov r8, r1
	mov r1, sp
	adds r2, r4, #0
	mov r3, r8
	bl FormatTime
	mov r1, sp
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	str r0, [sp, #0xc]
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #4
	ldrh r2, [r1]
	adds r1, r6, #0
	bl PutNumber
	ldrh r5, [r4]
	adds r4, r7, #0
	adds r4, #0xa
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	mov r1, r8
	ldrh r5, [r1]
	adds r4, #8
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	mov r0, sb
	cmp r0, #0
	beq _0800636C
	mov r1, sl
	cmp r1, #0
	beq _08006384
_0800636C:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0x21
	bl PutSpecialChar
	b _0800639A
_08006384:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0xff
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0xff
	bl PutSpecialChar
_0800639A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutTwoSpecialChar
PutTwoSpecialChar: @ 0x080063AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, #2
	bl PutSpecialChar
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpecialChar
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080063CC
sub_080063CC: @ 0x080063CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006408
sub_08006408: @ 0x08006408
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006448
sub_08006448: @ 0x08006448
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl PutSpecialChar
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start AnimUpdateAll
AnimUpdateAll: @ 0x08006490
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _080064A0 @ =0x02029C88
	ldr r0, [r0]
	cmp r0, #0
	beq _08006502
	adds r4, r0, #0
	b _080064A6
	.align 2, 0
_080064A0: .4byte 0x02029C88
_080064A4:
	ldr r4, [r4, #0x38]
_080064A6:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _080064A4
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080064E6
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080064CA
	subs r0, r1, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080064DE
_080064CA:
	adds r0, r4, #0
	bl AnimInterpret
	cmp r0, #1
	bne _080064D6
	movs r5, #1
_080064D6:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080064CA
_080064DE:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _080064A4
_080064E6:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080064F4
	adds r0, r4, #0
	bl AnimDisplayPrivate
_080064F4:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _080064A4
	cmp r5, #1
	bne _08006502
	bl AnimSort
_08006502:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start AnimClearAll
AnimClearAll: @ 0x08006508
	ldr r0, _0800652C @ =0x02028E78
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r2, r0, r1
	ldr r3, _08006530 @ =0x02029C88
	cmp r0, r2
	bhs _08006524
	movs r1, #0
_08006518:
	strh r1, [r0]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	adds r0, #0x48
	cmp r0, r2
	blo _08006518
_08006524:
	movs r0, #0
	str r0, [r3]
	bx lr
	.align 2, 0
_0800652C: .4byte 0x02028E78
_08006530: .4byte 0x02029C88

	thumb_func_start AnimCreate_unused
AnimCreate_unused: @ 0x08006534
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08006588 @ =0x02028E78
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bhs _08006558
	ldrh r0, [r4]
	cmp r0, #0
	beq _08006558
	adds r1, r2, #0
_0800654C:
	adds r4, #0x48
	cmp r4, r1
	bhs _08006558
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800654C
_08006558:
	cmp r4, r2
	beq _0800658C
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl AnimInsert
	adds r0, r4, #0
	b _0800658E
	.align 2, 0
_08006588: .4byte 0x02028E78
_0800658C:
	movs r0, #0
_0800658E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start AnimCreate
AnimCreate: @ 0x08006594
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, _080065EC @ =0x02028E78
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bhs _080065BC
	ldrh r0, [r4]
	cmp r0, #0
	beq _080065BC
	adds r1, r2, #0
_080065B0:
	adds r4, #0x48
	cmp r4, r1
	bhs _080065BC
	ldrh r0, [r4]
	cmp r0, #0
	bne _080065B0
_080065BC:
	cmp r4, r2
	beq _080065F0
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r5, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl AnimInsert
	adds r0, r4, #0
	b _080065F2
	.align 2, 0
_080065EC: .4byte 0x02028E78
_080065F0:
	movs r0, #0
_080065F2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start AnimSort
AnimSort: @ 0x080065F8
	push {r4, r5, lr}
	ldr r4, _08006648 @ =0x02028E78
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	adds r5, r4, #0
	ldr r3, _0800664C @ =0x02029C88
	cmp r4, r0
	bhs _0800661E
	movs r1, #0
	adds r2, r0, #0
_0800660E:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08006618
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
_08006618:
	adds r4, #0x48
	cmp r4, r2
	blo _0800660E
_0800661E:
	movs r0, #0
	str r0, [r3]
	adds r4, r5, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	cmp r4, r0
	bhs _08006642
	adds r5, r0, #0
_08006630:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800663C
	adds r0, r4, #0
	bl AnimInsert
_0800663C:
	adds r4, #0x48
	cmp r4, r5
	blo _08006630
_08006642:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006648: .4byte 0x02028E78
_0800664C: .4byte 0x02029C88

	thumb_func_start AnimDelete
AnimDelete: @ 0x08006650
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	cmp r3, #0
	bne _08006668
	ldr r1, _08006664 @ =0x02029C88
	ldr r0, [r2, #0x38]
	str r0, [r1]
	str r3, [r0, #0x34]
	b _08006672
	.align 2, 0
_08006664: .4byte 0x02029C88
_08006668:
	ldr r0, [r2, #0x38]
	str r0, [r3, #0x38]
	ldr r1, [r2, #0x38]
	ldr r0, [r2, #0x34]
	str r0, [r1, #0x34]
_08006672:
	movs r0, #0
	strh r0, [r2]
	str r0, [r2, #0x34]
	str r0, [r2, #0x38]
	bx lr

	thumb_func_start AnimDisplay
AnimDisplay: @ 0x0800667C
	push {lr}
	bl AnimDisplayPrivate
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AnimInterpret
AnimInterpret: @ 0x08006688
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, [r2, #0x20]
	ldm r0!, {r3}
	str r0, [r2, #0x20]
	cmp r3, #0
	blt _0800669A
	b _080067E8
_0800669A:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	beq _080066D4
	lsrs r1, r3, #0x1c
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	beq _080066B4
	cmp r1, #1
	beq _080066C4
	b _080067FC
_080066B4:
	ldr r0, _080066C0 @ =0x0FFFFFFF
	ands r3, r0
	adds r0, r2, #0
	bl _call_via_r3
	b _080067FC
	.align 2, 0
_080066C0: .4byte 0x0FFFFFFF
_080066C4:
	ldr r0, _080066D0 @ =0x0FFFFFFF
	ands r0, r3
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r1, [r2, #6]
	b _080067FC
	.align 2, 0
_080066D0: .4byte 0x0FFFFFFF
_080066D4:
	lsrs r1, r3, #0x18
	movs r0, #0x3f
	ands r1, r0
	cmp r1, #6
	bls _080066E0
	b _080067FC
_080066E0:
	lsls r0, r1, #2
	ldr r1, _080066EC @ =_080066F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080066EC: .4byte _080066F0
_080066F0: @ jump table
	.4byte _0800670C @ case 0
	.4byte _08006728 @ case 1
	.4byte _08006734 @ case 2
	.4byte _08006740 @ case 3
	.4byte _0800673C @ case 4
	.4byte _0800675C @ case 5
	.4byte _080067BA @ case 6
_0800670C:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	movs r0, #1
	strh r0, [r2, #6]
	ldr r0, _08006724 @ =0x00000FFF
	ldrh r1, [r2, #0xc]
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	b _080067DE
	.align 2, 0
_08006724: .4byte 0x00000FFF
_08006728:
	movs r0, #0
	strh r0, [r2]
	movs r0, #1
	strh r0, [r2, #6]
	movs r4, #1
	b _080067FC
_08006734:
	ldr r0, [r2, #0x24]
	str r0, [r2, #0x20]
	movs r0, #1
	b _080067FA
_0800673C:
	strh r3, [r2, #6]
	b _080067FC
_08006740:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	ldrh r5, [r2, #2]
	adds r0, r5, r0
	strh r0, [r2, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #4]
	adds r0, r1, r0
	strh r0, [r2, #4]
	lsrs r0, r3, #0x10
	movs r1, #0xff
	ands r0, r1
	b _080067FA
_0800675C:
	ldr r0, _0800679C @ =0x00000FFF
	ldrh r5, [r2, #0xc]
	ands r0, r5
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x15
	ldrb r1, [r2, #0x14]
	adds r0, r1, r0
	strb r3, [r0]
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	movs r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	ands r0, r3
	cmp r0, #0x18
	beq _080067B2
	cmp r0, #0x18
	bhi _080067A0
	cmp r0, #1
	blo _080067FC
	cmp r0, #5
	bls _080067B2
	cmp r0, #0x13
	beq _080067B2
	b _080067FC
	.align 2, 0
_0800679C: .4byte 0x00000FFF
_080067A0:
	cmp r0, #0x39
	beq _080067B2
	cmp r0, #0x39
	bhi _080067AE
	cmp r0, #0x2d
	beq _080067B2
	b _080067FC
_080067AE:
	cmp r0, #0x52
	bne _080067FC
_080067B2:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	b _080067FC
_080067BA:
	strh r3, [r2, #6]
	lsrs r0, r3, #0x10
	strb r0, [r2, #0x13]
	ldr r0, [r2, #0x20]
	ldm r0!, {r1}
	str r1, [r2, #0x28]
	str r0, [r2, #0x20]
	ldm r0!, {r1}
	str r0, [r2, #0x20]
	ldr r0, [r2, #0x30]
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldr r0, _080067E4 @ =0x00000FFF
	ldrh r3, [r2, #0xc]
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #6
	adds r1, r5, #0
_080067DE:
	orrs r0, r1
	strh r0, [r2, #0xc]
	b _080067FC
	.align 2, 0
_080067E4: .4byte 0x00000FFF
_080067E8:
	ldr r0, _08006804 @ =0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x3c]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
_080067FA:
	strh r0, [r2, #6]
_080067FC:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006804: .4byte 0x0FFFFFFC

	thumb_func_start AnimInsert
AnimInsert: @ 0x08006808
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _0800681C @ =0x02029C88
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _08006828
_08006816:
	str r2, [r4]
	b _0800684A
	.align 2, 0
_0800681C: .4byte 0x02029C88
_08006820:
	str r0, [r2, #0x38]
	str r1, [r2, #0x34]
	str r2, [r1, #0x38]
	b _0800684A
_08006828:
	ldrh r3, [r2, #0xa]
	b _08006834
_0800682C:
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _08006820
	adds r1, r0, #0
_08006834:
	ldrh r0, [r1, #0xa]
	cmp r3, r0
	bls _0800682C
	ldr r3, [r1, #0x34]
	str r3, [r2, #0x34]
	str r1, [r2, #0x38]
	str r2, [r1, #0x34]
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _08006816
	str r2, [r3, #0x38]
_0800684A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AnimDisplayPrivate
AnimDisplayPrivate: @ 0x08006850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0800695C @ =0x0300291C
	ldrh r0, [r4]
	str r0, [sp]
	ldr r2, [r7, #0x3c]
	cmp r2, #0
	beq _0800694C
	ldr r3, [r2]
	ldr r1, _08006960 @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _080068B0
	ldr r6, _08006964 @ =0x0000FFFF
	ands r6, r3
	cmp r6, #0
	beq _080068B0
	ldr r3, _08006968 @ =0x03003948
_08006880:
	ldr r0, [r3]
	ldrh r1, [r2, #4]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #8]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	subs r6, #1
	adds r2, #0xc
	cmp r6, #0
	bne _08006880
_080068B0:
	adds r5, r2, #0
	ldr r0, [r5]
	cmp r0, #1
	beq _0800694C
	ldr r2, _0800696C @ =0x03002F34
	ldr r0, [r2]
	ldr r1, _08006970 @ =0x03002D30
	mov sl, r1
	cmp r0, sl
	bhs _0800694C
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	movs r1, #0x40
	rsbs r1, r1, #0
	mov r8, r1
	mov ip, r2
_080068D2:
	movs r2, #6
	ldrsh r1, [r5, r2]
	movs r2, #2
	ldrsh r0, [r7, r2]
	adds r3, r1, r0
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r2, #4
	ldrsh r0, [r7, r2]
	adds r4, r1, r0
	cmp r3, sb
	bgt _080068EE
	cmp r3, r8
	bge _080068F2
_080068EE:
	movs r3, #0xc0
	lsls r3, r3, #1
_080068F2:
	cmp r4, #0xa0
	bgt _080068FA
	cmp r4, r8
	bge _080068FE
_080068FA:
	movs r3, #0xc0
	lsls r3, r3, #1
_080068FE:
	ldr r0, _08006974 @ =0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r4, r0
	movs r6, #0
	ldr r1, [r5]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08006918
	ldr r0, [sp]
	lsls r6, r0, #0x19
_08006918:
	ldr r0, [r7, #0x1c]
	adds r6, r6, r0
	mov r0, ip
	ldr r2, [r0]
	adds r0, r1, r6
	lsls r1, r3, #0x10
	orrs r0, r1
	orrs r0, r4
	stm r2!, {r0}
	mov r1, ip
	str r2, [r1]
	ldr r0, _08006978 @ =0x0000F3FF
	ldrh r1, [r5, #4]
	ands r0, r1
	ldrh r1, [r7, #8]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, #4
	mov r0, ip
	str r2, [r0]
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #1
	beq _0800694C
	cmp r2, sl
	blo _080068D2
_0800694C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800695C: .4byte 0x0300291C
_08006960: .4byte 0xFFFF0000
_08006964: .4byte 0x0000FFFF
_08006968: .4byte 0x03003948
_0800696C: .4byte 0x03002F34
_08006970: .4byte 0x03002D30
_08006974: .4byte 0x000001FF
_08006978: .4byte 0x0000F3FF

	thumb_func_start PutSpriteAffine
PutSpriteAffine: @ 0x0800697C
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _080069AC @ =0x03002930
	lsls r0, r0, #4
	adds r4, r0, #3
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r1, [r4]
	adds r1, r0, #7
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080069AC: .4byte 0x03002930

	thumb_func_start ClearSprites
ClearSprites: @ 0x080069B0
	push {r4, r5, r6, lr}
	movs r3, #0xf
	ldr r2, _080069E8 @ =0x0202A48C
	ldr r6, _080069EC @ =0x03004190
	ldr r5, _080069F0 @ =0x02029C8C
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r0, r2, #0
	adds r0, #0xf0
_080069C6:
	str r1, [r0]
	str r4, [r0, #0xc]
	subs r1, #0x10
	subs r0, #0x10
	subs r3, #1
	cmp r3, #0
	bge _080069C6
	adds r0, r2, #0
	adds r0, #0xf0
	movs r1, #0
	str r1, [r0]
	subs r0, #0x30
	str r1, [r0]
	str r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080069E8: .4byte 0x0202A48C
_080069EC: .4byte 0x03004190
_080069F0: .4byte 0x02029C8C

	thumb_func_start PutSprite
PutSprite: @ 0x080069F4
	push {r4, r5, r6, r7, lr}
	ldr r6, _08006A28 @ =0x03004190
	ldr r5, [r6]
	ldr r4, _08006A2C @ =0x0202A48C
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r4, [r0]
	str r4, [r5]
	ldr r7, _08006A30 @ =0x000001FF
	adds r4, r7, #0
	ands r1, r4
	strh r1, [r5, #4]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r5, #6]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r5, #8]
	str r3, [r5, #0xc]
	str r5, [r0]
	adds r5, #0x10
	str r5, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006A28: .4byte 0x03004190
_08006A2C: .4byte 0x0202A48C
_08006A30: .4byte 0x000001FF

	thumb_func_start PutSpriteExt
PutSpriteExt: @ 0x08006A34
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	ldr r6, _08006A5C @ =0x03004190
	ldr r4, [r6]
	ldr r5, _08006A60 @ =0x0202A48C
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r5, [r0]
	str r5, [r4]
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	strh r7, [r4, #8]
	str r3, [r4, #0xc]
	str r4, [r0]
	adds r4, #0x10
	str r4, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006A5C: .4byte 0x03004190
_08006A60: .4byte 0x0202A48C

	thumb_func_start PutSpriteLayerOam
PutSpriteLayerOam: @ 0x08006A64
	push {r4, lr}
	lsls r0, r0, #4
	ldr r1, _08006A90 @ =0x0202A48C
	adds r4, r0, r1
	cmp r4, #0
	beq _08006A8A
_08006A70:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _08006A84
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r3, #6
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, #8]
	bl PutOamHiRam
_08006A84:
	ldr r4, [r4]
	cmp r4, #0
	bne _08006A70
_08006A8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006A90: .4byte 0x0202A48C

	thumb_func_start SpriteRefresher_OnIdle
SpriteRefresher_OnIdle: @ 0x08006A94
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, [r0, #0x54]
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSpriteRefresher
StartSpriteRefresher: @ 0x08006ABC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	beq _08006AD4
	ldr r0, _08006AD0 @ =0x08B90648
	adds r1, r4, #0
	b _08006AD8
	.align 2, 0
_08006AD0: .4byte 0x08B90648
_08006AD4:
	ldr r0, _08006AFC @ =0x08B90648
	movs r1, #3
_08006AD8:
	bl SpawnProc
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x50
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0x54]
	adds r2, r1, #0
	adds r2, #0x52
	ldr r0, [sp, #0x18]
	strh r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006AFC: .4byte 0x08B90648

	thumb_func_start MoveSpriteRefresher
MoveSpriteRefresher: @ 0x08006B00
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bne _08006B10
	ldr r0, _08006B1C @ =0x08B90648
	bl Proc_Find
_08006B10:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006B1C: .4byte 0x08B90648

	thumb_func_start GetFaceInfo
GetFaceInfo: @ 0x08006B20
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08006B30 @ =0x08C96584
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08006B30: .4byte 0x08C96584

	thumb_func_start InitFaces
InitFaces: @ 0x08006B34
	push {r4, lr}
	movs r4, #0
_08006B38:
	adds r0, r4, #0
	bl EndFaceById
	adds r4, #1
	cmp r4, #3
	ble _08006B38
	movs r0, #0
	bl SetFaceConfig
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SetFaceConfig
SetFaceConfig: @ 0x08006B50
	cmp r0, #0
	bne _08006B56
	ldr r0, _08006B70 @ =0x08B90658
_08006B56:
	ldr r2, _08006B74 @ =0x0202A58C
	adds r1, r0, #0
	movs r3, #3
_08006B5C:
	ldr r0, [r1]
	str r0, [r2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #8
	subs r3, #1
	cmp r3, #0
	bge _08006B5C
	bx lr
	.align 2, 0
_08006B70: .4byte 0x08B90658
_08006B74: .4byte 0x0202A58C

	thumb_func_start GetFreeFaceSlot
GetFreeFaceSlot: @ 0x08006B78
	movs r1, #0
	ldr r2, _08006B88 @ =0x030041C0
_08006B7C:
	ldr r0, [r2]
	cmp r0, #0
	bne _08006B8C
	adds r0, r1, #0
	b _08006B98
	.align 2, 0
_08006B88: .4byte 0x030041C0
_08006B8C:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08006B7C
	movs r0, #1
	rsbs r0, r0, #0
_08006B98:
	bx lr
	.align 2, 0

	thumb_func_start Face_OnInit
Face_OnInit: @ 0x08006B9C
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, _08006BBC @ =0x0202A58C
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08006BC0 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08006BBC: .4byte 0x0202A58C
_08006BC0: .4byte 0x06010000

	thumb_func_start sub_08006BC4
sub_08006BC4: @ 0x08006BC4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl GetFaceDisp
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	movs r0, #0xff
	ldrh r1, [r4, #0x36]
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r1, _08006C04 @ =0x000001FF
	ldrh r3, [r4, #0x34]
	ands r1, r3
	ldr r3, [r4, #0x38]
	ldrh r4, [r4, #0x3c]
	str r4, [sp]
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006C04: .4byte 0x000001FF

	thumb_func_start StartFaceAuto
StartFaceAuto: @ 0x08006C08
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl GetFreeFaceSlot
	cmp r0, #0
	blt _08006C2A
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl StartFace
	b _08006C2C
_08006C2A:
	movs r0, #0
_08006C2C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start StartFace
StartFace: @ 0x08006C34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r1, _08006C58 @ =0x030041C0
	lsls r0, r6, #2
	adds r5, r0, r1
	ldr r7, [r5]
	cmp r7, #0
	beq _08006C5C
	movs r0, #0
	b _08006D18
	.align 2, 0
_08006C58: .4byte 0x030041C0
_08006C5C:
	ldr r0, _08006C9C @ =0x08B907C0
	movs r1, #5
	bl SpawnProc
	adds r4, r0, #0
	str r4, [r5]
	mov r0, r8
	bl GetFaceInfo
	adds r5, r0, #0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08006CAC
	str r7, [sp]
	ldr r1, _08006CA0 @ =0x0202A58C
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08006CA4 @ =0x02022A60
	adds r1, r1, r0
	ldr r2, _08006CA8 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _08006CC0
	.align 2, 0
_08006C9C: .4byte 0x08B907C0
_08006CA0: .4byte 0x0202A58C
_08006CA4: .4byte 0x02022A60
_08006CA8: .4byte 0x01000008
_08006CAC:
	ldr r0, [r5, #8]
	ldr r2, _08006CF0 @ =0x0202A58C
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08006CC0:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #5
	strb r0, [r1]
	mov r1, sb
	strh r1, [r4, #0x34]
	mov r0, sl
	strh r0, [r4, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08006CF4
	str r2, [r4, #0x44]
	str r2, [r4, #0x48]
	b _08006D08
	.align 2, 0
_08006CF0: .4byte 0x0202A58C
_08006CF4:
	ldr r0, _08006D28 @ =0x08B908B8
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x44]
	ldr r0, _08006D2C @ =0x08B908D0
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x48]
_08006D08:
	ldr r1, [sp, #0x24]
	mvns r0, r1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl SetFaceDisp
	adds r0, r4, #0
_08006D18:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006D28: .4byte 0x08B908B8
_08006D2C: .4byte 0x08B908D0

	thumb_func_start EndFace
EndFace: @ 0x08006D30
	push {lr}
	ldr r2, _08006D4C @ =0x030041C0
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08006D4C: .4byte 0x030041C0

	thumb_func_start EndFaceById
EndFaceById: @ 0x08006D50
	push {lr}
	ldr r1, _08006D64 @ =0x030041C0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl EndFace
	pop {r0}
	bx r0
	.align 2, 0
_08006D64: .4byte 0x030041C0

	thumb_func_start SetFaceDisp
SetFaceDisp: @ 0x08006D68
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08006D7A
	str r1, [r4, #0x30]
	bl FaceRefreshSprite
	ldr r0, [r4, #0x30]
	b _08006D7C
_08006D7A:
	movs r0, #0
_08006D7C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetFaceDispById
SetFaceDispById: @ 0x08006D84
	push {lr}
	ldr r2, _08006D98 @ =0x030041C0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl SetFaceDisp
	pop {r1}
	bx r1
	.align 2, 0
_08006D98: .4byte 0x030041C0

	thumb_func_start GetFaceDisp
GetFaceDisp: @ 0x08006D9C
	ldr r0, [r0, #0x30]
	bx lr

	thumb_func_start GetFaceDispById
GetFaceDispById: @ 0x08006DA0
	push {lr}
	ldr r1, _08006DB4 @ =0x030041C0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetFaceDisp
	pop {r1}
	bx r1
	.align 2, 0
_08006DB4: .4byte 0x030041C0

	thumb_func_start FaceRefreshSprite
FaceRefreshSprite: @ 0x08006DB8
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x30]
	ldr r0, _08006DE0 @ =0x00000807
	ands r1, r0
	cmp r1, #3
	beq _08006E04
	cmp r1, #3
	bls _08006DE4
	cmp r1, #5
	beq _08006E14
	cmp r1, #5
	blo _08006E0C
	subs r0, #7
	cmp r1, r0
	beq _08006E1C
	adds r0, #1
	cmp r1, r0
	beq _08006E24
	b _08006E28
	.align 2, 0
_08006DE0: .4byte 0x00000807
_08006DE4:
	cmp r1, #1
	beq _08006DF4
	cmp r1, #1
	bhi _08006DFC
	ldr r0, _08006DF0 @ =0x08B90678
	b _08006E26
	.align 2, 0
_08006DF0: .4byte 0x08B90678
_08006DF4:
	ldr r0, _08006DF8 @ =0x08B90692
	b _08006E26
	.align 2, 0
_08006DF8: .4byte 0x08B90692
_08006DFC:
	ldr r0, _08006E00 @ =0x08B906AC
	b _08006E26
	.align 2, 0
_08006E00: .4byte 0x08B906AC
_08006E04:
	ldr r0, _08006E08 @ =0x08B906D2
	b _08006E26
	.align 2, 0
_08006E08: .4byte 0x08B906D2
_08006E0C:
	ldr r0, _08006E10 @ =0x08B906F8
	b _08006E26
	.align 2, 0
_08006E10: .4byte 0x08B906F8
_08006E14:
	ldr r0, _08006E18 @ =0x08B9072A
	b _08006E26
	.align 2, 0
_08006E18: .4byte 0x08B9072A
_08006E1C:
	ldr r0, _08006E20 @ =0x08B9075C
	b _08006E26
	.align 2, 0
_08006E20: .4byte 0x08B9075C
_08006E24:
	ldr r0, _08006E40 @ =0x08B9078E
_08006E26:
	str r0, [r3, #0x38]
_08006E28:
	ldr r1, [r3, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0x80
	beq _08006E52
	cmp r1, #0x80
	bhi _08006E44
	cmp r1, #0x40
	beq _08006E4E
	b _08006E5E
	.align 2, 0
_08006E40: .4byte 0x08B9078E
_08006E44:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08006E58
	b _08006E5E
_08006E4E:
	movs r4, #0
	b _08006E62
_08006E52:
	movs r4, #0x80
	lsls r4, r4, #3
	b _08006E62
_08006E58:
	movs r4, #0xc0
	lsls r4, r4, #4
	b _08006E62
_08006E5E:
	movs r4, #0x80
	lsls r4, r4, #4
_08006E62:
	ldr r1, _08006E88 @ =0x0202A58C
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r2, r2, r1
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r4
	strh r1, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006E88: .4byte 0x0202A58C

	thumb_func_start PutFaceTm
PutFaceTm: @ 0x08006E8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r2
	ldrb r7, [r1]
	adds r1, #1
	ldrb r6, [r1]
	adds r2, r1, #1
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08006ED6
	movs r0, #0
	cmp r0, r6
	bge _08006F10
_08006EAA:
	adds r4, r0, #1
	cmp r7, #0
	beq _08006ECE
	lsls r0, r0, #6
	mov r3, r8
	adds r1, r0, r3
	adds r3, r7, #0
_08006EB8:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08006EC4
	ldrb r0, [r2]
	add r0, ip
	strh r0, [r1]
_08006EC4:
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08006EB8
_08006ECE:
	adds r0, r4, #0
	cmp r0, r6
	blt _08006EAA
	b _08006F10
_08006ED6:
	movs r0, #0
	cmp r0, r6
	bge _08006F10
_08006EDC:
	subs r3, r7, #1
	adds r4, r0, #1
	cmp r3, #0
	blt _08006F0A
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	lsls r1, r3, #1
	lsls r0, r0, #6
	add r0, r8
	adds r1, r1, r0
_08006EF2:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08006F00
	ldrb r0, [r2]
	add r0, ip
	adds r0, r0, r5
	strh r0, [r1]
_08006F00:
	adds r2, #1
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08006EF2
_08006F0A:
	adds r0, r4, #0
	cmp r0, r6
	blt _08006EDC
_08006F10:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnpackFaceChibiGraphics
UnpackFaceChibiGraphics: @ 0x08006F1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08006F50 @ =0x00007EFF
	cmp r4, r0
	ble _08006F58
	adds r0, r4, #0
	bl GetFactionFaceImg
	lsls r1, r5, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	ldr r2, _08006F54 @ =0x0001FFFF
	ands r1, r2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #2
	bl RegisterDataMove
	adds r0, r4, #0
	adds r1, r6, #0
	bl ApplyFactionFacePal
	b _08006F78
	.align 2, 0
_08006F50: .4byte 0x00007EFF
_08006F54: .4byte 0x0001FFFF
_08006F58:
	adds r0, r4, #0
	bl GetFaceInfo
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #8]
	lsls r1, r6, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08006F78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutFaceChibi
PutFaceChibi: @ 0x08006F80
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r5, #0
	bl UnpackFaceChibiGraphics
	ldr r2, _08006FBC @ =0x000003FF
	ands r2, r6
	ldr r1, _08006FC0 @ =0x08B90830
	lsls r5, r5, #0xc
	adds r2, r2, r5
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl PutFaceTm
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006FBC: .4byte 0x000003FF
_08006FC0: .4byte 0x08B90830

	thumb_func_start UnpackFaceChibiSprGraphics
UnpackFaceChibiSprGraphics: @ 0x08006FC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08007054 @ =0xFFFFFE00
	add sp, r4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, _08007058 @ =0x00007EFF
	cmp r6, r0
	ble _08007060
	adds r0, r6, #0
	bl GetFactionFaceImg
	lsls r1, r7, #5
	ldr r5, _0800705C @ =0x0001FFFF
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetFactionFaceImg
	adds r0, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetFactionFaceImg
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #4
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetFactionFaceImg
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	mov r1, r8
	adds r1, #0x10
	adds r0, r6, #0
	bl ApplyFactionFacePal
	b _080070BC
	.align 2, 0
_08007054: .4byte 0xFFFFFE00
_08007058: .4byte 0x00007EFF
_0800705C: .4byte 0x0001FFFF
_08007060:
	adds r0, r6, #0
	bl GetFaceInfo
	adds r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, sp
	bl Decompress
	lsls r1, r7, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	mov r0, sp
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x100
	adds r1, r7, #4
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x180
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, [r5, #8]
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_080070BC:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080070CC
sub_080070CC: @ 0x080070CC
	push {r4, lr}
	sub sp, #4
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	ldr r3, _080070F8 @ =0x03002870
	ldrh r4, [r3, #0x1c]
	subs r1, r1, r4
	movs r4, #0x36
	ldrsh r2, [r0, r4]
	ldrh r3, [r3, #0x1e]
	subs r2, r2, r3
	ldr r3, [r0, #0x38]
	ldrh r0, [r0, #0x3c]
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080070F8: .4byte 0x03002870

	thumb_func_start StartFaceChibiStr
StartFaceChibiStr: @ 0x080070FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #0x24]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl UnpackFaceChibiSprGraphics
	ldr r0, _08007144 @ =0x08B90844
	adds r1, r7, #0
	bl SpawnProc
	adds r1, r0, #0
	mov r0, r8
	strh r0, [r1, #0x34]
	mov r0, sb
	strh r0, [r1, #0x36]
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r6, r6, r4
	strh r6, [r1, #0x3c]
	cmp r5, #0
	beq _0800714C
	ldr r0, _08007148 @ =0x08B90862
	b _0800714E
	.align 2, 0
_08007144: .4byte 0x08B90844
_08007148: .4byte 0x08B90862
_0800714C:
	ldr r0, _0800715C @ =0x08B90854
_0800714E:
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800715C: .4byte 0x08B90854

	thumb_func_start sub_08007160
sub_08007160: @ 0x08007160
	push {lr}
	ldr r0, _0800716C @ =0x08B90844
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800716C: .4byte 0x08B90844

	thumb_func_start PutFace80x72_Standard
PutFace80x72_Standard: @ 0x08007170
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r6, [r2, #0x14]
	subs r6, #1
	ldrb r4, [r2, #0x15]
	ldr r1, _080071C0 @ =0x08195680
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_t
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r2, r4, r5
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080071C0: .4byte 0x08195680

	thumb_func_start PutFace80x72_Raised
PutFace80x72_Raised: @ 0x080071C4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r6, [r2, #0x14]
	subs r6, #1
	ldrb r4, [r2, #0x15]
	subs r4, #1
	ldr r1, _08007218 @ =0x08195738
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_t
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r2, r4, r5
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007218: .4byte 0x08195738

	thumb_func_start ShouldFaceBeRaised
ShouldFaceBeRaised: @ 0x0800721C
	subs r0, #0x1c
	cmp r0, #0x25
	bhi _080072CC
	lsls r0, r0, #2
	ldr r1, _0800722C @ =_08007230
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800722C: .4byte _08007230
_08007230: @ jump table
	.4byte _080072C8 @ case 0
	.4byte _080072CC @ case 1
	.4byte _080072CC @ case 2
	.4byte _080072CC @ case 3
	.4byte _080072CC @ case 4
	.4byte _080072CC @ case 5
	.4byte _080072CC @ case 6
	.4byte _080072CC @ case 7
	.4byte _080072CC @ case 8
	.4byte _080072CC @ case 9
	.4byte _080072CC @ case 10
	.4byte _080072CC @ case 11
	.4byte _080072CC @ case 12
	.4byte _080072CC @ case 13
	.4byte _080072CC @ case 14
	.4byte _080072CC @ case 15
	.4byte _080072CC @ case 16
	.4byte _080072CC @ case 17
	.4byte _080072CC @ case 18
	.4byte _080072CC @ case 19
	.4byte _080072CC @ case 20
	.4byte _080072CC @ case 21
	.4byte _080072CC @ case 22
	.4byte _080072C8 @ case 23
	.4byte _080072CC @ case 24
	.4byte _080072CC @ case 25
	.4byte _080072CC @ case 26
	.4byte _080072CC @ case 27
	.4byte _080072CC @ case 28
	.4byte _080072C8 @ case 29
	.4byte _080072CC @ case 30
	.4byte _080072CC @ case 31
	.4byte _080072CC @ case 32
	.4byte _080072CC @ case 33
	.4byte _080072C8 @ case 34
	.4byte _080072C8 @ case 35
	.4byte _080072CC @ case 36
	.4byte _080072C8 @ case 37
_080072C8:
	movs r0, #1
	b _080072CE
_080072CC:
	movs r0, #0
_080072CE:
	bx lr

	thumb_func_start PutFace80x72_Core
PutFace80x72_Core: @ 0x080072D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	beq _08007380
	adds r0, r5, #0
	bl GetFaceInfo
	adds r4, r0, #0
	ldr r0, [r4, #8]
	lsls r1, r7, #5
	mov r8, r1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r4]
	cmp r0, #0
	beq _08007360
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #8]
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08007338
	lsls r1, r7, #0xc
	ldr r0, _08007334 @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl PutFace80x72_Raised
	b _08007348
	.align 2, 0
_08007334: .4byte 0x000003FF
_08007338:
	lsls r1, r7, #0xc
	ldr r0, _0800735C @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl PutFace80x72_Standard
_08007348:
	movs r2, #0
	mov r0, sb
	movs r1, #5
_0800734E:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge _0800734E
	b _08007380
	.align 2, 0
_0800735C: .4byte 0x000003FF
_08007360:
	ldr r0, [r4, #0x10]
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	lsls r1, r7, #0xc
	ldr r0, _0800738C @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	movs r2, #0xa
	movs r3, #9
	bl PutAppliedBitmap
_08007380:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800738C: .4byte 0x000003FF

	thumb_func_start BgFaceEyeBlink_Init
BgFaceEyeBlink_Init: @ 0x08007390
	movs r2, #0
	str r2, [r0, #0x2c]
	movs r1, #0x78
	str r1, [r0, #0x38]
	strh r2, [r0, #0x32]
	bx lr

	thumb_func_start BgFaceEyeBlink_Delay
BgFaceEyeBlink_Delay: @ 0x0800739C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _080073BC
	adds r0, r4, #0
	bl GetFaceBlinkInterval
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080073BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080073C4
sub_080073C4: @ 0x080073C4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r2, r0, #0xc
	adds r1, r4, #0
	adds r1, #0x40
	ldr r0, _080073FC @ =0x000003FF
	ldrh r1, [r1]
	ands r0, r1
	adds r7, r2, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetFaceInfo
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi _08007468
	lsls r0, r0, #2
	ldr r1, _08007400 @ =_08007404
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080073FC: .4byte 0x000003FF
_08007400: .4byte _08007404
_08007404: @ jump table
	.4byte _08007430 @ case 0
	.4byte _080074B8 @ case 1
	.4byte _080074B8 @ case 2
	.4byte _0800742C @ case 3
	.4byte _080074B8 @ case 4
	.4byte _080074B8 @ case 5
	.4byte _08007430 @ case 6
	.4byte _080074B8 @ case 7
	.4byte _080074B8 @ case 8
	.4byte _08007434 @ case 9
_0800742C:
	movs r6, #0x58
	b _08007468
_08007430:
	movs r6, #0x18
	b _08007468
_08007434:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r3, r4, #0
	adds r3, #0x40
	ldr r2, _08007464 @ =0x000003FF
	ldrh r3, [r3]
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl PutFace80x72_Standard
	ldr r0, [r4, #0x3c]
	bl GetBgFromPtr
	bl EnableBgSyncById
	adds r0, r4, #0
	bl Proc_Break
	b _080074BE
	.align 2, 0
_08007464: .4byte 0x000003FF
_08007468:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetFaceInfo
	adds r5, r0, #0
	ldrb r3, [r5, #0x17]
	lsls r1, r3, #6
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r5, [r5, #0x16]
	lsls r1, r5, #1
	adds r0, r0, r1
	mov ip, r0
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl GetBgFromPtr
	bl EnableBgSyncById
_080074B8:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_080074BE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start PutFace80x72
PutFace80x72: @ 0x080074C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, _080074F4 @ =0x08B90870
	bl Proc_EndEach
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutFace80x72_Core
	mov r0, r8
	bl GetFaceInfo
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080074F4: .4byte 0x08B90870

	thumb_func_start sub_080074F8
sub_080074F8: @ 0x080074F8
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndFace
	pop {r0}
	bx r0

	thumb_func_start EndFaceIn8Frames
EndFaceIn8Frames: @ 0x08007504
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08007518 @ =0x08B908A0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007518: .4byte 0x08B908A0

	thumb_func_start StartFaceFadeIn
StartFaceFadeIn: @ 0x0800751C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3e]
	bl GetFaceInfo
	mov r8, r0
	ldr r6, _08007560 @ =0x0202A58C
	adds r4, r5, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl SetBlackPal
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r4, [r4]
	lsls r1, r4, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r5, #0
	bl StartPalFade
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007560: .4byte 0x0202A58C

	thumb_func_start StartFaceFadeOut
StartFaceFadeOut: @ 0x08007564
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetFaceInfo
	ldr r1, _08007594 @ =0x0202A58C
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl StartPalFadeToBlack
	adds r0, r4, #0
	bl EndFaceIn8Frames
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007594: .4byte 0x0202A58C

	thumb_func_start GetFactionFaceImg
GetFactionFaceImg: @ 0x08007598
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r2, sp
	ldr r1, _080075C0 @ =0x08193DA4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	ldr r1, _080075C4 @ =0xFFFF8100
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080075C0: .4byte 0x08193DA4
_080075C4: .4byte 0xFFFF8100

	thumb_func_start ApplyFactionFacePal
ApplyFactionFacePal: @ 0x080075C8
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	mov r3, sp
	ldr r2, _080075F8 @ =0x08193DC0
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldr r2, [r2]
	str r2, [r3]
	ldr r2, _080075FC @ =0xFFFF8100
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080075F8: .4byte 0x08193DC0
_080075FC: .4byte 0xFFFF8100

	thumb_func_start FaceMouth_Init
FaceMouth_Init: @ 0x08007600
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800760C
sub_0800760C: @ 0x0800760C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne _08007660
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne _08007632
	movs r3, #0x18
_08007632:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _08007658 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _0800765C @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_0801320C
	b _080076D0
	.align 2, 0
_08007658: .4byte 0x000003FF
_0800765C: .4byte 0x06010000
_08007660:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080076D0
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne _0800767E
	movs r5, #0x18
_0800767E:
	bl RandNextB
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080076AA
	cmp r0, #1
	ble _080076B0
	cmp r0, #2
	beq _080076AE
	cmp r0, #3
	bne _080076B0
_080076AA:
	adds r5, #8
	b _080076B0
_080076AE:
	adds r5, #0x10
_080076B0:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _08007750 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08007754 @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_0801320C
_080076D0:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x2c]
	movs r1, #4
	ldrb r2, [r2, #0x14]
	subs r5, r1, r2
	bl GetFaceDisp
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _080076E8
	rsbs r5, r5, #0
_080076E8:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, _08007758 @ =0x000001FF
	ands r5, r1
	bl GetFaceDisp
	ands r0, r6
	cmp r0, #0
	beq _0800770A
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
_0800770A:
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x2c]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _0800775C @ =0x08B905F8
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007750: .4byte 0x000003FF
_08007754: .4byte 0x06010000
_08007758: .4byte 0x000001FF
_0800775C: .4byte 0x08B905F8

	thumb_func_start PutFaceEyeSprite
PutFaceEyeSprite: @ 0x08007760
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov sb, r0
	cmp r5, #1
	beq _0800778E
	cmp r5, #1
	bgt _08007780
	cmp r5, #0
	beq _0800778A
	b _08007856
_08007780:
	cmp r5, #0x80
	beq _08007792
	cmp r5, #0x81
	beq _0800779A
	b _08007856
_0800778A:
	movs r5, #0x58
	b _080077A0
_0800778E:
	movs r5, #0x18
	b _080077A0
_08007792:
	movs r5, #0x58
	movs r1, #1
	mov sb, r1
	b _080077A0
_0800779A:
	movs r5, #0x18
	movs r3, #1
	mov sb, r3
_080077A0:
	ldr r0, [r7, #0x2c]
	ldr r2, [r0, #0x2c]
	movs r1, #4
	ldrb r2, [r2, #0x16]
	subs r4, r1, r2
	bl GetFaceDisp
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _080077BA
	rsbs r4, r4, #0
_080077BA:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, _08007838 @ =0x000001FF
	ands r4, r1
	bl GetFaceDisp
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080077DE
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
_080077DE:
	ldr r0, [r7, #0x2c]
	bl GetFaceDisp
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	rsbs r0, r0, #0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r2, r3]
	ldr r1, [r2, #0x2c]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r6, r6, r0
	mov r0, sb
	cmp r0, #0
	beq _08007840
	adds r0, r2, #0
	bl GetFaceDisp
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0800781A
	adds r4, #0x10
_0800781A:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _0800783C @ =0x08B905B8
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	b _08007856
	.align 2, 0
_08007838: .4byte 0x000001FF
_0800783C: .4byte 0x08B905B8
_08007840:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08007864 @ =0x08B905F8
	ldrh r2, [r2, #0x3c]
	adds r1, r2, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
_08007856:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007864: .4byte 0x08B905F8

	thumb_func_start FaceEye_Init
FaceEye_Init: @ 0x08007868
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl GetFaceBlinkInterval
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _080078A0
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _080078A8 @ =0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_Goto
_080078A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080078A8: .4byte 0x7FFFFFFF

	thumb_func_start FaceEye_Delay
FaceEye_Delay: @ 0x080078AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _080078C8
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_Goto
	b _080078DE
_080078C8:
	cmp r0, #0
	bge _080078DE
	adds r0, r4, #0
	bl GetFaceBlinkInterval
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080078DE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start FaceEye_PreSwitch
FaceEye_PreSwitch: @ 0x080078E4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _0800793C
	lsls r0, r0, #2
	ldr r1, _080078FC @ =_08007900
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080078FC: .4byte _08007900
_08007900: @ jump table
	.4byte _08007930 @ case 0
	.4byte _08007930 @ case 1
	.4byte _08007930 @ case 2
	.4byte _0800792C @ case 3
	.4byte _0800792C @ case 4
	.4byte _0800792C @ case 5
	.4byte _08007930 @ case 6
	.4byte _08007930 @ case 7
	.4byte _08007930 @ case 8
	.4byte _0800793C @ case 9
	.4byte _08007934 @ case 10
_0800792C:
	movs r5, #0
	b _0800793C
_08007930:
	movs r5, #1
	b _0800793C
_08007934:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0800793C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutFaceEyeSprite
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08007950
sub_08007950: @ 0x08007950
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start FaceEye_DisplayFrame0
FaceEye_DisplayFrame0: @ 0x08007958
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _0800796C
	adds r0, r4, #0
	bl FaceEye_PreSwitch
	b _08007984
_0800796C:
	adds r0, r4, #0
	movs r1, #0
	bl PutFaceEyeSprite
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007984
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08007984:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800798C
sub_0800798C: @ 0x0800798C
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start FaceEye_DisplayFrame1
FaceEye_DisplayFrame1: @ 0x08007994
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _080079A8
	adds r0, r4, #0
	bl FaceEye_PreSwitch
	b _080079C0
_080079A8:
	adds r0, r4, #0
	movs r1, #1
	bl PutFaceEyeSprite
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080079C0
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080079C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080079C8
sub_080079C8: @ 0x080079C8
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start FaceEye_DisplayFrameFlip
FaceEye_DisplayFrameFlip: @ 0x080079D0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08007A2C
	lsls r0, r0, #2
	ldr r1, _080079E8 @ =_080079EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080079E8: .4byte _080079EC
_080079EC: @ jump table
	.4byte _08007A1C @ case 0
	.4byte _08007A1C @ case 1
	.4byte _08007A1C @ case 2
	.4byte _08007A18 @ case 3
	.4byte _08007A18 @ case 4
	.4byte _08007A18 @ case 5
	.4byte _08007A1C @ case 6
	.4byte _08007A1C @ case 7
	.4byte _08007A1C @ case 8
	.4byte _08007A2C @ case 9
	.4byte _08007A20 @ case 10
_08007A18:
	movs r5, #0
	b _08007A2C
_08007A1C:
	movs r5, #1
	b _08007A2C
_08007A20:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
	strh r0, [r4, #0x32]
_08007A2C:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl PutFaceEyeSprite
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetFaceBlinkControl
SetFaceBlinkControl: @ 0x08007A44
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _08007A50
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
_08007A50:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl GetFaceBlinkInterval
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetFaceBlinkControlById
SetFaceBlinkControlById: @ 0x08007A64
	push {lr}
	ldr r2, _08007A78 @ =0x030041C0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl SetFaceBlinkControl
	pop {r0}
	bx r0
	.align 2, 0
_08007A78: .4byte 0x030041C0

	thumb_func_start GetFaceBlinkInterval
GetFaceBlinkInterval: @ 0x08007A7C
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #0x30]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _08007AD0
	lsls r0, r0, #2
	ldr r1, _08007A9C @ =_08007AA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007A9C: .4byte _08007AA0
_08007AA0: @ jump table
	.4byte _08007ABE @ case 0
	.4byte _08007AC4 @ case 1
	.4byte _08007AB4 @ case 2
	.4byte _08007ACA @ case 3
	.4byte _08007ACE @ case 4
_08007AB4:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _08007AD0
_08007ABE:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _08007AD0
_08007AC4:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _08007AD0
_08007ACA:
	movs r0, #1
	b _08007AD0
_08007ACE:
	ldr r0, _08007AD8 @ =0x7FFFFFFF
_08007AD0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007AD8: .4byte 0x7FFFFFFF

	thumb_func_start SetFaceEyeState
SetFaceEyeState: @ 0x08007ADC
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007AE4
sub_08007AE4: @ 0x08007AE4
	push {lr}
	ldr r2, _08007AF8 @ =0x030041C0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl SetFaceEyeState
	pop {r0}
	bx r0
	.align 2, 0
_08007AF8: .4byte 0x030041C0

	thumb_func_start sub_08007AFC
sub_08007AFC: @ 0x08007AFC
	push {r4, r5, lr}
	ldr r2, _08007B1C @ =0x030041C0
	ldr r0, [r2]
	ldr r4, [r0, #0x48]
	ldr r1, _08007B20 @ =0x08B857F8
	ldr r0, [r1]
	movs r3, #1
	ldrh r0, [r0, #4]
	ands r3, r0
	adds r5, r1, #0
	cmp r3, #0
	beq _08007B24
	movs r0, #2
	strh r0, [r4, #0x32]
	b _08007B26
	.align 2, 0
_08007B1C: .4byte 0x030041C0
_08007B20: .4byte 0x08B857F8
_08007B24:
	strh r3, [r4, #0x32]
_08007B26:
	ldr r0, [r2, #8]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08007B3C
	movs r0, #3
_08007B3C:
	strh r0, [r4, #0x32]
	ldr r0, [r2, #4]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08007B54
	movs r0, #4
	strh r0, [r4, #0x32]
_08007B54:
	ldr r0, [r2, #0xc]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08007B6A
	movs r0, #4
	strh r0, [r4, #0x32]
_08007B6A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08007B70
sub_08007B70: @ 0x08007B70
	push {lr}
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0
	movs r3, #0x13
	bl StartFaceAuto
	movs r1, #3
	bl SetFaceBlinkControl
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0x50
	movs r3, #0x1b
	bl StartFaceAuto
	movs r1, #1
	bl SetFaceBlinkControl
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x12
	bl StartFaceAuto
	movs r1, #2
	bl SetFaceBlinkControl
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0x50
	movs r3, #0x1a
	bl StartFaceAuto
	movs r1, #4
	bl SetFaceBlinkControl
	ldr r0, _08007BC8 @ =0x08B90970
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_08007BC8: .4byte 0x08B90970

	thumb_func_start StartBmFace
StartBmFace: @ 0x08007BCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _08007BF0 @ =0x030041C0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _08007BF4
	movs r0, #0
	b _08007CDA
	.align 2, 0
_08007BF0: .4byte 0x030041C0
_08007BF4:
	ldr r0, _08007C34 @ =0x08B907F8
	movs r1, #5
	bl SpawnProc
	adds r5, r0, #0
	str r5, [r4]
	mov r0, sb
	bl GetFaceInfo
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08007C44
	str r6, [sp]
	ldr r0, _08007C38 @ =0x0202A58C
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08007C3C @ =0x02022A60
	adds r1, r1, r0
	ldr r2, _08007C40 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _08007C5A
	.align 2, 0
_08007C34: .4byte 0x08B907F8
_08007C38: .4byte 0x0202A58C
_08007C3C: .4byte 0x02022A60
_08007C40: .4byte 0x01000008
_08007C44:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _08007CA0 @ =0x0202A58C
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08007C5A:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, sb
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl FaceRefreshSprite
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _08007CB2
	cmp r1, #0x80
	bgt _08007CA4
	cmp r1, #0x40
	beq _08007CAE
	b _08007CBE
	.align 2, 0
_08007CA0: .4byte 0x0202A58C
_08007CA4:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08007CB8
	b _08007CBE
_08007CAE:
	movs r3, #0
	b _08007CC2
_08007CB2:
	movs r3, #0x80
	lsls r3, r3, #3
	b _08007CC2
_08007CB8:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _08007CC2
_08007CBE:
	movs r3, #0x80
	lsls r3, r3, #4
_08007CC2:
	ldr r2, _08007CEC @ =0x0202A58C
	adds r2, r4, r2
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08007CDA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007CEC: .4byte 0x0202A58C

	thumb_func_start SetFacePosition
SetFacePosition: @ 0x08007CF0
	ldr r3, _08007D00 @ =0x030041C0
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
_08007D00: .4byte 0x030041C0

	thumb_func_start sub_08007D04
sub_08007D04: @ 0x08007D04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _08007D14
	bl TryLockProc
_08007D14:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007D20
	bl TryLockProc
_08007D20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007D28
sub_08007D28: @ 0x08007D28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetFaceInfo
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _08007D78 @ =0x0202A58C
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _08007D7C @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007D78: .4byte 0x0202A58C
_08007D7C: .4byte 0x06010000

	thumb_func_start sub_08007D80
sub_08007D80: @ 0x08007D80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08007DA4
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl TryUnlockProc
_08007DA4:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007DB0
	bl TryUnlockProc
_08007DB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007DB8
sub_08007DB8: @ 0x08007DB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08007DD0 @ =0x08B90980
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007DD0: .4byte 0x08B90980

	thumb_func_start ClearTalkFaceRefs
ClearTalkFaceRefs: @ 0x08007DD4
	push {r4, lr}
	movs r2, #0
	ldr r4, _08007DF4 @ =0x08B909B8
	movs r3, #0
_08007DDC:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08007DDC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007DF4: .4byte 0x08B909B8

	thumb_func_start InitTalk
InitTalk: @ 0x08007DF8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08007E7C @ =0x030000E8
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007E80 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl InitTextFont
	bl SetInitTalkTextFont
	ldr r0, _08007E84 @ =0x08B909B8
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08007E4E
	ldr r4, _08007E88 @ =0x030000C8
	adds r5, r6, #0
_08007E36:
	adds r0, r4, #0
	movs r1, #0x1e
	bl InitText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08007E36
_08007E4E:
	cmp r7, #0
	beq _08007E70
	ldr r4, _08007E8C @ =0x083FBD34
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007E90 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08007E94 @ =0x083FBFD0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
_08007E70:
	bl ClearTalkFaceRefs
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007E7C: .4byte 0x030000E8
_08007E80: .4byte 0x000003FF
_08007E84: .4byte 0x08B909B8
_08007E88: .4byte 0x030000C8
_08007E8C: .4byte 0x083FBD34
_08007E90: .4byte 0x06000200
_08007E94: .4byte 0x083FBFD0

	thumb_func_start InitSpriteTalk
InitSpriteTalk: @ 0x08007E98
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08007F28 @ =0x030000E8
	ldr r1, _08007F2C @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08007F30 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl InitSpriteTextFont
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _08007F34 @ =0x08194694
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08007F38 @ =0x02022860
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007F3C @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007F40 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08007F44 @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08007F48 @ =0x08B909B8
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08007F20
_08007EF8:
	lsls r4, r5, #3
	ldr r0, _08007F4C @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, r6
	blt _08007EF8
_08007F20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007F28: .4byte 0x030000E8
_08007F2C: .4byte 0x000003FF
_08007F30: .4byte 0x06010000
_08007F34: .4byte 0x08194694
_08007F38: .4byte 0x02022860
_08007F3C: .4byte 0x00007247
_08007F40: .4byte 0x000031AE
_08007F44: .4byte 0x00007FFF
_08007F48: .4byte 0x08B909B8
_08007F4C: .4byte 0x030000C8

	thumb_func_start sub_08007F50
sub_08007F50: @ 0x08007F50
	push {lr}
	ldr r0, _08007F60 @ =0x08194674
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08007F60: .4byte 0x08194674

	thumb_func_start SetInitTalkTextFont
SetInitTalkTextFont: @ 0x08007F64
	push {lr}
	ldr r0, _08007F74 @ =0x030000E8
	bl SetTextFont
	bl InitTalkTextFont
	pop {r0}
	bx r0
	.align 2, 0
_08007F74: .4byte 0x030000E8

	thumb_func_start StartTalkExt
StartTalkExt: @ 0x08007F78
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08008000 @ =0x08B909B8
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl GetTextPrintDelay
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl SetActiveTalkFace
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08008008
	ldr r0, _08008004 @ =0x08B909D4
	movs r1, #3
	bl SpawnProc
	b _08008010
	.align 2, 0
_08008000: .4byte 0x08B909B8
_08008004: .4byte 0x08B909D4
_08008008:
	ldr r0, _08008018 @ =0x08B909D4
	adds r1, r7, #0
	bl SpawnProcLocking
_08008010:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008018: .4byte 0x08B909D4

	thumb_func_start StartTalkMsg
StartTalkMsg: @ 0x0800801C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartTalkExt
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartTalkMsgExt
StartTalkMsgExt: @ 0x0800803C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl StartTalkExt
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start StartTalk
StartTalk: @ 0x0800805C
	push {lr}
	movs r3, #0
	bl StartTalkExt
	pop {r1}
	bx r1

	thumb_func_start EndTalk
EndTalk: @ 0x08008068
	push {lr}
	ldr r0, _08008074 @ =0x08B909D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08008074: .4byte 0x08B909D4

	thumb_func_start SetTalkLines
SetTalkLines: @ 0x08008078
	ldr r1, _08008080 @ =0x08B909B8
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08008080: .4byte 0x08B909B8

	thumb_func_start ResetTalkFlags
ResetTalkFlags: @ 0x08008084
	ldr r0, _08008090 @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08008090: .4byte 0x08B909B8

