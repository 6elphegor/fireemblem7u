	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CB3C
sub_0807CB3C: @ 0x0807CB3C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r5, r0, #0
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #8
	movs r2, #0x11
	movs r3, #4
	bl DrawUiFrame2
	ldr r0, _0807CBD0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807CB74
	ldr r0, _0807CBD4 @ =0x0000037B
	bl m4aSongNumStart
_0807CB74:
	ldr r0, _0807CBD8 @ =0x000012CE
	bl DecodeMsg
	ldr r4, _0807CBDC @ =0x02022EA2
	adds r1, r4, #0
	adds r1, #0xe
	movs r2, #0x10
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0x28
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumber
	ldr r0, _0807CBE0 @ =0x000012CF
	bl DecodeMsg
	adds r4, #0x2a
	movs r1, #8
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r1, r6, #0
	adds r1, #0x4c
	movs r0, #0x78
	strh r0, [r1]
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CBD0: .4byte 0x0202BBF8
_0807CBD4: .4byte 0x0000037B
_0807CBD8: .4byte 0x000012CE
_0807CBDC: .4byte 0x02022EA2
_0807CBE0: .4byte 0x000012CF
