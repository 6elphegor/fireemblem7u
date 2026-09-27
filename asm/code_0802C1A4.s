	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C1A4
sub_0802C1A4: @ 0x0802C1A4
	push {r4, r5, lr}
	ldr r4, _0802C1BC @ =0x0202BBF8
	ldrb r5, [r4, #0xf]
	movs r0, #0x80
	strb r0, [r4, #0xf]
	bl RefreshEntityMaps
	strb r5, [r4, #0xf]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C1BC: .4byte 0x0202BBF8
