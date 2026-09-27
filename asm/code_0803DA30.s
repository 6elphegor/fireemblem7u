	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DA30
sub_0803DA30: @ 0x0803DA30
	push {r4, lr}
	ldr r3, _0803DA64 @ =0x030028AC
	ldr r1, _0803DA68 @ =0x0000FFE0
	ldrh r2, [r3]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	ldr r2, _0803DA6C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	strb r1, [r3]
	movs r1, #0
	strb r1, [r3, #8]
	strb r1, [r3, #9]
	strb r1, [r3, #0xa]
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA64: .4byte 0x030028AC
_0803DA68: .4byte 0x0000FFE0
_0803DA6C: .4byte 0x0000E0FF
