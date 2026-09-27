	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808A61C
sub_0808A61C: @ 0x0808A61C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A644
	ldr r1, _0808A6C4 @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl sub_809014C
_0808A644:
	ldr r2, _0808A6C8 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r2, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0808A66E
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2, #0x19]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x19]
_0808A66E:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0808A67E
	bl Proc_End
_0808A67E:
	bl EndGreenText
	ldr r0, _0808A6CC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0808A6D0 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0808A6D4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	ldr r2, _0808A6D8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bl ResetTextFont
	bl ClearIcons
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6C4: .4byte 0x0200CBF0
_0808A6C8: .4byte 0x0202BBF8
_0808A6CC: .4byte 0x02022C60
_0808A6D0: .4byte 0x02023460
_0808A6D4: .4byte 0x02023C60
_0808A6D8: .4byte 0x03002870
