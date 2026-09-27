	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCFCC
sub_080BCFCC: @ 0x080BCFCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080BCFE4 @ =0x08CEF3EC
	bl Proc_Start
	strh r4, [r0, #0x2c]
	strh r5, [r0, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFE4: .4byte 0x08CEF3EC
