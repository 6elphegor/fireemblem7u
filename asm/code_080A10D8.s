	.include "macro.inc"

	.syntax unified

	thumb_func_start InvalidateSuspendSave
InvalidateSuspendSave: @ 0x080A10D8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r4, #0
	bl WriteSaveBlockInfo
	cmp r4, #3
	bne _080A10F8
	mov r0, sp
	movs r1, #4
	bl WriteSaveBlockInfo
_080A10F8:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
