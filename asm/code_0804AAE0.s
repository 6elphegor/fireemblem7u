	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804AAE0
sub_0804AAE0: @ 0x0804AAE0
	push {lr}
	ldr r0, _0804AAFC @ =0x08B9A8A0
	bl Proc_Find
	cmp r0, #0
	beq _0804AAF8
	adds r1, r0, #0
	adds r1, #0x63
	movs r0, #0xbf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0804AAF8:
	pop {r0}
	bx r0
	.align 2, 0
_0804AAFC: .4byte 0x08B9A8A0
