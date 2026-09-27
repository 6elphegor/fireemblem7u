	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802E190
sub_0802E190: @ 0x0802E190
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r0, _0802E204 @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E208 @ =OnVBlank
	bl SetOnVBlank
	bl ResetBmSt
	ldr r4, _0802E20C @ =0x0202BBF8
	ldrb r0, [r4, #0x12]
	ldrb r1, [r4, #0x13]
	bl SetMapCursorPosition
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	ldr r4, _0802E210 @ =0x0202BBB8
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl StartMapMain
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	ldr r0, _0802E214 @ =0x0203A85C
	ldrb r0, [r0, #0x16]
	cmp r0, #9
	bhi _0802E26A
	lsls r0, r0, #2
	ldr r1, _0802E218 @ =_0802E21C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E204: .4byte OnMain
_0802E208: .4byte OnVBlank
_0802E20C: .4byte 0x0202BBF8
_0802E210: .4byte 0x0202BBB8
_0802E214: .4byte 0x0203A85C
_0802E218: .4byte _0802E21C
_0802E21C: @ jump table
	.4byte _0802E24C @ case 0
	.4byte _0802E244 @ case 1
	.4byte _0802E24C @ case 2
	.4byte _0802E254 @ case 3
	.4byte _0802E25C @ case 4
	.4byte _0802E26A @ case 5
	.4byte _0802E26A @ case 6
	.4byte _0802E26A @ case 7
	.4byte _0802E26A @ case 8
	.4byte _0802E264 @ case 9
_0802E244:
	adds r0, r5, #0
	bl ResumeMapMainDuringAction
	b _0802E26A
_0802E24C:
	adds r0, r5, #0
	bl ResumeMapMainDuringPhase
	b _0802E26A
_0802E254:
	adds r0, r5, #0
	bl ResumeMapMainDuringBerserk
	b _0802E26A
_0802E25C:
	adds r0, r5, #0
	bl ResumeMapMainDuringArena
	b _0802E26A
_0802E264:
	adds r0, r5, #0
	bl ResumeMapMainDuringPhaseChange
_0802E26A:
	ldr r2, _0802E294 @ =0x030028AC
	ldr r0, _0802E298 @ =0x0000FFE0
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
	movs r0, #0
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	movs r0, #0x10
	strb r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E294: .4byte 0x030028AC
_0802E298: .4byte 0x0000FFE0
