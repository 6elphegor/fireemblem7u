	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D970
sub_0805D970: @ 0x0805D970
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r1, _0805DA2C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DA30 @ =0x08BA31E0
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805DA34 @ =0x081E8EE4
	str r1, [r0, #0x48]
	ldr r1, _0805DA38 @ =0x08BA31F8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805DA3C @ =0x0826AC5C
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	ldr r6, _0805DA40 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x14]
	ldrb r0, [r6, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x10]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	bl sub_0805076C
	ldr r2, _0805DA44 @ =0x0000F3FF
	mov r8, r2
	mov r0, r8
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r2, #0
	orrs r0, r7
	strh r0, [r5, #8]
	ldr r4, _0805DA48 @ =0x02000010
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	cmp r1, #0
	beq _0805DA04
	mov r0, r8
	ldrh r2, [r1, #8]
	ands r0, r2
	orrs r0, r7
	strh r0, [r1, #8]
_0805DA04:
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805DA4C @ =0x0000FFE0
	ldrh r1, [r6, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0805DA50 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x3c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DA2C: .4byte 0x0201774C
_0805DA30: .4byte 0x08BA31E0
_0805DA34: .4byte 0x081E8EE4
_0805DA38: .4byte 0x08BA31F8
_0805DA3C: .4byte 0x0826AC5C
_0805DA40: .4byte 0x03002870
_0805DA44: .4byte 0x0000F3FF
_0805DA48: .4byte 0x02000010
_0805DA4C: .4byte 0x0000FFE0
_0805DA50: .4byte 0x0000E0FF
