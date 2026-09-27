	.include "macro.inc"

	.syntax unified

	thumb_func_start AiWaitAndClearScreenAction
AiWaitAndClearScreenAction: @ 0x080357B8
	push {lr}
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080357C6
	movs r0, #0
	b _080357DE
_080357C6:
	ldr r0, _080357E4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080357E8 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	movs r0, #1
_080357DE:
	pop {r1}
	bx r1
	.align 2, 0
_080357E4: .4byte 0x02022C60
_080357E8: .4byte 0x02023460
