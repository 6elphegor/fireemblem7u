	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E25C
sub_0809E25C: @ 0x0809E25C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	ldr r4, _0809E354 @ =0x03002870
	movs r2, #1
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl EnablePalSync
	ldr r0, _0809E358 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0809E35C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0809E360 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0809E364 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl DrawUiFrame2
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, _0809E368 @ =0x0201440C
	movs r4, #2
_0809E32C:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809E32C
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x34]
	bl sub_0809DFC4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809E36C
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809E38E
	.align 2, 0
_0809E354: .4byte 0x03002870
_0809E358: .4byte 0x02022C60
_0809E35C: .4byte 0x02023460
_0809E360: .4byte 0x02023C60
_0809E364: .4byte 0x02024460
_0809E368: .4byte 0x0201440C
_0809E36C:
	movs r0, #5
	movs r1, #0x11
	bl sub_0809D7B4
	ldr r0, _0809E398 @ =InitPassword
	bl ModifyPassword
	ldr r0, _0809E39C @ =0x0201440C
	ldr r1, _0809E3A0 @ =0x08CC5ACC
	bl PrintPassword
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	str r0, [r6, #0x2c]
_0809E38E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E398: .4byte InitPassword
_0809E39C: .4byte 0x0201440C
_0809E3A0: .4byte 0x08CC5ACC
