	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A378
sub_0809A378: @ 0x0809A378
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r6, #0x5c
	ldrh r0, [r6]
	bl sub_0809A8C8
	adds r7, r0, #0
	cmp r7, #0
	bne _0809A396
	strh r7, [r6]
	movs r0, #0
	bl sub_0809A8C8
	adds r7, r0, #0
_0809A396:
	ldrh r0, [r6]
	bl sub_0809A870
	adds r5, r0, #0
	ldrh r0, [r6]
	adds r0, #1
	movs r4, #0
	strh r0, [r6]
	movs r0, #0
	bl EndFaceById
	ldr r2, _0809A3F8 @ =0x08BDCE4C
	subs r1, r7, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	movs r3, #0x81
	lsls r3, r3, #1
	str r4, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r5, [sp]
	ldr r0, _0809A3FC @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	ldr r0, _0809A400 @ =0x0002000A
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A3F8: .4byte 0x08BDCE4C
_0809A3FC: .4byte 0x06011000
_0809A400: .4byte 0x0002000A
