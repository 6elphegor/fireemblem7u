	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF234
sub_080AF234: @ 0x080AF234
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080AF288 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r2, #0x3f
	ldrb r0, [r3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldrh r0, [r4, #0x2a]
	lsrs r1, r0, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x46
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r3]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080AF280
	strh r5, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080AF280:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF288: .4byte 0x03002870
