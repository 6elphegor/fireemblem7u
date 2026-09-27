	.include "macro.inc"

	.syntax unified

	thumb_func_start CallSomeSoundMaybe
CallSomeSoundMaybe: @ 0x080040F8
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0800412C
	ldr r0, _08004128 @ =0x02024E1C
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _0800412C
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _0800412C
	b _080041B6
	.align 2, 0
_08004128: .4byte 0x02024E1C
_0800412C:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _08004144
	ldr r1, _08004140 @ =0x08B85864
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	b _08004150
	.align 2, 0
_08004140: .4byte 0x08B85864
_08004144:
	ldr r1, _08004178 @ =0x08B85864
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_08004150:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x58]
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08004180
	ldr r0, _0800417C @ =0x02024E1C
	ldrh r1, [r0, #4]
	ldr r0, [r7]
	cmp r0, r1
	bne _08004180
	ldr r0, [r7, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x5c]
	b _08004186
	.align 2, 0
_08004178: .4byte 0x08B85864
_0800417C: .4byte 0x02024E1C
_08004180:
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x5c]
_08004186:
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_080041B6:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
