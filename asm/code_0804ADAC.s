	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804ADAC
sub_0804ADAC: @ 0x0804ADAC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804ADD6
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #4
	bl PutMapCursor
	b _0804AE72
_0804ADD6:
	adds r0, r4, #0
	bl sub_0804AF34
	adds r0, r4, #0
	bl TargetSelection_HandleSelectInput
	adds r5, r0, #0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0804ADF2
	adds r0, r4, #0
	bl EndTargetSelection
_0804ADF2:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0804AE0C
	ldr r0, _0804AE7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE0C
	ldr r0, _0804AE80 @ =0x0000038A
	bl m4aSongNumStart
_0804AE0C:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0804AE26
	ldr r0, _0804AE7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE26
	ldr r0, _0804AE84 @ =0x0000038B
	bl m4aSongNumStart
_0804AE26:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0804AE32
	bl ClearUi
_0804AE32:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0804AE40
	movs r0, #0
	bl EndFaceById
_0804AE40:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0804AE72
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r1, [sp]
	asrs r1, r1, #4
	ldr r2, [sp, #4]
	asrs r2, r2, #4
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804AE72
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #2
	bl PutMapCursor
_0804AE72:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE7C: .4byte 0x0202BBF8
_0804AE80: .4byte 0x0000038A
_0804AE84: .4byte 0x0000038B
