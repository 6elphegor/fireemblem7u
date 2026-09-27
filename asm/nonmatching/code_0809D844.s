	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D844
sub_0809D844: @ 0x0809D844
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _0809D878 @ =0x02014404
	ldr r0, [r1]
	cmp r4, r0
	bge _0809D870
	ldr r6, _0809D87C @ =0x02014438
	adds r5, r1, #0
_0809D854:
	ldr r0, [r5]
	adds r0, r4, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r2, r4, r6
	ldrb r1, [r2]
	strb r1, [r0]
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	cmp r4, r0
	blt _0809D854
_0809D870:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D878: .4byte 0x02014404
_0809D87C: .4byte 0x02014438
