	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807BB30
sub_0807BB30: @ 0x0807BB30
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r2, r0, #1
	strh r2, [r4]
	lsls r0, r0, #0x10
	asrs r6, r0, #0x13
	ldr r0, _0807BBD8 @ =0x03002870
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
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #8
	bne _0807BB82
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r1, r5, #0
	bl StartUnitTornOut
_0807BB82:
	ldrh r4, [r4]
	cmp r4, #0x10
	bne _0807BB9A
	ldr r0, _0807BBDC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807BB9A
	movs r0, #0xd6
	bl m4aSongNumStart
_0807BB9A:
	cmp r6, #0x10
	bne _0807BBD0
	ldr r0, _0807BBE0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r2, _0807BBD8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807BBD0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBD8: .4byte 0x03002870
_0807BBDC: .4byte 0x0202BBF8
_0807BBE0: .4byte 0x02022C60
