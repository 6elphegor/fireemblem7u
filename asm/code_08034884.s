	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034884
sub_08034884: @ 0x08034884
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #2
	beq _080348A2
	cmp r0, #2
	bgt _08034896
	cmp r0, #1
	beq _0803489E
	b _080348A6
_08034896:
	cmp r0, #3
	bne _080348A6
	movs r2, #1
	b _080348A8
_0803489E:
	movs r2, #2
	b _080348A8
_080348A2:
	movs r2, #3
	b _080348A8
_080348A6:
	movs r2, #0
_080348A8:
	ldr r0, _080348BC @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080348CA
	cmp r0, #2
	bgt _080348C0
	cmp r0, #1
	beq _080348C6
	b _080348D2
	.align 2, 0
_080348BC: .4byte 0x0202BBF8
_080348C0:
	cmp r0, #3
	beq _080348CE
	b _080348D2
_080348C6:
	movs r1, #1
	b _080348D4
_080348CA:
	movs r1, #2
	b _080348D4
_080348CE:
	movs r1, #3
	b _080348D4
_080348D2:
	movs r1, #4
_080348D4:
	movs r0, #0
	cmp r2, r1
	bne _080348DC
	movs r0, #1
_080348DC:
	bx lr
	.align 2, 0
