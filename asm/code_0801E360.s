	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnitSwapProc_MainLoop
PrepUnitSwapProc_MainLoop: @ 0x0801E360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #9
	movs r0, #0x3c
	ldrsh r3, [r7, r0]
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [sp, #4]
	movs r2, #0x34
	ldrsh r6, [r7, r2]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	mov sb, r0
	subs r6, r6, r0
	movs r0, #0x36
	ldrsh r2, [r7, r0]
	mov r8, r2
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	str r1, [sp, #8]
	mov r0, r8
	subs r0, r0, r1
	mov r8, r0
	ldr r2, _0801E450 @ =0x080C5A48
	ldr r1, [sp, #4]
	asrs r0, r1, #9
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r4, [r0, r2]
	adds r0, r6, #0
	muls r0, r4, r0
	ldr r5, [r7, #0x44]
	adds r1, r5, #0
	bl __divsi3
	mov sl, r0
	mov r0, r8
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	ldr r2, [sp, #4]
	adds r1, r6, #0
	muls r1, r2, r1
	asrs r1, r1, #0x10
	adds r5, r1, r0
	mov r0, r8
	muls r0, r2, r0
	asrs r0, r0, #0x10
	mov r1, sl
	subs r4, r0, r1
	add sb, r5
	ldr r1, _0801E454 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r2, sb
	subs r5, r2, r0
	ldr r0, [sp, #8]
	adds r4, r4, r0
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801E42A
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0801E42A
	adds r2, r4, #0
	subs r2, #0xc
	ldr r3, _0801E458 @ =0x08B905B8
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
	ldr r3, [r7, #0x2c]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutUnitSprite
_0801E42A:
	ldrh r0, [r7, #0x3c]
	adds r0, #1
	strh r0, [r7, #0x3c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x3e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0801E440
	adds r0, r7, #0
	bl Proc_Break
_0801E440:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E450: .4byte 0x080C5A48
_0801E454: .4byte 0x0202BBB8
_0801E458: .4byte 0x08B905B8
