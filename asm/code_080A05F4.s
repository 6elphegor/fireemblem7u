	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadLastGameSaveId
ReadLastGameSaveId: @ 0x080A05F4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0612
	mov r0, sp
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _080A0612
	cmp r0, #0
	bge _080A0614
_080A0612:
	movs r0, #0
_080A0614:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0
