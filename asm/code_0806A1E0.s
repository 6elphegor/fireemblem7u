	.include "macro.inc"

	.syntax unified

	thumb_func_start PutEkrLvupStatGainLabelGfx2
PutEkrLvupStatGainLabelGfx2: @ 0x0806A1E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0806A228 @ =0x083F373C
	mov sb, r0
	ldr r0, _0806A22C @ =0x081E5FD0
	mov r8, r0
	cmp r7, #0
	blt _0806A238
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _0806A230 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0806A234 @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	b _0806A268
	.align 2, 0
_0806A228: .4byte 0x083F373C
_0806A22C: .4byte 0x081E5FD0
_0806A230: .4byte 0x000003FF
_0806A234: .4byte 0x06010000
_0806A238:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _0806A2B8 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _0806A2BC @ =0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
_0806A268:
	adds r0, r7, #0
	cmp r7, #0
	bge _0806A270
	rsbs r0, r7, #0
_0806A270:
	ldr r4, _0806A2B8 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0806A2BC @ =0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	adds r0, r7, #0
	cmp r0, #0
	bge _0806A292
	rsbs r0, r0, #0
_0806A292:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, sb
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2B8: .4byte 0x000003FF
_0806A2BC: .4byte 0x06010000
