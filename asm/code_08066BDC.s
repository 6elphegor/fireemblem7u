	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTmCpyExtHFlip
EfxTmCpyExtHFlip: @ 0x08066BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r6, [sp, #0x34]
	mov sb, r6
	ldr r6, [sp, #0x38]
	mov r8, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r2, r2, #0x10
	lsls r0, r0, #1
	subs r0, #2
	adds r4, r4, r0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066C8A
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, ip
	subs r0, r6, r1
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	mov sl, r0
_08066C2E:
	mov r1, ip
	subs r7, r2, #1
	cmp r1, #0
	beq _08066C68
	movs r2, #1
	rsbs r2, r2, #0
	mov r6, sb
	lsls r3, r6, #0xc
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r0, #0
_08066C44:
	ldrh r0, [r5]
	cmp sb, r2
	beq _08066C50
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066C50:
	cmp r8, r2
	beq _08066C5A
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08066C5A:
	eors r0, r6
	strh r0, [r4]
	adds r5, #2
	subs r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08066C44
_08066C68:
	ldr r2, _08066C9C @ =0xFFFF0000
	asrs r1, r2, #0x10
	ldr r6, [sp]
	cmp r6, r1
	beq _08066C78
	ldr r2, [sp, #4]
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08066C78:
	ldr r6, [sp, #8]
	cmp r6, r1
	beq _08066C84
	mov r1, sl
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_08066C84:
	adds r2, r7, #0
	cmp r2, #0
	bne _08066C2E
_08066C8A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066C9C: .4byte 0xFFFF0000
