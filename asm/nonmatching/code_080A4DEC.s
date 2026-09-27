	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4DEC
sub_080A4DEC: @ 0x080A4DEC
	push {lr}
	adds r2, r0, #0
	ldr r1, _080A4E08 @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A4E04
	adds r0, r2, #0
	movs r1, #0x14
	bl Proc_Goto
_080A4E04:
	pop {r0}
	bx r0
	.align 2, 0
_080A4E08: .4byte 0x0202BBB8
