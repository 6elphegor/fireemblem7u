	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkPutSpriteText_OnIdle
TalkPutSpriteText_OnIdle: @ 0x0800A078
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, _0800A0EC @ =0x08B90C06
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	ldr r4, _0800A0F0 @ =0x000003FF
	mov sl, r4
	ldrh r6, [r3]
	ands r4, r6
	movs r0, #0x64
	adds r0, r0, r7
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ldrh r3, [r3]
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl PutSprite
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, _0800A0F4 @ =0x08B90BEC
	mov r6, sl
	mov r4, sb
	ldrh r4, [r4]
	ands r6, r4
	ldr r0, _0800A0F8 @ =0x030000E8
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl PutSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A0EC: .4byte 0x08B90C06
_0800A0F0: .4byte 0x000003FF
_0800A0F4: .4byte 0x08B90BEC
_0800A0F8: .4byte 0x030000E8
