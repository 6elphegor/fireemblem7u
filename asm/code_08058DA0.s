	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFimbulvetrOBJ2Fall
StartSubSpell_efxFimbulvetrOBJ2Fall: @ 0x08058DA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, _08058E30 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058E34 @ =0x08BA1D0C
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, _08058E38 @ =0x08BB9228
	movs r1, #0x78
	bl AnimCreate
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, _08058E3C @ =0x0000FFFF
	adds r0, r5, #0
	bl sub_080672E8
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl sub_080672E8
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne _08058E44
	adds r0, r5, #0
	bl sub_080672E8
	ldr r2, _08058E40 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _08058E56
	.align 2, 0
_08058E30: .4byte 0x0201774C
_08058E34: .4byte 0x08BA1D0C
_08058E38: .4byte 0x08BB9228
_08058E3C: .4byte 0x0000FFFF
_08058E40: .4byte 0x000001FF
_08058E44:
	adds r0, r5, #0
	bl sub_080672E8
	ldr r2, _08058EA0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_08058E56:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, _08058EA4 @ =0x0000FF0F
	adds r0, r4, #0
	bl sub_080672E8
	ldr r2, _08058EA8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08058EAC @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl sub_080672E8
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl sub_080672E8
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058EB0
	adds r0, r4, #0
	bl sub_080672E8
	ldr r2, _08058EA0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _08058EC2
	.align 2, 0
_08058EA0: .4byte 0x000001FF
_08058EA4: .4byte 0x0000FF0F
_08058EA8: .4byte 0x000003FF
_08058EAC: .4byte 0xFFFFFF00
_08058EB0:
	adds r0, r4, #0
	bl sub_080672E8
	ldr r2, _08058EE8 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_08058EC2:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, _08058EEC @ =0x0000FF0F
	bl sub_080672E8
	ldr r2, _08058EF0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08058EF4 @ =0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058EE8: .4byte 0x000001FF
_08058EEC: .4byte 0x0000FF0F
_08058EF0: .4byte 0x000003FF
_08058EF4: .4byte 0xFFFFFF00
