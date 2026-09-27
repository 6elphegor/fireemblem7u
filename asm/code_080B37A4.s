	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B37A4
sub_080B37A4: @ 0x080B37A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B37C0 @ =0x08CE7568
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	str r5, [r0, #0x38]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B37C0: .4byte 0x08CE7568
