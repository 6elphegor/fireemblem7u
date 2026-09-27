	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckSomethingSaveRelated
CheckSomethingSaveRelated: @ 0x08042428
	push {r4, lr}
	sub sp, #0x48
	movs r4, #0
_0804242E:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042452
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042452
	movs r0, #1
	b _0804245A
_08042452:
	adds r4, #1
	cmp r4, #2
	ble _0804242E
	movs r0, #0
_0804245A:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
