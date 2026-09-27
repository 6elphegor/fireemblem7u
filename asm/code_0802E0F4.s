	.include "macro.inc"

	.syntax unified

	thumb_func_start RestartBattleMap
RestartBattleMap: @ 0x0802E0F4
	push {r4, r5, lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _0802E178 @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E17C @ =OnVBlank
	bl SetOnVBlank
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl InitTraps
	ldr r4, _0802E180 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	movs r5, #0
	strb r0, [r4, #0x15]
	bl InitBmBgLayers
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl InitMapObstacles
	bl LoadChapterTraps
	bl BMapVSync_End
	bl StartBmVSync
	ldr r0, _0802E184 @ =0x08B961A8
	movs r1, #4
	bl Proc_Start
	ldr r0, _0802E188 @ =0x02022860
	strh r5, [r0]
	bl EnablePalSync
	ldr r2, _0802E18C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E178: .4byte OnMain
_0802E17C: .4byte OnVBlank
_0802E180: .4byte 0x0202BBF8
_0802E184: .4byte 0x08B961A8
_0802E188: .4byte 0x02022860
_0802E18C: .4byte 0x03002870
