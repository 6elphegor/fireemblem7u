	.include "macro.inc"

	.syntax unified

	thumb_func_start IsPlaythroughIdUnique
IsPlaythroughIdUnique: @ 0x080A031C
	push {r4, r5, r6, lr}
	sub sp, #0xac
	adds r6, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r4, #0
	add r1, sp, #0x14
_080A032C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080A0358
	adds r4, #1
	cmp r4, #0xb
	ble _080A032C
	movs r4, #0
	add r5, sp, #0x64
_080A033E:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A035C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ReadGameSavePlaySt
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne _080A035C
_080A0358:
	movs r0, #0
	b _080A0364
_080A035C:
	adds r4, #1
	cmp r4, #2
	ble _080A033E
	movs r0, #1
_080A0364:
	add sp, #0xac
	pop {r4, r5, r6}
	pop {r1}
	bx r1
