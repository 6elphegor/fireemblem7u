	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_StartBmBgfxAnim
Title_StartBmBgfxAnim: @ 0x080BA6D8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _080BA754 @ =HBlank_TitleScreen
	bl SetOnHBlankA
	adds r0, r4, #0
	movs r1, #0
	bl Title_InitSpriteAnim
	adds r0, r4, #0
	bl Title_InitBg
	ldr r0, _080BA758 @ =0x08CEFA40
	movs r5, #0
	str r5, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r2, _080BA75C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0xe
	bl EnableBgSync
	ldr r0, _080BA760 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BA744
	movs r0, #0x63
	bl m4aSongNumStart
_080BA744:
	adds r0, r4, #0
	adds r0, #0x50
	strb r5, [r0]
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA754: .4byte HBlank_TitleScreen
_080BA758: .4byte 0x08CEFA40
_080BA75C: .4byte 0x03002870
_080BA760: .4byte 0x0202BBF8
