	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgYOffset
GetBgYOffset: @ 0x080AAA34
	cmp r0, #1
	beq _080AAA58
	cmp r0, #1
	bgt _080AAA42
	cmp r0, #0
	beq _080AAA4C
	b _080AAA74
_080AAA42:
	cmp r0, #2
	beq _080AAA64
	cmp r0, #3
	beq _080AAA70
	b _080AAA74
_080AAA4C:
	ldr r0, _080AAA54 @ =0x03002870
	ldrh r0, [r0, #0x1e]
	b _080AAA74
	.align 2, 0
_080AAA54: .4byte 0x03002870
_080AAA58:
	ldr r0, _080AAA60 @ =0x03002870
	ldrh r0, [r0, #0x22]
	b _080AAA74
	.align 2, 0
_080AAA60: .4byte 0x03002870
_080AAA64:
	ldr r0, _080AAA6C @ =0x03002870
	ldrh r0, [r0, #0x26]
	b _080AAA74
	.align 2, 0
_080AAA6C: .4byte 0x03002870
_080AAA70:
	ldr r0, _080AAA78 @ =0x03002870
	ldrh r0, [r0, #0x2a]
_080AAA74:
	bx lr
	.align 2, 0
_080AAA78: .4byte 0x03002870
