	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D8DC
sub_0805D8DC: @ 0x0805D8DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D908 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D90C @ =0x08BA31C0
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0805D910 @ =0x081E8DE2
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805D918
	ldr r0, _0805D914 @ =0x0826D3D4
	b _0805D91A
	.align 2, 0
_0805D908: .4byte 0x0201774C
_0805D90C: .4byte 0x08BA31C0
_0805D910: .4byte 0x081E8DE2
_0805D914: .4byte 0x0826D3D4
_0805D918:
	ldr r0, _0805D924 @ =0x0826D5D4
_0805D91A:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D924: .4byte 0x0826D5D4
