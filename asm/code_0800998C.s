	.include "macro.inc"

	.syntax unified

	thumb_func_start StartOpenTalkBubble
StartOpenTalkBubble: @ 0x0800998C
	push {lr}
	ldr r0, _080099A0 @ =0x08B90B8C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080099A0: .4byte 0x08B90B8C
