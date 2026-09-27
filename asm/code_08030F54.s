	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030F54
sub_08030F54: @ 0x08030F54
	push {r4, r5, lr}
	adds r5, r0, #0
	bl HandlePlayerMapCursor
	ldr r0, _08030FB0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08030FC4
	bl EndAllMus
	ldr r0, _08030FB4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r1, _08030FB8 @ =0x0202BBB8
	movs r0, #0xf7
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, _08030FBC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030FA4
	ldr r0, _08030FC0 @ =0x0000038B
	bl m4aSongNumStart
_08030FA4:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0803106E
	.align 2, 0
_08030FB0: .4byte 0x08B857F8
_08030FB4: .4byte 0x03004690
_08030FB8: .4byte 0x0202BBB8
_08030FBC: .4byte 0x0202BBF8
_08030FC0: .4byte 0x0000038B
_08030FC4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031018
	ldr r2, _08031074 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _08031078 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0803107C @ =0x0202BD4C
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _08030FF6
	ldr r0, _08031080 @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_08030FF6:
	cmp r4, #0
	beq _08031018
	bl EndAllMus
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
_08031018:
	ldr r0, _08031084 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803105E
	ldr r0, _08031080 @ =0x03004690
	ldr r0, [r0]
	cmp r0, #0
	beq _0803105E
	ldr r4, _0803107C @ =0x0202BD4C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetMapCursorPosition
	ldr r0, _08031088 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803105E
	ldr r0, _0803108C @ =0x0000038B
	bl m4aSongNumStart
_0803105E:
	ldr r1, _08031074 @ =0x0202BBB8
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl PutMapCursor
_0803106E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031074: .4byte 0x0202BBB8
_08031078: .4byte 0x0202E3DC
_0803107C: .4byte 0x0202BD4C
_08031080: .4byte 0x03004690
_08031084: .4byte 0x08B857F8
_08031088: .4byte 0x0202BBF8
_0803108C: .4byte 0x0000038B
