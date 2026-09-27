	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginHOpenText
ChapterIntro_BeginHOpenText: @ 0x0801F910
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0801F948 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _0801F94C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801F944
	movs r0, #0x61
	bl m4aSongNumStart
_0801F944:
	pop {r0}
	bx r0
	.align 2, 0
_0801F948: .4byte 0x03002870
_0801F94C: .4byte 0x0202BBF8
