	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryDoStaff
AiTryDoStaff: @ 0x0803AAD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0803AB74 @ =0x03004690
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0803AB62
	movs r5, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _0803AB62
	ldr r0, _0803AB78 @ =0x081D3B78
	mov r8, r0
_0803AB00:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803AB4C
	adds r0, r4, #0
	bl GetItemRequiredExp
	cmp r0, r6
	blt _0803AB4C
	adds r0, r4, #0
	bl GetAiStaffFuncIndex
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803AB4C
	lsls r0, r1, #3
	add r0, r8
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl _call_via_r2
	ldr r0, _0803AB7C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803AB4C
	adds r0, r4, #0
	bl GetItemRequiredExp
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803AB4C:
	adds r5, #1
	cmp r5, #4
	bgt _0803AB62
	ldr r0, _0803AB74 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803AB00
_0803AB62:
	ldr r0, _0803AB7C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803AB74: .4byte 0x03004690
_0803AB78: .4byte 0x081D3B78
_0803AB7C: .4byte 0x0203A97C
