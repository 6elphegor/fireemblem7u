	.include "macro.inc"

	.syntax unified

	thumb_func_start SetChapterFlag
SetChapterFlag: @ 0x08079764
	adds r3, r0, #0
	cmp r3, #0
	beq _0807978C
	subs r3, #1
	ldr r1, _08079790 @ =0x03004AD8
	adds r0, r3, #0
	cmp r3, #0
	bge _08079776
	adds r0, r3, #7
_08079776:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079794 @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_0807978C:
	bx lr
	.align 2, 0
_08079790: .4byte 0x03004AD8
_08079794: .4byte 0x08C9EAEC
