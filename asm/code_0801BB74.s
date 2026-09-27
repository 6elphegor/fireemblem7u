	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BB74
sub_0801BB74: @ 0x0801BB74
	push {r4, lr}
	adds r4, r1, #0
	bl GetGameTime
	bl RandInit
	bl InitUnits
	ldr r0, _0801BBA0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801BBA4
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl WriteNewGameSave
	b _0801BBAE
	.align 2, 0
_0801BBA0: .4byte 0x08B857F8
_0801BBA4:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl WriteNewGameSave
_0801BBAE:
	ldr r0, _0801BBD8 @ =0x0000055B
	bl DecodeMsg
	bl SetTacticianName
	ldr r1, _0801BBDC @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	movs r0, #0
	bl WriteGameSave
	bl CleanupUnitsBeforeChapter
	bl sub_08012B88
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BBD8: .4byte 0x0000055B
_0801BBDC: .4byte 0x0202BBF8
