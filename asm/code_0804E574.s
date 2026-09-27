	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E574
sub_0804E574: @ 0x0804E574
	push {r4, r5, lr}
	ldr r3, _0804E5A4 @ =0x02000000
	ldr r4, [r3]
	rsbs r1, r1, #0
	ldr r2, _0804E5A8 @ =0x02000028
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r5, [r2, #2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r2, [r2, #2]
	adds r1, r2, r1
	strh r1, [r4, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E5A4: .4byte 0x02000000
_0804E5A8: .4byte 0x02000028
