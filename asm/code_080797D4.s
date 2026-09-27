	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearChapterFlag
ClearChapterFlag: @ 0x080797D4
	adds r2, r0, #0
	cmp r2, #0
	beq _08079802
	subs r2, #1
	ldr r3, _08079804 @ =0x08C9EAEC
	adds r1, r2, #0
	cmp r2, #0
	bge _080797E6
	adds r1, r2, #7
_080797E6:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08079808 @ =0x03004AD8
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_08079802:
	bx lr
	.align 2, 0
_08079804: .4byte 0x08C9EAEC
_08079808: .4byte 0x03004AD8
