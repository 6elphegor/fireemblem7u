	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B8D4
sub_0801B8D4: @ 0x0801B8D4
	push {lr}
	bl WriteCompletedPlaythroughSaveData
	ldr r0, _0801B8FC @ =0x0202BBF8
	movs r1, #0xef
	ldrb r2, [r0, #0x14]
	ands r1, r2
	strb r1, [r0, #0x14]
	bl CleanupUnitsBeforeChapter
	bl ReadLastGameSaveId
	bl WriteGameSave
	movs r0, #0xff
	bl SoftReset
	pop {r1}
	bx r1
	.align 2, 0
_0801B8FC: .4byte 0x0202BBF8
