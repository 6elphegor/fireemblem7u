	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcFun_ResetCursorPosition
ProcFun_ResetCursorPosition: @ 0x0801D708
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r4, _0801D72C @ =0x0202BBF8
	ldrb r0, [r4, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801D730
	adds r0, r5, #0
	bl Proc_End
	b _0801D772
	.align 2, 0
_0801D72C: .4byte 0x0202BBF8
_0801D730:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x40
	beq _0801D750
	cmp r0, #0x40
	bgt _0801D740
	cmp r0, #0
	beq _0801D746
	b _0801D758
_0801D740:
	cmp r0, #0x80
	beq _0801D750
	b _0801D758
_0801D746:
	add r1, sp, #4
	mov r0, sp
	bl GetPlayerStartCursorPosition
	b _0801D758
_0801D750:
	add r1, sp, #4
	mov r0, sp
	bl GetEnemyStartCursorPosition
_0801D758:
	ldr r1, [sp]
	cmp r1, #0
	blt _0801D772
	ldr r2, [sp, #4]
	cmp r2, #0
	blt _0801D772
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl SetMapCursorPosition
_0801D772:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
