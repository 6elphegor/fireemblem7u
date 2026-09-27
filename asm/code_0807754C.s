	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807754C
sub_0807754C: @ 0x0807754C
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077562:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _0807756C
	b _08077644
_0807756C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080775C2
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
_080775C2:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x10]
	adds r0, r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08077618
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
_08077618:
	ldr r1, [r7, #0xc]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _0807763C
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0xc]
	adds r1, r0, r1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_0807763C:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077562
_08077644:
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0
