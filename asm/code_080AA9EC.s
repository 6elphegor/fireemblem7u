	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgXOffset
GetBgXOffset: @ 0x080AA9EC
	cmp r0, #1
	beq _080AAA10
	cmp r0, #1
	bgt _080AA9FA
	cmp r0, #0
	beq _080AAA04
	b _080AAA2C
_080AA9FA:
	cmp r0, #2
	beq _080AAA1C
	cmp r0, #3
	beq _080AAA28
	b _080AAA2C
_080AAA04:
	ldr r0, _080AAA0C @ =0x03002870
	ldrh r0, [r0, #0x1c]
	b _080AAA2C
	.align 2, 0
_080AAA0C: .4byte 0x03002870
_080AAA10:
	ldr r0, _080AAA18 @ =0x03002870
	ldrh r0, [r0, #0x20]
	b _080AAA2C
	.align 2, 0
_080AAA18: .4byte 0x03002870
_080AAA1C:
	ldr r0, _080AAA24 @ =0x03002870
	ldrh r0, [r0, #0x24]
	b _080AAA2C
	.align 2, 0
_080AAA24: .4byte 0x03002870
_080AAA28:
	ldr r0, _080AAA30 @ =0x03002870
	ldrh r0, [r0, #0x28]
_080AAA2C:
	bx lr
	.align 2, 0
_080AAA30: .4byte 0x03002870
