	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040E08
sub_08040E08: @ 0x08040E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, _08040EC4 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, _08040EC8 @ =0x0203DC24
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, _08040ECC @ =0x0203D90C
	ldrb r0, [r0, #3]
	ldr r4, _08040ED0 @ =0x08B99084
	ldr r1, [r4]
	bl sub_080A1C10
	movs r6, #0
	ldr r0, _08040ED4 @ =0x0203DCC0
	mov sl, r0
	movs r7, #0x14
_08040E42:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, _08040ED0 @ =0x08B99084
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_08040DCC
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne _08040E80
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08040EC4 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
_08040E80:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble _08040E42
	ldr r2, _08040EC4 @ =0x08B98AEC
	mov r3, sb
	adds r3, #0x64
	mov r4, sb
	adds r4, #0x4c
	ldr r0, _08040ECC @ =0x0203D90C
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
_08040E9A:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _08040E9A
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040EC4: .4byte 0x08B98AEC
_08040EC8: .4byte 0x0203DC24
_08040ECC: .4byte 0x0203D90C
_08040ED0: .4byte 0x08B99084
_08040ED4: .4byte 0x0203DCC0
