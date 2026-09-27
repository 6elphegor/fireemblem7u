	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterTitle
GetChapterTitle: @ 0x080824A4
	adds r1, r0, #0
	cmp r1, #0
	bne _080824AE
	movs r0, #0x4a
	b _080824D0
_080824AE:
	movs r0, #0x20
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080824BC
	movs r0, #0x4b
	b _080824D0
_080824BC:
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	beq _080824C8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	b _080824D0
_080824C8:
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	movs r1, #0x80
	orrs r0, r1
_080824D0:
	bx lr
	.align 2, 0
