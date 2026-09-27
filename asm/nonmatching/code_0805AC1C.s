	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AC1C
sub_0805AC1C: @ 0x0805AC1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov r8, r0
	mov sl, r1
	ldr r1, _0805ACB8 @ =0x081E8968
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r5, sp, #0x10
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	bl memset
	movs r6, #0
	movs r0, #1
	strh r0, [r5, #4]
	strh r0, [r5, #0xa]
	add r0, sp, #0x20
	mov sb, r0
	ldr r1, _0805ACBC @ =0x081E8978
	movs r2, #0x10
	bl memcpy
	add r4, sp, #0x30
	ldr r1, _0805ACC0 @ =0x081E8988
	adds r0, r4, #0
	movs r2, #0x10
	bl memcpy
	ldr r1, _0805ACC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805ACC8 @ =0x08BA2978
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	mov r1, r8
	str r1, [r7, #0x5c]
	strh r6, [r7, #0x2c]
	movs r0, #7
	mov r2, sl
	ands r0, r2
	lsls r6, r0, #1
	mov r1, sp
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r7, #0x2e]
	movs r0, #0xff
	bl sub_080672E8
	strh r0, [r7, #0x30]
	movs r0, #0x10
	bl sub_080672E8
	adds r4, r4, r6
	ldrh r4, [r4]
	adds r0, r4, r0
	strh r0, [r7, #0x32]
	movs r0, #0x70
	strh r0, [r7, #0x3a]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805ACCC
	mov r2, sb
	adds r0, r2, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0805ACD6
	.align 2, 0
_0805ACB8: .4byte 0x081E8968
_0805ACBC: .4byte 0x081E8978
_0805ACC0: .4byte 0x081E8988
_0805ACC4: .4byte 0x0201774C
_0805ACC8: .4byte 0x08BA2978
_0805ACCC:
	mov r2, sb
	adds r0, r2, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
_0805ACD6:
	str r0, [r7, #0x44]
	movs r1, #0
	movs r0, #7
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r5, r0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0805ACF2
	cmp r0, #1
	beq _0805ACFC
	b _0805AD08
_0805ACF2:
	ldr r0, _0805ACF8 @ =0x08BD24DC
	b _0805ACFE
	.align 2, 0
_0805ACF8: .4byte 0x08BD24DC
_0805ACFC:
	ldr r0, _0805AD1C @ =0x08BD24D0
_0805ACFE:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r7, #0x60]
_0805AD08:
	cmp r1, #0
	bne _0805AD24
	ldr r1, _0805AD20 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _0805AD32
	.align 2, 0
_0805AD1C: .4byte 0x08BD24D0
_0805AD20: .4byte 0x0201774C
_0805AD24:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r7, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r7, #0x3a]
	strh r0, [r1, #4]
_0805AD32:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
