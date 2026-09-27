	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntro_InitDisp
PhaseIntro_InitDisp: @ 0x0801EA78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0801EB60 @ =0x03002870
	mov ip, r0
	movs r1, #0x20
	mov r8, r1
	mov r0, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r6, #0
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r7]
	ldr r1, _0801EB64 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3a
	strb r6, [r0]
	adds r0, #1
	movs r3, #0x10
	strb r3, [r0]
	subs r0, #3
	strb r6, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0801EB68 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _0801EB6C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0
	bl SetVCount
	ldr r0, _0801EB70 @ =PhaseIntroVMatchHi
	bl SetOnVMatch
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EB60: .4byte 0x03002870
_0801EB64: .4byte 0x0202BBB8
_0801EB68: .4byte 0x0000FFE0
_0801EB6C: .4byte 0x0000E0FF
_0801EB70: .4byte PhaseIntroVMatchHi
