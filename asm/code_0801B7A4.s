	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_ClearDraw
DebugMenu_ClearDraw: @ 0x0801B7A4
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801B808 @ =0x00001250
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0801B80C @ =0x00001251
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawString
	bl GetGlobalCompletionCount
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B810 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B808: .4byte 0x00001250
_0801B80C: .4byte 0x00001251
_0801B810: .4byte 0x02022C60
