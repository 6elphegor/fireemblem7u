	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080992F4
sub_080992F4: @ 0x080992F4
	push {lr}
	ldr r1, _08099310 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0809930A
	bl GetChapterDivinationTextIdHectorStory
	cmp r0, #0
	bne _08099314
_0809930A:
	movs r0, #0
	b _08099316
	.align 2, 0
_08099310: .4byte 0x0202BBF8
_08099314:
	movs r0, #1
_08099316:
	pop {r1}
	bx r1
	.align 2, 0
