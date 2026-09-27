	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079280
sub_08079280: @ 0x08079280
	push {r4, lr}
	ldr r4, _080792A4 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	adds r1, r0, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #3
	bne _080792AC
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	beq _080792A8
	ldr r0, [r1, #0x34]
	b _080792BC
	.align 2, 0
_080792A4: .4byte 0x0202BBF8
_080792A8:
	ldr r0, [r1, #0x30]
	b _080792BC
_080792AC:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _080792BA
	ldr r0, [r1, #0x28]
	b _080792BC
_080792BA:
	ldr r0, [r1, #0x2c]
_080792BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
