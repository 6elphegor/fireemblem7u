	.include "macro.inc"

	.syntax unified

	thumb_func_start GGM_IsCharacterKnown
GGM_IsCharacterKnown: @ 0x0809EF14
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0809EF4A
	cmp r4, #0
	bne _0809EF30
	mov r4, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809EF30:
	asrs r0, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r0, #7
	ands r0, r5
	ldrb r1, [r1]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809EF4E
_0809EF4A:
	movs r0, #0
	b _0809EF50
_0809EF4E:
	movs r0, #1
_0809EF50:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
