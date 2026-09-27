	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_8047C60
SioMenu_8047C60: @ 0x080425E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	rsbs r1, r1, #0
	ldr r5, _0804268C @ =0x081D541C
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl Interpolate
	mov sb, r0
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
_08042622:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl SioMenuItem_SetPosition
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08042622
	mov r1, sb
	adds r1, #8
	movs r0, #0
	bl sub_08047F6C
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble _08042678
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl SioMenu_GetItemHelpText
	movs r1, #0
	bl PutSioText
	adds r0, r7, #0
	movs r1, #1
	bl SioMenu_GetItemHelpText
	movs r1, #1
	bl PutSioText
	ldr r0, _0804268C @ =0x081D541C
	ldrb r1, [r0, #1]
	adds r1, #8
	movs r0, #0
	bl sub_08047F6C
	adds r0, r7, #0
	bl Proc_Break
_08042678:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804268C: .4byte 0x081D541C
