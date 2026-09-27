	.include "macro.inc"

	.syntax unified

	thumb_func_start StartStatScreen
StartStatScreen: @ 0x0808149C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _080814E4 @ =0x0200310C
	movs r5, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r4, _080814E8 @ =0x0202BBF8
	movs r1, #3
	ldrb r7, [r4, #0x14]
	ands r1, r7
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r5, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PidStatsAddStatView
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	cmp r0, #0
	blt _080814D4
	ldr r0, _080814EC @ =0x0000038A
	bl m4aSongNumStart
_080814D4:
	ldr r0, _080814F0 @ =0x08CC1F6C
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080814E4: .4byte 0x0200310C
_080814E8: .4byte 0x0202BBF8
_080814EC: .4byte 0x0000038A
_080814F0: .4byte 0x08CC1F6C
