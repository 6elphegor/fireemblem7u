	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2D80
sub_080B2D80: @ 0x080B2D80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B2DA0 @ =0x08CE7280
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B2DA4 @ =0x08C9D00C
	ldr r1, _080B2DA8 @ =ShowMu
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2DA0: .4byte 0x08CE7280
_080B2DA4: .4byte 0x08C9D00C
_080B2DA8: .4byte ShowMu
