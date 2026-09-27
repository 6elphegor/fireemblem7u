	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080128F0
sub_080128F0: @ 0x080128F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08012906
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0801292A
_08012906:
	movs r0, #0
	bl InitPlayConfig
	ldr r4, _08012930 @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl ResetPermanentFlags
	bl ResetChapterFlags
	bl InitUnits
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
_0801292A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012930: .4byte 0x0202BBF8
