	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800931C
sub_0800931C: @ 0x0800931C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08009364 @ =0x08B909B8
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _08009368 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl TalkBgSync
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _0800936C
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b _08009382
	.align 2, 0
_08009364: .4byte 0x08B909B8
_08009368: .4byte 0x02022C60
_0800936C:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt _0800937A
	lsls r1, r1, #4
	b _0800937C
_0800937A:
	lsls r1, r0, #4
_0800937C:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
_08009382:
	pop {r4, r5}
	pop {r0}
	bx r0
