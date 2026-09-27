	.include "macro.inc"

	.syntax unified

	thumb_func_start MetaSave_SetMetCharacter
MetaSave_SetMetCharacter: @ 0x0809EECC
	push {r4, r5, lr}
	sub sp, #0x64
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bgt _0809EF0C
	cmp r5, #0
	bne _0809EEEC
	mov r5, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r3, #1
_0809EEEC:
	asrs r0, r4, #3
	adds r2, r5, #0
	adds r2, #0x40
	adds r2, r2, r0
	movs r1, #7
	ands r1, r4
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r3, #0
	beq _0809EF0C
	adds r0, r5, #0
	bl WriteGlobalSaveInfo
_0809EF0C:
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0
