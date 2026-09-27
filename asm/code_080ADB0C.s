	.include "macro.inc"

	.syntax unified

	thumb_func_start GetOptionMenuLayoutId
GetOptionMenuLayoutId: @ 0x080ADB0C
	ldr r3, _080ADB2C @ =0x020144F4
	ldr r0, _080ADB30 @ =0x08CE583C
	ldr r0, [r0]
	movs r1, #0x32
	ldrsh r2, [r0, r1]
	ldr r1, _080ADB34 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080ADB24
	adds r2, #3
_080ADB24:
	strh r2, [r3]
	movs r1, #0
	ldrsh r0, [r3, r1]
	bx lr
	.align 2, 0
_080ADB2C: .4byte 0x020144F4
_080ADB30: .4byte 0x08CE583C
_080ADB34: .4byte 0x0202BBF8
