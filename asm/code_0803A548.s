	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A548
sub_0803A548: @ 0x0803A548
	adds r1, r0, #0
	ldr r0, _0803A574 @ =0x03004690
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	ldrb r0, [r0, #0x11]
	ldrb r3, [r1]
	cmp r3, r2
	bhi _0803A57C
	ldrb r3, [r1, #2]
	cmp r3, r2
	blo _0803A57C
	ldrb r2, [r1, #1]
	cmp r2, r0
	bhi _0803A57C
	ldrb r1, [r1, #3]
	cmp r1, r0
	blo _0803A57C
	ldr r0, _0803A578 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
	b _0803A582
	.align 2, 0
_0803A574: .4byte 0x03004690
_0803A578: .4byte 0x0203A8EC
_0803A57C:
	ldr r0, _0803A588 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #0
_0803A582:
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0803A588: .4byte 0x0203A8EC
