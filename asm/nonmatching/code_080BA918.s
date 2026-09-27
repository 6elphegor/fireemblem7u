	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_BmBgfxAnimOUT
Title_BmBgfxAnimOUT: @ 0x080BA918
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _080BA97A
	cmp r0, #0x20
	bne _080BA94C
	ldr r0, [r4, #0x44]
	movs r1, #0x90
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x78
	movs r2, #0x90
	movs r3, #0x78
	bl TitleSpriteBlendIN
	b _080BA97A
_080BA94C:
	ldrb r1, [r1]
	lsrs r3, r1, #1
	ldr r0, _080BA994 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
_080BA97A:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _080BA98A
	adds r0, r4, #0
	bl Proc_Break
_080BA98A:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA994: .4byte 0x03002870
