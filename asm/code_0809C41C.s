	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809C41C
sub_0809C41C: @ 0x0809C41C
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809C448 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	movs r0, #0x4e
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809C448: .4byte 0x06011000
