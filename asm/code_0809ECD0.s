	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGlobalBestSupport
GetGlobalBestSupport: @ 0x0809ECD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r3, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	movs r6, #0
	ldr r5, _0809ECF4 @ =0x08C9F9F4
	cmp r4, #0
	bne _0809ECEE
	mov r4, sp
	mov r0, sp
	str r3, [sp, #0x64]
	bl ReadGlobalSaveInfo
	ldr r3, [sp, #0x64]
_0809ECEE:
	adds r4, #0x20
	b _0809ECFC
	.align 2, 0
_0809ECF4: .4byte 0x08C9F9F4
_0809ECF8:
	adds r6, #1
	adds r5, #0x14
_0809ECFC:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809ED18
	adds r1, r0, #0
	cmp r1, r3
	bne _0809ED0E
	ldrb r0, [r5, #1]
	cmp r0, r7
	beq _0809ED18
_0809ED0E:
	cmp r1, r7
	bne _0809ECF8
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _0809ECF8
_0809ED18:
	asrs r1, r6, #2
	movs r2, #3
	ands r6, r2
	lsls r0, r6, #1
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r1, r0
	adds r0, r1, #0
	ands r0, r2
	add sp, #0x68
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
