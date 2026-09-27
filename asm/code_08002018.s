	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002018
sub_08002018: @ 0x08002018
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0xc]
	ldr r0, [r7, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r0, r1, #8
	adds r1, r0, #0
	movs r2, #0xff
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #0x18]
_0800205C:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _08002066
	b _080020B4
_08002066:
	ldr r1, [r7, #0x18]
	lsls r0, r1, #5
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x14]
_08002078:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0xc]
	cmp r0, r1
	blt _08002082
	b _080020AC
_08002082:
	adds r0, r7, #4
	ldr r1, [r0]
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x1c]
	adds r2, r3, r2
	str r2, [r7, #0x1c]
	adds r1, #2
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r1, [r0]
	ldr r3, [r7, #0x1c]
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08002078
_080020AC:
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _0800205C
_080020B4:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0
