	.include "macro.inc"

	.syntax unified

	thumb_func_start PutStatScreenSupportList
PutStatScreenSupportList: @ 0x08080270
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #6
	str r0, [sp, #8]
	ldr r4, _08080358 @ =0x0200310C
	ldr r0, [r4, #0xc]
	bl GetUnitTotalSupportLevel
	movs r1, #0
	str r1, [sp, #0xc]
	cmp r0, #5
	bne _08080294
	movs r0, #4
	str r0, [sp, #0xc]
_08080294:
	ldr r0, [r4, #0xc]
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov sb, r1
	movs r0, #0
	cmp r0, sl
	bge _08080348
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, _08080358 @ =0x0200310C
	adds r1, r0, r1
	str r1, [sp, #0x10]
_080802B0:
	ldr r1, _08080358 @ =0x0200310C
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportLevel
	adds r7, r0, #0
	cmp r7, #0
	beq _08080340
	ldr r1, _08080358 @ =0x0200310C
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportPid
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [sp, #8]
	lsls r6, r0, #6
	ldr r1, _0808035C @ =0x02003244
	mov r8, r1
	adds r5, r6, r1
	adds r0, r4, #0
	bl GetAffinityIconByPid
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r4, #0
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	mov r1, r8
	adds r1, #6
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl PutDrawText
	movs r5, #2
	cmp r7, #3
	bne _08080316
	movs r5, #4
_08080316:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bne _0808031E
	movs r5, #4
_0808031E:
	mov r4, r8
	adds r4, #0x12
	adds r4, r6, r4
	adds r0, r7, #0
	bl GetSupportLevelSpecialChar
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutSpecialChar
	ldr r1, [sp, #8]
	adds r1, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
_08080340:
	movs r1, #1
	add sb, r1
	cmp sb, sl
	blt _080802B0
_08080348:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080358: .4byte 0x0200310C
_0808035C: .4byte 0x02003244
