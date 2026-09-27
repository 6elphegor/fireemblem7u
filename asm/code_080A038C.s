	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGlobalCompletionCntByInfo
GetGlobalCompletionCntByInfo: @ 0x080A038C
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x14
_080A0394:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A039E
	adds r2, #1
_080A039E:
	adds r1, #1
	cmp r1, #0xb
	ble _080A0394
	adds r0, r2, #0
	bx lr
