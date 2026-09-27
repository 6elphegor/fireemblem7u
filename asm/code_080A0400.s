	.include "macro.inc"

	.syntax unified

	thumb_func_start SavePlayThroughData
SavePlayThroughData: @ 0x080A0400
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A041A
	bl InitGlobalSaveInfo
	mov r0, sp
	bl ReadGlobalSaveInfo
_080A041A:
	mov r1, sp
	movs r0, #2
	ldrb r2, [r1, #0xe]
	orrs r0, r2
	strb r0, [r1, #0xe]
	mov r0, sp
	bl WriteGlobalSaveInfo
	add sp, #0x64
	pop {r0}
	bx r0
