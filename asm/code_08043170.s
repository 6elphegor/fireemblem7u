	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043170
sub_08043170: @ 0x08043170
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _08043192
	bl InitGlobalSaveInfo
	bl ResetFe6LinkSaveInfo
	bl EraseSaveRankData
	bl EraseSoundRoomSaveData
	bl EraseLinkArenaStruct2
	b _0804319A
_08043192:
	adds r0, r4, #0
	movs r1, #1
	bl EventGotoLabel
_0804319A:
	pop {r4}
	pop {r0}
	bx r0
