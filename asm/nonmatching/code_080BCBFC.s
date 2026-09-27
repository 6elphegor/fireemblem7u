	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCBFC
sub_080BCBFC: @ 0x080BCBFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp]
	str r1, [sp, #4]
	mov sl, r2
	mov ip, r3
	ldr r4, [sp, #0x3c]
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	movs r1, #0
	b _080BCCA0
_080BCC1C:
	movs r3, #0
	ldr r1, [sp, #8]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp]
	cmp r3, r0
	bge _080BCC9E
	ldr r1, _080BCCB8 @ =0x08CEF314
	str r1, [sp, #0x14]
	ldr r0, _080BCCBC @ =0x08CEF074
	str r0, [sp, #0x18]
_080BCC32:
	adds r1, r3, #1
	str r1, [sp, #0x10]
	mov r0, sl
	cmp r0, #0
	ble _080BCC96
	movs r1, #0x3f
	mov r8, r1
	lsls r7, r3, #5
	ldr r0, [sp, #8]
	lsls r6, r0, #0xa
	ldr r1, [sp, #0x18]
	mov sb, r1
	mov r5, sl
_080BCC4C:
	mov r0, r8
	ands r4, r0
	mov r1, sb
	ldr r2, [r1]
	add r2, ip
	adds r2, r2, r7
	adds r2, r2, r6
	mov r0, ip
	adds r3, r7, r0
	adds r3, r3, r6
	ldr r1, _080BCCC0 @ =0x06014000
	adds r3, r3, r1
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BCCB8 @ =0x08CEF314
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	bics r2, r1
	ldr r0, [r3]
	ands r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BCC4C
_080BCC96:
	ldr r3, [sp, #0x10]
	ldr r0, [sp]
	cmp r3, r0
	blt _080BCC32
_080BCC9E:
	ldr r1, [sp, #0xc]
_080BCCA0:
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080BCC1C
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCB8: .4byte 0x08CEF314
_080BCCBC: .4byte 0x08CEF074
_080BCCC0: .4byte 0x06014000
