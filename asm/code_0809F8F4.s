	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F8F4
sub_0809F8F4: @ 0x0809F8F4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F908
	movs r0, #0
	b _0809F91C
_0809F908:
	mov r0, sp
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	bl SetLang
	mov r0, sp
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
_0809F91C:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0
