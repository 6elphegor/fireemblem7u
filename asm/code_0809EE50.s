	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateBestGlobalSupportValue
UpdateBestGlobalSupportValue: @ 0x0809EE50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #3
	ands r6, r2
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EEC0
	movs r3, #0
	ldr r2, _0809EE70 @ =0x08C9F9F4
	add r7, sp, #0x20
	b _0809EE78
	.align 2, 0
_0809EE70: .4byte 0x08C9F9F4
_0809EE74:
	adds r3, #1
	adds r2, #0x14
_0809EE78:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809EE94
	adds r1, r0, #0
	cmp r1, r5
	bne _0809EE8A
	ldrb r0, [r2, #1]
	cmp r0, r4
	beq _0809EE94
_0809EE8A:
	cmp r1, r4
	bne _0809EE74
	ldrb r0, [r2, #1]
	cmp r0, r5
	bne _0809EE74
_0809EE94:
	asrs r0, r3, #2
	movs r4, #3
	ands r3, r4
	lsls r1, r3, #1
	adds r3, r7, r0
	ldrb r2, [r3]
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, r6
	bge _0809EEC0
	adds r0, r4, #0
	lsls r0, r1
	bics r2, r0
	lsls r6, r1
	adds r0, r2, r6
	strb r0, [r3]
	mov r0, sp
	bl WriteGlobalSaveInfo
	movs r0, #1
	b _0809EEC2
_0809EEC0:
	movs r0, #0
_0809EEC2:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
