	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C614
sub_0807C614: @ 0x0807C614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0807C668 @ =0x03002870
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
	subs r0, r0, r4
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	asrs r2, r2, #0x11
	adds r2, #8
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807C662
	adds r0, r5, #0
	bl Proc_Break
_0807C662:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C668: .4byte 0x03002870
