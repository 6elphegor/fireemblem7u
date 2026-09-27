	.include "macro.inc"

	.syntax unified

	thumb_func_start InitLeftAnim
InitLeftAnim: @ 0x08054330
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _08054438 @ =0x081D856C
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r1
	ldr r0, _0805443C @ =0x081D8599
	ldr r1, _08054440 @ =0x0203E02C
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, _08054444 @ =0x02000030
	ldr r0, _08054448 @ =0x081D85A4
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	rsbs r1, r1, #0
	movs r2, #0
	strh r1, [r3]
	ldr r0, _0805444C @ =0x02000034
	strh r2, [r0]
	ldr r0, _08054450 @ =0x02000028
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, _08054454 @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, _08054458 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805445C @ =0x0200F1C8
	adds r0, r1, r0
	cmp r5, #0xff
	bne _08054398
	ldr r0, _08054460 @ =0x08B9B28C
_08054398:
	adds r1, r6, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054450 @ =0x02000028
	ldr r0, _08054464 @ =0x0201FB00
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054454 @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, _08054468 @ =0x02000088
	str r0, [r2, #0x2c]
	ldr r0, _0805446C @ =0x020041C8
	str r0, [r2, #0x30]
	ldr r0, _08054470 @ =0x02000000
	str r2, [r0]
	ldr r0, _08054458 @ =0x0200005C
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805445C @ =0x0200F1C8
	adds r0, r1, r0
	cmp r2, #0xff
	bne _080543EC
	ldr r0, _08054460 @ =0x08B9B28C
_080543EC:
	mov r1, sb
	bl AnimCreate
	adds r2, r0, #0
	ldr r1, _08054450 @ =0x02000028
	ldr r0, _08054464 @ =0x0201FB00
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054454 @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, _08054468 @ =0x02000088
	str r0, [r2, #0x2c]
	ldr r0, _0805446C @ =0x020041C8
	str r0, [r2, #0x30]
	ldr r0, _08054470 @ =0x02000000
	str r2, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054438: .4byte 0x081D856C
_0805443C: .4byte 0x081D8599
_08054440: .4byte 0x0203E02C
_08054444: .4byte 0x02000030
_08054448: .4byte 0x081D85A4
_0805444C: .4byte 0x02000034
_08054450: .4byte 0x02000028
_08054454: .4byte 0x0200002C
_08054458: .4byte 0x0200005C
_0805445C: .4byte 0x0200F1C8
_08054460: .4byte 0x08B9B28C
_08054464: .4byte 0x0201FB00
_08054468: .4byte 0x02000088
_0805446C: .4byte 0x020041C8
_08054470: .4byte 0x02000000
