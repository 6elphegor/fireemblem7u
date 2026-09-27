	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTmModifyPal
EfxTmModifyPal: @ 0x08066A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08066AB8
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	mov r8, r0
	ldr r0, _08066AC4 @ =0x08BDAF3C
	mov sb, r0
_08066A80:
	mov r4, ip
	subs r2, #1
	cmp r4, #0
	beq _08066AAE
	ldr r7, _08066AC8 @ =0x00000FFF
	mov r6, sb
	movs r5, #0xf
_08066A8E:
	ldrh r0, [r3]
	adds r1, r0, #0
	lsrs r0, r0, #0xc
	ands r0, r5
	subs r0, #6
	lsls r0, r0, #0x10
	ands r1, r7
	lsrs r0, r0, #0xf
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _08066A8E
_08066AAE:
	mov r1, r8
	lsrs r0, r1, #0xf
	adds r3, r3, r0
	cmp r2, #0
	bne _08066A80
_08066AB8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066AC4: .4byte 0x08BDAF3C
_08066AC8: .4byte 0x00000FFF
