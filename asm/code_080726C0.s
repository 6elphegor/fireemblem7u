	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080726C0
sub_080726C0: @ 0x080726C0
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _08072724 @ =0x08C9DB1C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08072728 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldr r2, [r1, #0x2c]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _08072728 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	str r2, [r0, #0x34]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072724: .4byte 0x08C9DB1C
_08072728: .4byte 0x0202BBB8
