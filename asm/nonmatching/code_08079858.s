	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckChapterFlag
CheckChapterFlag: @ 0x08079858
	adds r3, r0, #0
	cmp r3, #0x64
	ble _08079882
	subs r3, #0x65
	ldr r1, _08079888 @ =0x03004AD0
	adds r0, r3, #0
	cmp r3, #0
	bge _0807986A
	adds r0, r3, #7
_0807986A:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _0807988C @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _08079890
_08079882:
	movs r0, #0
	b _08079892
	.align 2, 0
_08079888: .4byte 0x03004AD0
_0807988C: .4byte 0x08C9EAEC
_08079890:
	movs r0, #1
_08079892:
	bx lr
