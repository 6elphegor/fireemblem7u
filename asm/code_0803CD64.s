	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CD64
sub_0803CD64: @ 0x0803CD64
	push {r4, lr}
	ldr r2, _0803CD90 @ =0x08B98AEC
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne _0803CD98
	ldr r0, _0803CD94 @ =0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0803CD98
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803CDA0
	.align 2, 0
_0803CD90: .4byte 0x08B98AEC
_0803CD94: .4byte 0x04000128
_0803CD98:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
_0803CDA0:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _0803CDAE
	movs r0, #1
	b _0803CDB0
_0803CDAE:
	movs r0, #0
_0803CDB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
