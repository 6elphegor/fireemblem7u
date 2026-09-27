	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_PutWindowOnScreen
EkrLvup_PutWindowOnScreen: @ 0x08069448
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldr r5, [r7, #0x48]
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov sb, r0
	cmp r3, #0
	bge _08069468
	movs r3, #0
	b _0806946E
_08069468:
	cmp r3, #8
	ble _0806946E
	movs r3, #8
_0806946E:
	cmp r5, #0
	bge _08069476
	movs r5, #0
	b _0806947C
_08069476:
	cmp r5, #8
	ble _0806947C
	movs r5, #8
_0806947C:
	cmp r6, #0
	bge _08069484
	movs r6, #0
	b _0806948A
_08069484:
	cmp r6, #8
	ble _0806948A
	movs r6, #8
_0806948A:
	mov r2, sb
	cmp r2, #0
	bge _08069494
	movs r0, #0
	b _0806949C
_08069494:
	mov r2, sb
	cmp r2, #8
	ble _0806949E
	movs r0, #8
_0806949C:
	mov sb, r0
_0806949E:
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	ldr r0, [r7, #0x48]
	adds r0, #1
	str r0, [r7, #0x48]
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	adds r0, #1
	str r0, [r7, #0x50]
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	mov r8, r0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	adds r3, r5, #0
	bl Interpolate
	mov sl, r0
	ldr r5, _0806955C @ =0x0202012C
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	adds r3, r6, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08069560 @ =0x0202012E
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	mov r3, sb
	bl Interpolate
	strh r0, [r5]
	ldr r0, _08069564 @ =0x030041C0
	ldr r1, [r0]
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1, #0x36]
	ldr r0, _08069568 @ =0x020165C8
	ldr r4, _0806956C @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	mov r3, sl
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0806954A
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_0806954A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806955C: .4byte 0x0202012C
_08069560: .4byte 0x0202012E
_08069564: .4byte 0x030041C0
_08069568: .4byte 0x020165C8
_0806956C: .4byte 0x02022860
