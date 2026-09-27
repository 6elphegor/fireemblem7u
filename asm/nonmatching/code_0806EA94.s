	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806EA94
sub_0806EA94: @ 0x0806EA94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806EAAC @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806EAB0
	b _0806EACC
	.align 2, 0
_0806EAAC: .4byte 0x0203E0FC
_0806EAB0:
	ldr r0, _0806EAC8 @ =0x0203E0FC
	ldr r1, [r0]
	ldr r2, [r1]
	ldrb r0, [r2, #4]
	ldr r1, _0806EAC8 @ =0x0203E0FC
	ldr r2, [r1, #0x14]
	ldr r1, [r2]
	ldrb r2, [r1, #4]
	adds r1, r2, #0
	bl StartBattleTalk
	b _0806EACE
	.align 2, 0
_0806EAC8: .4byte 0x0203E0FC
_0806EACC:
	b _0806EACE
_0806EACE:
	bl sub_0800ADB8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
