	.include "macro.inc"

	.syntax unified

	thumb_func_start IsGameSaveNotFirstChapter
IsGameSaveNotFirstChapter: @ 0x080A0A30
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0A54
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl sub_080A0A10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A0A56
_080A0A54:
	movs r0, #0
_080A0A56:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
