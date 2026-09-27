	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809ABC0
sub_0809ABC0: @ 0x0809ABC0
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809ABD8 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809ABE0
	ldr r0, _0809ABDC @ =0x00000FBD
	b _0809ABE2
	.align 2, 0
_0809ABD8: .4byte 0x0202BBF8
_0809ABDC: .4byte 0x00000FBD
_0809ABE0:
	ldr r0, _0809AC14 @ =0x00000FBE
_0809ABE2:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809AC18 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl StartCgText
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809AC1C @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809AC14: .4byte 0x00000FBE
_0809AC18: .4byte 0x06011000
_0809AC1C: .4byte 0x0004000A
