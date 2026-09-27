	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079990
sub_08079990: @ 0x08079990
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0807999C @ =0x08C9F9EC
	b _080799AA
	.align 2, 0
_0807999C: .4byte 0x08C9F9EC
_080799A0:
	cmp r1, r0
	bne _080799A8
	ldr r0, [r2, #4]
	b _080799BE
_080799A8:
	adds r2, #8
_080799AA:
	ldrb r1, [r2]
	cmp r1, #0
	bne _080799A0
	ldr r0, _080799C4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x14]
_080799BE:
	pop {r1}
	bx r1
	.align 2, 0
_080799C4: .4byte 0x0202BBF8
