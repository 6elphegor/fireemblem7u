	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_BlendedSprite_Init
StatusHealEffect_BlendedSprite_Init: @ 0x08032B00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08032B9C @ =0x03004690
	ldr r0, [r0]
	bl HideUnitSprite
	ldr r0, _08032BA0 @ =0x03002870
	mov ip, r0
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r3, ip
	strb r0, [r3, #1]
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	ands r1, r0
	movs r2, #0x37
	add r2, ip
	mov r8, r2
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r1, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r7]
	movs r1, #1
	orrs r0, r1
	ands r0, r5
	ands r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08032BA4 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08032BA8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	adds r6, #0x4c
	movs r0, #0x40
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032B9C: .4byte 0x03004690
_08032BA0: .4byte 0x03002870
_08032BA4: .4byte 0x0000FFE0
_08032BA8: .4byte 0x0000E0FF
