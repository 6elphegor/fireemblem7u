	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075A78
sub_08075A78: @ 0x08075A78
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r2, _08075AF8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r2, _08075AF8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_080758B0
	ldr r1, _08075AF8 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075AF0
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_080758B0
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_080758B0
_08075AF0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075AF8: .4byte 0x0203E0FC
