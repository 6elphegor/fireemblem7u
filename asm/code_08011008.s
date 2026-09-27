	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011008
sub_08011008: @ 0x08011008
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08011050 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _0801104A
	adds r0, r4, #0
	bl Proc_Break
_0801104A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011050: .4byte 0x03002870
