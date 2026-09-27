	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteLastGameSaveId
WriteLastGameSaveId: @ 0x080A05D4
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl WriteGlobalSaveInfoNoChecksum
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0
