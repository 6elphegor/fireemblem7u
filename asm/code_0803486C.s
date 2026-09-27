	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCurrentPromotedLevelBonus
GetCurrentPromotedLevelBonus: @ 0x0803486C
	ldr r1, _0803487C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08034880
	movs r0, #9
	b _08034882
	.align 2, 0
_0803487C: .4byte 0x0202BBF8
_08034880:
	movs r0, #0x13
_08034882:
	bx lr
