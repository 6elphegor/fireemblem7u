	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLastSuspendSaveId
GetLastSuspendSaveId: @ 0x080A1918
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r0, sp
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A1930
	movs r0, #0
	b _080A1932
_080A1930:
	movs r0, #1
_080A1932:
	add sp, #0x64
	pop {r1}
	bx r1
