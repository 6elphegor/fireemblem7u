	.include "macro.inc"

	.syntax unified

	thumb_func_start efxLunaSCR_Loop
efxLunaSCR_Loop: @ 0x0805F70C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r0, _0805F770 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r5, _0805F774 @ =0x0201FB2C
	cmp r0, #0
	bne _0805F722
	ldr r5, _0805F778 @ =0x0201FC6C
_0805F722:
	ldr r3, _0805F77C @ =0x0201FDB8
	cmp r0, #0
	bne _0805F72A
	ldr r3, _0805F780 @ =0x0201FEF8
_0805F72A:
	movs r4, #0
	movs r6, #0
	ldr r0, _0805F784 @ =0x08BA37E4
	movs r1, #0xe0
	lsls r1, r1, #0xf
	mov r8, r1
	movs r2, #0x70
	mov ip, r2
	adds r7, r0, #0
	subs r7, #0x20
_0805F73E:
	cmp r4, #0xf
	bls _0805F79C
	cmp r4, #0x6f
	bhi _0805F79C
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, sb
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0805F794
	cmp r4, #0x3f
	bhi _0805F78C
	adds r0, r4, #0
	subs r0, #0x70
	cmp r1, r0
	bhs _0805F794
	ldr r1, _0805F788 @ =0x0000FF90
	adds r0, r4, r1
	lsls r0, r0, #0x10
	b _0805F792
	.align 2, 0
_0805F770: .4byte 0x0201FDAC
_0805F774: .4byte 0x0201FB2C
_0805F778: .4byte 0x0201FC6C
_0805F77C: .4byte 0x0201FDB8
_0805F780: .4byte 0x0201FEF8
_0805F784: .4byte 0x08BA37E4
_0805F788: .4byte 0x0000FF90
_0805F78C:
	cmp r1, ip
	bls _0805F794
	mov r0, r8
_0805F792:
	lsrs r2, r0, #0x10
_0805F794:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r3]
	b _0805F7A2
_0805F79C:
	strh r6, [r5]
	adds r5, #2
	strh r6, [r3]
_0805F7A2:
	adds r3, #2
	ldr r1, _0805F7C4 @ =0xFFFF0000
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add ip, r2
	adds r7, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _0805F73E
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7C4: .4byte 0xFFFF0000
