	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A47EC
sub_080A47EC: @ 0x080A47EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A4820 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _080A4824 @ =0x00000103
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A481A
	ldr r0, _080A4828 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4810
	ldr r0, _080A482C @ =0x00000391
	bl m4aSongNumStart
_080A4810:
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_080A481A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4820: .4byte 0x08B857F8
_080A4824: .4byte 0x00000103
_080A4828: .4byte 0x0202BBF8
_080A482C: .4byte 0x00000391
