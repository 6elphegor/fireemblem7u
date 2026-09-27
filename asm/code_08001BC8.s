	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshKeySt
RefreshKeySt: @ 0x08001BC8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001C14 @ =0x04000130
	ldrh r1, [r0]
	mvns r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _08001BFC
	ldr r0, _08001C18 @ =0x0300000E
	ldrh r1, [r0]
	mvns r0, r1
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r7, #4]
_08001BFC:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	ldr r0, [r7]
	bl RefreshKeyStFromKeys
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001C14: .4byte 0x04000130
_08001C18: .4byte 0x0300000E
