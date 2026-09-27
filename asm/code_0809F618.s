	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveEndgameRankings
SaveEndgameRankings: @ 0x0809F618
	push {r4, r5, r6, lr}
	sub sp, #0x30
	bl GetNextChapterMode
	adds r6, r0, #0
	ldr r0, _0809F664 @ =0x0202BBF8
	ldrb r0, [r0, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	add r5, sp, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl GenerateGameRankSaveData
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0809F224
	mov r0, sp
	adds r1, r5, #0
	bl JudgeGameRankSaveData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F65A
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl SaveNewRankData
_0809F65A:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F664: .4byte 0x0202BBF8
