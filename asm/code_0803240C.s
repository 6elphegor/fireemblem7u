	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelpDarkenerOnHBlank
SubtitleHelpDarkenerOnHBlank: @ 0x0803240C
	ldr r0, _08032434 @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	subs r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bls _08032440
	ldr r2, _08032438 @ =0x04000050
	ldr r1, _0803243C @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strb r0, [r2]
	b _08032460
	.align 2, 0
_08032434: .4byte 0x04000006
_08032438: .4byte 0x04000050
_0803243C: .4byte 0x030028AC
_08032440:
	ldr r0, _08032464 @ =0x08B969C2
	subs r1, #0x80
	adds r1, r1, r0
	ldr r0, _08032468 @ =0x0202BBB8
	adds r0, #0x38
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r2, r1, r0
	cmp r2, #0
	bge _08032456
	movs r2, #0
_08032456:
	ldr r0, _0803246C @ =0x04000050
	movs r1, #0xec
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
_08032460:
	bx lr
	.align 2, 0
_08032464: .4byte 0x08B969C2
_08032468: .4byte 0x0202BBB8
_0803246C: .4byte 0x04000050
