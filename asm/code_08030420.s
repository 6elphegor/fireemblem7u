	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030420
sub_08030420: @ 0x08030420
	push {r4, r5, lr}
	bl GetSupplyUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08030474
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	ldr r5, _0803047C @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0803044A
	movs r1, #1
_0803044A:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _08030464
	movs r1, #1
_08030464:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_08030474:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803047C: .4byte 0x0202BBF8
