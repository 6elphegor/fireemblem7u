	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonFlameImpact_Init
DragonFlameImpact_Init: @ 0x0807EA30
	push {r4, r5, lr}
	movs r1, #0xc0
	str r1, [r0, #0x2c]
	movs r1, #0x98
	str r1, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807EAC8 @ =0x081C2340
	ldr r1, _0807EACC @ =0x06005000
	bl Decompress
	ldr r0, _0807EAD0 @ =0x081C23C8
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807EAD4 @ =0x02023C60
	ldr r1, _0807EAD8 @ =0x081C25C8
	movs r2, #0x85
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0807EADC @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r2, #0x36
	adds r2, r2, r3
	mov ip, r2
	movs r1, #1
	ldrb r0, [r2]
	orrs r0, r1
	movs r5, #2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	movs r4, #8
	orrs r0, r4
	movs r2, #0x10
	orrs r0, r2
	mov r2, ip
	strb r0, [r2]
	adds r3, #0x37
	ldrb r0, [r3]
	orrs r1, r0
	orrs r1, r5
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAC8: .4byte 0x081C2340
_0807EACC: .4byte 0x06005000
_0807EAD0: .4byte 0x081C23C8
_0807EAD4: .4byte 0x02023C60
_0807EAD8: .4byte 0x081C25C8
_0807EADC: .4byte 0x03002870
