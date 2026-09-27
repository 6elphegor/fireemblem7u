	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08032C40
sub_08032C40: @ 0x08032C40
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	adds r2, r2, r0
	str r2, [r4, #0x2c]
	ldr r0, _08032C94 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x45
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032C8C
	adds r0, r4, #0
	bl Proc_Break
_08032C8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032C94: .4byte 0x03002870
