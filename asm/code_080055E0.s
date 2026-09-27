	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBlankText
PutBlankText: @ 0x080055E0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080055FA
	movs r3, #0
	adds r2, r0, #0
_080055EA:
	strh r3, [r1]
	adds r0, r1, #0
	adds r0, #0x40
	strh r3, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080055EA
_080055FA:
	bx lr
