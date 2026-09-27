	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_8021188
ChapterIntro_8021188: @ 0x080200D8
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0802010C
	bl ColorFadeTick_thm
	ldr r0, _08020114 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020102
	bl ApplyFlamesWeatherGradient
_08020102:
	bl EnableTilesetPalAnim
	adds r0, r4, #0
	bl Proc_Break
_0802010C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020114: .4byte 0x0202BBF8
