	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A0178
sub_080A0178: @ 0x080A0178
	movs r0, #0
	ldr r2, _080A018C @ =0x0203E7A0
	movs r1, #0x45
_080A017E:
	ldrb r3, [r2]
	adds r0, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A017E
	bx lr
	.align 2, 0
_080A018C: .4byte 0x0203E7A0
