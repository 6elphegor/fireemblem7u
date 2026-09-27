	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1068
sub_080B1068: @ 0x080B1068
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B1088 @ =0x08CE7280
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B108C @ =0x08C9D00C
	ldr r1, _080B1090 @ =ShowMu
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1088: .4byte 0x08CE7280
_080B108C: .4byte 0x08C9D00C
_080B1090: .4byte ShowMu
