	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009588
sub_08009588: @ 0x08009588
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080095C0 @ =0x08B909B8
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _080095C4 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl TalkBgSync
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080095C0: .4byte 0x08B909B8
_080095C4: .4byte 0x02022C60
