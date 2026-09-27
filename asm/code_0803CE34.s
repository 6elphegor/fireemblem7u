	.include "macro.inc"

	.syntax unified

	thumb_func_start SioSend
SioSend: @ 0x0803CE34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _0803CED4 @ =0x030013DA
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi _0803CECC
	lsrs r5, r1, #0x11
	ldr r1, _0803CED8 @ =0x00004FFF
	adds r4, r5, r1
	ldr r2, _0803CEDC @ =0x0203C50C
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, _0803CEE0 @ =0x000001FF
	ands r3, r6
	ldr r0, _0803CEE4 @ =0x030013D8
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq _0803CECC
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq _0803CECC
	movs r2, #0
	cmp r2, r5
	bge _0803CEA8
	mov r3, sb
_0803CE8A:
	adds r2, #1
	ldrh r0, [r3]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt _0803CE8A
_0803CEA8:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, _0803CEE0 @ =0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq _0803CECC
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne _0803CEE8
_0803CECC:
	movs r0, #1
	rsbs r0, r0, #0
	b _0803CF18
	.align 2, 0
_0803CED4: .4byte 0x030013DA
_0803CED8: .4byte 0x00004FFF
_0803CEDC: .4byte 0x0203C50C
_0803CEE0: .4byte 0x000001FF
_0803CEE4: .4byte 0x030013D8
_0803CEE8:
	movs r2, #0
	cmp r2, r5
	bge _0803CF10
	mov r8, ip
	adds r7, r4, #0
	mov r4, sb
	mov r6, sl
_0803CEF6:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq _0803CECC
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt _0803CEF6
_0803CF10:
	ldr r1, _0803CF28 @ =0x030013DA
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
_0803CF18:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803CF28: .4byte 0x030013DA
