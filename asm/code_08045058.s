	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045058
sub_08045058: @ 0x08045058
	push {r4, r5, lr}
	movs r0, #0
	bl InitBgs
	bl ClearSioBG
	bl sub_08044F3C
	bl sub_08044F74
	ldr r4, _08045104 @ =0x0203DC9C
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, _08045108 @ =0x0203D90C
	strb r5, [r0, #0xb]
	ldr r0, _0804510C @ =0x08B99BC4
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_08044B34
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
_08045090:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge _08045090
	movs r4, #0
	ldr r0, _08045110 @ =0x03001400
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, _08045114 @ =0x03001414
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl SetMapCursorPosition
	ldr r0, _08045118 @ =0x0202BBB8
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl RefreshUnitSprites
	bl LoadLinkArenaFogPlaceholder
	bl sub_08046B48
	ldr r0, _0804511C @ =0x08B961A8
	movs r1, #4
	bl Proc_Start
	bl StartBmVSync
	bl sub_08044FFC
	ldr r1, _08045120 @ =0x0202BBF8
	movs r0, #0xbf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045104: .4byte 0x0203DC9C
_08045108: .4byte 0x0203D90C
_0804510C: .4byte 0x08B99BC4
_08045110: .4byte 0x03001400
_08045114: .4byte 0x03001414
_08045118: .4byte 0x0202BBB8
_0804511C: .4byte 0x08B961A8
_08045120: .4byte 0x0202BBF8
