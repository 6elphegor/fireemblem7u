	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4FE4
sub_080B4FE4: @ 0x080B4FE4
	push {r4, lr}
	adds r4, r0, #0
	bl EndTalk
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl InitSpriteTalk
	ldr r0, _080B502C @ =0x02000815
	ldrb r0, [r0]
	lsrs r1, r0, #3
	adds r1, #1
	movs r0, #1
	adds r2, r4, #0
	bl StartTalkMsg
	movs r0, #4
	bl SetTalkPrintDelay
	movs r0, #0x20
	bl SetTalkFlag
	movs r0, #0x80
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetTalkFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B502C: .4byte 0x02000815
