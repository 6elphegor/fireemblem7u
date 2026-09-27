	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D758
sub_0803D758: @ 0x0803D758
	push {lr}
	ldr r2, _0803D77C @ =0x08B98AEC
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_0803C294
	pop {r0}
	bx r0
	.align 2, 0
_0803D77C: .4byte 0x08B98AEC
