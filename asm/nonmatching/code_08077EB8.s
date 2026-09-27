	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08077EB8
sub_08077EB8: @ 0x08077EB8
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x2c]
	cmp r0, r1
	bgt _08077ED0
	b _08077FC6
_08077ED0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x20]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077EDA:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _08077EE4
	b _08077FC4
_08077EE4:
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x2c]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0xc]
	bl __divsi3
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x2c]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0xc]
	bl __divsi3
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r1, [r7, #0x20]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _08077FBC
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0x20]
	adds r1, r0, r1
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_08077FBC:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077EDA
_08077FC4:
	b _080780BA
_08077FC6:
	ldr r0, [r7, #0x2c]
	str r0, [r7, #0x20]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077FD0:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _08077FDA
	b _080780BA
_08077FDA:
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0x2c]
	bl __divsi3
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0x2c]
	bl __divsi3
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r1, [r7, #0x20]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _080780B2
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0x20]
	adds r1, r0, r1
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_080780B2:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077FD0
_080780BA:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
