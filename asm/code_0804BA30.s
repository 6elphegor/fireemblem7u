	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleExecExpGain
ekrBattleExecExpGain: @ 0x0804BA30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r0, _0804BB38 @ =0x02019484
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r7, _0804BB3C @ =0x03002870
	movs r0, #0x20
	ldrb r2, [r7, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	movs r2, #0x94
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r3, #1
	mov r8, r3
	mov r1, r8
	ldr r6, _0804BB40 @ =0x030028A4
	ldrb r6, [r6]
	orrs r1, r6
	movs r0, #2
	mov sb, r0
	mov r2, sb
	orrs r1, r2
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	mov r0, r8
	ldrb r2, [r6, r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	subs r2, #0x1e
	ands r1, r2
	ldr r3, _0804BB40 @ =0x030028A4
	strb r1, [r3]
	ands r0, r2
	strb r0, [r6, r7]
	ldr r0, _0804BB44 @ =0x081D97F0
	ldr r1, _0804BB48 @ =0x06002000
	movs r2, #0xc0
	lsls r2, r2, #2
	bl RegisterDataMove
	ldr r0, _0804BB4C @ =0x081D9F50
	ldr r1, _0804BB50 @ =0x020238AC
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x12
	movs r3, #3
	bl EfxTmCpyBG
	ldr r0, _0804BB54 @ =0x081D9FBC
	ldr r1, _0804BB58 @ =0x02022880
	movs r2, #8
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	strb r0, [r7, #0x10]
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	strb r0, [r7, #0xc]
	ldrb r6, [r7, #0x14]
	ands r1, r6
	mov r0, sb
	orrs r1, r0
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #1
	bl EkrGauge_0804CC68
	ldr r0, _0804BB5C @ =0x0203E0D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0804BB64
	ldr r0, _0804BB60 @ =0x0203E0D0
	movs r3, #0
	ldrsh r0, [r0, r3]
	b _0804BB6A
	.align 2, 0
_0804BB38: .4byte 0x02019484
_0804BB3C: .4byte 0x03002870
_0804BB40: .4byte 0x030028A4
_0804BB44: .4byte 0x081D97F0
_0804BB48: .4byte 0x06002000
_0804BB4C: .4byte 0x081D9F50
_0804BB50: .4byte 0x020238AC
_0804BB54: .4byte 0x081D9FBC
_0804BB58: .4byte 0x02022880
_0804BB5C: .4byte 0x0203E0D4
_0804BB60: .4byte 0x0203E0D0
_0804BB64:
	ldr r0, _0804BC00 @ =0x0203E0D0
	movs r6, #2
	ldrsh r0, [r0, r6]
_0804BB6A:
	movs r1, #0x64
	bl DivRem
	adds r6, r0, #0
	movs r1, #0xa
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	subs r4, r6, r0
	cmp r5, #0
	bne _0804BB88
	movs r5, #0xa
_0804BB88:
	ldr r0, _0804BC04 @ =0x02019484
	adds r1, r6, #0
	bl EkrModifyBarfx
	lsls r5, r5, #5
	mov r8, r5
	lsls r4, r4, #5
	mov sb, r4
	mov r5, sl
	ldr r4, _0804BC04 @ =0x02019484
	ldr r7, _0804BC08 @ =0x081D9AF0
	movs r6, #0xc
_0804BBA0:
	ldrh r1, [r4]
	lsls r0, r1, #5
	adds r0, r0, r7
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _0804BBA0
	ldr r4, _0804BC0C @ =0x081D9DF0
	mov r2, r8
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	add r4, sb
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _0804BC10 @ =0x060020E0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	movs r0, #0
	ldr r3, [sp, #8]
	strh r0, [r3, #0x2c]
	ldr r0, _0804BC14 @ =sub_0804BC18
	str r0, [r3, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC00: .4byte 0x0203E0D0
_0804BC04: .4byte 0x02019484
_0804BC08: .4byte 0x081D9AF0
_0804BC0C: .4byte 0x081D9DF0
_0804BC10: .4byte 0x060020E0
_0804BC14: .4byte sub_0804BC18
