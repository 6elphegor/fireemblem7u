	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809EAB8
sub_0809EAB8: @ 0x0809EAB8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EAD8
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _0809EAD8
	movs r0, #1
	b _0809EADA
_0809EAD8:
	movs r0, #0
_0809EADA:
	add sp, #0x64
	pop {r1}
	bx r1
