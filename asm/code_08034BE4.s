	.include "macro.inc"

	.syntax unified

	thumb_func_start BuildAiUnitList
BuildAiUnitList: @ 0x08034BE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r5, #0
	ldr r0, _08034C70 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	ldr r0, _08034C74 @ =0x08B96ED0
	ldr r0, [r0]
	mov r8, r0
	mov r1, sp
	ldr r0, _08034C78 @ =0x081D3658
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08034C60
	adds r7, r1, #0
	adds r4, r2, #1
_08034C14:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08034C56
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08034C56
	cmp r1, #4
	beq _08034C56
	ldr r0, [r2, #0xc]
	ldr r1, _08034C7C @ =0x00000427
	ands r0, r1
	cmp r0, #0
	bne _08034C56
	ldr r0, _08034C80 @ =0x0203A8EC
	adds r0, r5, r0
	strb r4, [r0]
	adds r0, r2, #0
	bl sub_08034B6C
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	adds r5, #1
_08034C56:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _08034C14
_08034C60:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08034C70: .4byte 0x0202BBF8
_08034C74: .4byte 0x08B96ED0
_08034C78: .4byte 0x081D3658
_08034C7C: .4byte 0x00000427
_08034C80: .4byte 0x0203A8EC
