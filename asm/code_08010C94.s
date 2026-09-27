	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010C94
sub_08010C94: @ 0x08010C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08010CDC @ =0x03002870
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
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _08010CD6
	adds r0, r4, #0
	bl Proc_Break
_08010CD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010CDC: .4byte 0x03002870
