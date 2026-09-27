	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809BA48
sub_0809BA48: @ 0x0809BA48
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809BA78 @ =0x06013000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl StartCgText
	ldr r0, _0809BA7C @ =0x000008FC
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809BA78: .4byte 0x06013000
_0809BA7C: .4byte 0x000008FC
