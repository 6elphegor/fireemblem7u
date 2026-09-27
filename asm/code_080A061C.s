	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A061C
sub_080A061C: @ 0x080A061C
	push {r4, r5, lr}
	sub sp, #0x58
	adds r5, r0, #0
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0644
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl ReadSuspendSavePlaySt
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne _080A0644
	movs r0, #3
	bl InvalidateSuspendSave
_080A0644:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl WriteSaveBlockInfo
	add sp, #0x58
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
