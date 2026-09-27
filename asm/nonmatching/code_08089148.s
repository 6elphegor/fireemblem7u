	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089148
sub_08089148: @ 0x08089148
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl EndGreenText
	ldr r2, _08089188 @ =0x03002870
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
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808918C
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	b _08089192
	.align 2, 0
_08089188: .4byte 0x03002870
_0808918C:
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
_08089192:
	ldr r1, _080891CC @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	ldr r1, _080891D0 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r2, r4, #0
	adds r2, #0x32
	ldrb r2, [r2]
	adds r0, r2, r0
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080891CC: .4byte 0x0200CBF0
_080891D0: .4byte 0x0202BBF8
