	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E9FC
sub_0809E9FC: @ 0x0809E9FC
	push {r4, r5, lr}
	sub sp, #0x64
	movs r4, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EA4C
	mov r0, sp
	bl GetGlobalCompletionCntByInfo
	adds r5, r0, #0
	bl CheckLinkedToFE6
	rsbs r1, r0, #0
	orrs r1, r0
	asrs r4, r1, #0x1f
	movs r0, #2
	ands r4, r0
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA4C
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0809EA3A
	movs r4, #0xf
_0809EA3A:
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809EA46
	orrs r4, r2
_0809EA46:
	cmp r5, #4
	ble _0809EA4C
	orrs r4, r2
_0809EA4C:
	adds r0, r4, #0
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
