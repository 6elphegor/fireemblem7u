	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8C40
sub_080B8C40: @ 0x080B8C40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	asrs r3, r0, #2
	adds r0, #1
	str r0, [r4, #0x34]
	ldr r0, _080B8C88 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	cmp r3, #8
	bne _080B8C80
	adds r0, r4, #0
	bl Proc_Break
_080B8C80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8C88: .4byte 0x03002870
