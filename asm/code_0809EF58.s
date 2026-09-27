	.include "macro.inc"

	.syntax unified

	thumb_func_start GGM_IsAnyCharacterKnown
GGM_IsAnyCharacterKnown: @ 0x0809EF58
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	cmp r4, #0
	bne _0809EF6A
	mov r4, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809EF6A:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x40
_0809EF70:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809EF7C
	movs r0, #1
	b _0809EF84
_0809EF7C:
	adds r1, #1
	cmp r1, #0x1f
	ble _0809EF70
	movs r0, #0
_0809EF84:
	add sp, #0x64
	pop {r4}
	pop {r1}
	bx r1
