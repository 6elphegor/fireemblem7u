	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809EA58
sub_0809EA58: @ 0x0809EA58
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA6C
	movs r0, #0
	b _0809EA74
_0809EA6C:
	mov r0, sp
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
_0809EA74:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0
