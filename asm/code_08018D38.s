	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCharacterData
GetCharacterData: @ 0x08018D38
	adds r1, r0, #0
	cmp r1, #0
	ble _08018D4C
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _08018D48 @ =0x08BDCE18
	adds r0, r0, r1
	b _08018D4E
	.align 2, 0
_08018D48: .4byte 0x08BDCE18
_08018D4C:
	movs r0, #0
_08018D4E:
	bx lr
