	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099928
sub_08099928: @ 0x08099928
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, [r4, #0x30]
	str r0, [sp]
	ldr r0, _08099964 @ =0x06011000
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099964: .4byte 0x06011000
