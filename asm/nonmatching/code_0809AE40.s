	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AE40
sub_0809AE40: @ 0x0809AE40
	push {lr}
	sub sp, #0x10
	ldr r1, _0809AE78 @ =0x00000F84
	str r1, [r0, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r1, [sp]
	ldr r0, _0809AE7C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AE80 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809AE78: .4byte 0x00000F84
_0809AE7C: .4byte 0x06011000
_0809AE80: .4byte 0x0004004E
