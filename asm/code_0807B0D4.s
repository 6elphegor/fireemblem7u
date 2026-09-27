	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B0D4
sub_0807B0D4: @ 0x0807B0D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807B160 @ =0x03002870
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0807B164 @ =0x06003000
	ldr r1, _0807B168 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	ldr r0, _0807B16C @ =0x02023C60
	ldr r1, _0807B170 @ =0x081BD958
	movs r2, #0xe4
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0807B174 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl EnableBgSync
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r5, #0xc]
	ands r0, r1
	strb r0, [r5, #0xc]
	adds r0, r2, #0
	ldrb r1, [r5, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x10]
	movs r0, #3
	ldrb r1, [r5, #0x14]
	orrs r0, r1
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r5, #0x18]
	ldr r0, [r4, #0x14]
	bl TryUnlockProc
	adds r4, #0x64
	movs r0, #2
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B160: .4byte 0x03002870
_0807B164: .4byte 0x06003000
_0807B168: .4byte 0x06004000
_0807B16C: .4byte 0x02023C60
_0807B170: .4byte 0x081BD958
_0807B174: .4byte 0x02023460
