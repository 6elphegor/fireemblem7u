	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_80480B4
SioMenu_80480B4: @ 0x08042A90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08042B3C @ =0x0203D90C
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _08042AAC
	adds r0, r5, #0
	bl Proc_Break
_08042AAC:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt _08042B1A
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, _08042B40 @ =0x081D541C
	movs r4, #0x10
	mov sb, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
_08042AD2:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl Interpolate
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl SioMenuItem_SetPosition
	subs r6, #4
	subs r7, #2
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge _08042AD2
_08042B1A:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble _08042B26
	adds r0, r5, #0
	bl Proc_Break
_08042B26:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042B3C: .4byte 0x0203D90C
_08042B40: .4byte 0x081D541C
