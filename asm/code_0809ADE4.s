	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809ADE4
sub_0809ADE4: @ 0x0809ADE4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_0809931C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809ADFC
	ldr r0, _0809ADF8 @ =0x00000F85
	b _0809ADFE
	.align 2, 0
_0809ADF8: .4byte 0x00000F85
_0809ADFC:
	ldr r0, _0809AE34 @ =0x00000F83
_0809ADFE:
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, _0809AE38 @ =0x06011000
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
	ldr r0, _0809AE3C @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AE34: .4byte 0x00000F83
_0809AE38: .4byte 0x06011000
_0809AE3C: .4byte 0x0004004E
