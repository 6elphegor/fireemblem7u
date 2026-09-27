	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTmCpyExt
EfxTmCpyExt: @ 0x08066B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov r8, r6
	ldr r6, [sp, #0x34]
	mov ip, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066BC8
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	subs r0, r6, r7
	lsls r0, r0, #0x10
	mov sl, r0
	subs r0, r3, r7
	lsls r0, r0, #0x10
	mov sb, r0
_08066B74:
	adds r1, r7, #0
	subs r6, r2, #1
	cmp r1, #0
	beq _08066BA6
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, r8
	lsls r3, r0, #0xc
_08066B84:
	ldrh r0, [r5]
	cmp r8, r2
	beq _08066B90
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066B90:
	cmp ip, r2
	beq _08066B9A
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066B9A:
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08066B84
_08066BA6:
	ldr r2, _08066BD8 @ =0xFFFF0000
	asrs r1, r2, #0x10
	ldr r0, [sp]
	cmp r0, r1
	beq _08066BB6
	mov r2, sl
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08066BB6:
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _08066BC2
	mov r1, sb
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_08066BC2:
	adds r2, r6, #0
	cmp r2, #0
	bne _08066B74
_08066BC8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066BD8: .4byte 0xFFFF0000
