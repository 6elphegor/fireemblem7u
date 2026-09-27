	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047E00
sub_08047E00: @ 0x08047E00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08047E7C @ =0x00007E08
	mov sb, r0
	ldr r2, [r5, #0x2c]
	ldr r0, [r5, #0x34]
	adds r2, r2, r0
	asrs r2, r2, #1
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x38]
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r8, r0
	str r2, [r5, #0x34]
	str r0, [r5, #0x38]
	movs r7, #0
	adds r6, r2, #0
_08047E2A:
	ldr r4, [r5, #0x40]
	adds r0, r4, #0
	cmp r4, #0
	bge _08047E34
	adds r0, r4, #7
_08047E34:
	asrs r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r5, #0x3c]
	bl __modsi3
	movs r1, #7
	ands r4, r1
	subs r1, r6, r4
	add r0, sb
	str r0, [sp]
	movs r0, #0xc
	mov r2, r8
	ldr r3, _08047E80 @ =0x08B9A3C8
	bl PutSprite
	adds r6, #8
	adds r7, #1
	cmp r7, #0x1f
	ble _08047E2A
	ldr r1, [r5, #0x40]
	adds r1, #1
	str r1, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #3
	cmp r1, r0
	bne _08047E6C
	movs r0, #0
	str r0, [r5, #0x40]
_08047E6C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047E7C: .4byte 0x00007E08
_08047E80: .4byte 0x08B9A3C8
