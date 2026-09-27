	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08018504
sub_08018504: @ 0x08018504
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0801851E
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
	strb r1, [r4, #0x10]
	strb r2, [r4, #0x11]
_0801851E:
	pop {r4}
	pop {r0}
	bx r0
