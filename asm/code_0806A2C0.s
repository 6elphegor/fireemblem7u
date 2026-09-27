	.include "macro.inc"

	.syntax unified

	thumb_func_start BanimDrawStatupAp
BanimDrawStatupAp: @ 0x0806A2C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r8, r2
	mov sb, r3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	lsls r6, r3, #0xc
	adds r7, r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r7, r0
	adds r5, r6, #0
	orrs r5, r7
	mov r0, r8
	subs r0, #0x12
	mov r1, sb
	subs r1, #4
	ldr r2, _0806A340 @ =0x08B9E2BC
	str r5, [sp]
	movs r3, #0
	mov sl, r3
	str r3, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	movs r3, #0
	bl NewEkrsubAnimeEmulator
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0806A3BA
	ldr r0, _0806A344 @ =0x08BDB84C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	cmp r1, #0
	blt _0806A34C
	ldr r2, _0806A348 @ =0x08B9E2EC
	str r5, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	mov r0, r8
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	b _0806A392
	.align 2, 0
_0806A340: .4byte 0x08B9E2BC
_0806A344: .4byte 0x08BDB84C
_0806A348: .4byte 0x08B9E2EC
_0806A34C:
	ldr r1, [sp, #0x18]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r1, r6
	mov r0, r8
	subs r0, #3
	ldr r2, _0806A3CC @ =0x08B9E338
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	orrs r6, r7
	ldr r2, _0806A3D0 @ =0x08B9E31C
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	bl PutEkrLvupStatGainLabelGfx2
_0806A392:
	movs r0, #0
	mov r3, r8
	strh r3, [r4, #0x32]
	mov r1, sb
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x2c]
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r4, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x44]
	ldr r3, [sp, #0x10]
	str r3, [r4, #0x48]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x4c]
	ldr r1, [sp, #0x40]
	str r1, [r4, #0x50]
_0806A3BA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3CC: .4byte 0x08B9E338
_0806A3D0: .4byte 0x08B9E31C
