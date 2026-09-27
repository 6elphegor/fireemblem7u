	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleMap
StartBattleMap: @ 0x0802E028
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitBgs
	ldr r0, _0802E0DC @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E0E0 @ =OnVBlank
	bl SetOnVBlank
	bl ResetBmSt
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetChapterFlags
	bl ResetUnitSprites
	bl InitTraps
	ldr r4, _0802E0E4 @ =0x0202BBF8
	movs r5, #0
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r6, #0
	strh r5, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	bl InitBmBgLayers
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl InitMapObstacles
	bl GetGameTime
	str r0, [r4, #4]
	strh r5, [r4, #0x16]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl LoadChapterTraps
	mov r0, r8
	bl StartMapMain
	ldr r0, _0802E0E8 @ =0x02022860
	strh r5, [r0]
	bl EnablePalSync
	ldr r2, _0802E0EC @ =0x030028AC
	ldr r0, _0802E0F0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	strb r6, [r2, #8]
	strb r6, [r2, #9]
	movs r0, #0x10
	strb r0, [r2, #0xa]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E0DC: .4byte OnMain
_0802E0E0: .4byte OnVBlank
_0802E0E4: .4byte 0x0202BBF8
_0802E0E8: .4byte 0x02022860
_0802E0EC: .4byte 0x030028AC
_0802E0F0: .4byte 0x0000FFE0
