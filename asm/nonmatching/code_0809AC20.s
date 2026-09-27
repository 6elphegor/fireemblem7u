	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AC20
sub_0809AC20: @ 0x0809AC20
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809AC38 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809AC40
	ldr r0, _0809AC3C @ =0x00000FBF
	b _0809AC44
	.align 2, 0
_0809AC38: .4byte 0x0202BBF8
_0809AC3C: .4byte 0x00000FBF
_0809AC40:
	movs r0, #0xfc
	lsls r0, r0, #4
_0809AC44:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809AC74 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AC78 @ =0x0006000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809AC74: .4byte 0x06011000
_0809AC78: .4byte 0x0006000A
