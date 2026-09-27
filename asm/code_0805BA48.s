	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BA48
sub_0805BA48: @ 0x0805BA48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BA70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BA74 @ =0x08BA2C28
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA70: .4byte 0x0201774C
_0805BA74: .4byte 0x08BA2C28
