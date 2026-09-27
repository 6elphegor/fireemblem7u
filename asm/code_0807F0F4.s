	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadOneYearLaterCg
LoadOneYearLaterCg: @ 0x0807F0F4
	push {lr}
	ldr r3, _0807F164 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807F168 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r0, _0807F16C @ =0x081C3590
	ldr r1, _0807F170 @ =0x06000800
	bl Decompress
	ldr r0, _0807F174 @ =0x081C39A4
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F178 @ =0x02022C60
	ldr r1, _0807F17C @ =0x081C39C4
	ldr r2, _0807F180 @ =0x00005040
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F164: .4byte 0x03002870
_0807F168: .4byte 0x0000FFE0
_0807F16C: .4byte 0x081C3590
_0807F170: .4byte 0x06000800
_0807F174: .4byte 0x081C39A4
_0807F178: .4byte 0x02022C60
_0807F17C: .4byte 0x081C39C4
_0807F180: .4byte 0x00005040
