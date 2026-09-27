	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D7C4
sub_0803D7C4: @ 0x0803D7C4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0803D800 @ =0x02020140
	ldrh r0, [r4, #0x36]
	subs r0, #1
	ldrh r1, [r4, #0x38]
	cmp r1, r0
	bge _0803D804
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D84E
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b _0803D848
	.align 2, 0
_0803D800: .4byte 0x02020140
_0803D804:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D84E
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge _0803D83A
_0803D824:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt _0803D824
_0803D83A:
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
_0803D848:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0803D84E:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803D85A
	adds r0, r4, #0
	bl _call_via_r1
_0803D85A:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _0803D868
	adds r0, r4, #0
	bl Proc_Break
_0803D868:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
