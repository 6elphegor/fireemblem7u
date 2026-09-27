	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADA90
sub_080ADA90: @ 0x080ADA90
	push {lr}
	ldr r0, _080ADAD0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080ADAD4 @ =0x02023460
	movs r1, #0
	bl TmFill
	bl sub_080ACF08
	movs r0, #3
	bl EnableBgSync
	ldr r2, _080ADAD8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0
_080ADAD0: .4byte 0x02022C60
_080ADAD4: .4byte 0x02023460
_080ADAD8: .4byte 0x03002870
