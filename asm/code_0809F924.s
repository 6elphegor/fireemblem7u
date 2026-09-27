	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F924
sub_0809F924: @ 0x0809F924
	push {lr}
	movs r0, #0
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F936
	bl InitGlobalSaveInfo
_0809F936:
	movs r0, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F946
	bl EraseBonusContentData
_0809F946:
	movs r0, #0
	bl ReadFe6LinkSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F956
	bl ResetFe6LinkSaveInfo
_0809F956:
	movs r0, #0
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F966
	bl EraseSaveRankData
_0809F966:
	movs r0, #0
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F976
	bl sub_0809F668
_0809F976:
	movs r0, #0
	bl LoadAndVerfyLinkArenaStruct2
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F986
	bl EraseLinkArenaStruct2
_0809F986:
	pop {r0}
	bx r0
	.align 2, 0
