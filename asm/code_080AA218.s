	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeInOut_DisableGfx
FadeInOut_DisableGfx: @ 0x080AA218
	ldr r1, [r0, #0x34]
	ldr r0, _080AA240 @ =0x0000FFFF
	cmp r1, r0
	bne _080AA248
	ldr r2, _080AA244 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	b _080AA264
	.align 2, 0
_080AA240: .4byte 0x0000FFFF
_080AA244: .4byte 0x03002870
_080AA248:
	ldr r2, _080AA268 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
_080AA264:
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080AA268: .4byte 0x03002870
