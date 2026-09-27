	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DDD0
sub_0803DDD0: @ 0x0803DDD0
	push {r4, lr}
	ldr r4, _0803DDF0 @ =0x0203DA0C
	adds r0, r4, #0
	bl ReadMultiArenaSaveConfig
	movs r0, #8
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	bl WriteMultiArenaSaveConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDF0: .4byte 0x0203DA0C
